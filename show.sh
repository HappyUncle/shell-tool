#!/bin/bash


#-------------------------
# 显示当前目录下文件内容
#-------------------------

displayFileCont() {  

  for file in $(ls)
  do    
    if [ -f $file ]
    then
      if [ "$file" != $(basename $0) ]; then
        echo "[$file]"
        cat $file
        echo -e "\n\n"      
      fi
    fi
  done
}



#-------------------------
# 获取当前目录下的文件夹
#-------------------------

getDir() {
  echo $(ls -F | grep /)
}



#-------------------------
# 判断当前目录下是否存在文件夹
#-------------------------

hasDir() {
  for file in $(ls)
  do
    if [ -d $file ]
    then
      return 1
    fi
  done

  return 0
}



#-------------------------
# 显示所有文件内容
#-------------------------

displayFile() {
  displayFileCont
  
  hasDir
  if [ $? == 0 ]
  then
    cd ..
    return
  fi
  
  dir="$(getDir)"  
  
  for d in $dir
  do    
    cd $d
    displayFile	
  done
  
  cd ..

}



#-------------------------
# 主函数
#-------------------------

main() {
  displayFile
}

main
