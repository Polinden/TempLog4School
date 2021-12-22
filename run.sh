
if ! command -v git &> /dev/null
then if ! command -v docker &> /dev/null
then
   git clone https://github.com/Polinden/TempLog4School.git
   cd TempLog4School
   ./run4docker
else 
   echo "Install docker first!"
fi
else 
   echo "Install docker first!"
fi

