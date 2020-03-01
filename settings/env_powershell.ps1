function global:env_acs37 
{
      #$Env:path="C:\Users\hwang29\work\src\toolchains\Python37-32;"+$Env:Path
      #$Env:path="C:\Users\hwang29\work\src\toolchains\Python37-32\Scripts;"+$Env:Path
      #$Env:path="C:\Users\hwang29\AppData\Local\Programs\Python\Python37-32;"+$Env:Path
      #$Env:path="C:\Users\hwang29\AppData\Local\Programs\Python\Python37-32\Scripts;"+$Env:Path
      
      $env:path = $env:path.replace('Python24','Python37-32')
      $Env:pylibrary='C:\Users\hwang29\work\src\perforce\depot\ADT\main\ACS53_Improve_Python\library\pyLibrary'
      $Env:ptm_path="C:\Users\hwang29\work\src\perforce\depot\ADT\main\ACS53_Improve_Python\library\pyLibrary\PTMLib"      
      $Env:acs37='C:\Users\hwang29\work\src\perforce\depot\ADT\main\ACS53_Improve_Python'
      cd $Env:acs37
}
function global:env_acs24 
{
      #$Env:path=$Env:Path+";C:\Users\hwang29\work\src\toolchains\Python24"
      #$Env:path=$Env:Path+";C:\Users\hwang29\work\src\toolchains\Python24\Scripts"
 
      $env:path = $env:path.replace('Python37-32','Python24')
      del Env:pylibrary
      $Env:pylibrary='C:\Users\hwang29\work\src\perforce\depot\ADT\main\ACS53_ImproveAmara\library\pyLibrary'
      $Env:ptm_path="C:\Users\hwang29\work\src\perforce\depot\ADT\main\ACS53_ImproveAmara\library\pyLibrary\PTMLib"
      
      $Env:acs24='C:\Users\hwang29\work\src\perforce\depot\ADT\main\ACS53_ImproveAmara'
      cd $Env:acs24
     
}
