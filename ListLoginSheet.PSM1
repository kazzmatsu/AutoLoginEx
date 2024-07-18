using namespace System
using namespace System.IO
using namespace System.Text
using namespace System.Console
using namespace System.Collections
using namespace System.Collections.Generic
using module    ".\DefineLoginSheet.PSM1"
####################################################################################
class LoginSheet : List[DefineLoginSheet]
{
  [int]$ColNum
  [int]$RowNum
  LoginSheet ( )  {  }
  LoginSheet ( [object]$LstTbl )
  {
    $this.GetCounters( $LstTbl )
    $this.MakeCollection( $LstTbl )
  }
  GetCounters( [object]$LstTbl )
  {
    $This.RowNum = [int]$LstTbl.GetLength(0)
    $This.ColNum = [int]$LstTbl.GetLength(1)
  }
  [void]MakeCollection( [object[,]]$LstTbl )
  {
    1..$This.RowNum | %{
      if (  $_  -gt 1 ){ # Ignore the first Record 
        $this.Add( [DefineLoginSheet]::new( "$($LstTbl[ $_ ,[TTMS]::No])",
                                            "$($LstTbl[ $_ ,[TTMS]::Category])",
                                            "$($LstTbl[ $_ ,[TTMS]::hostname])",
                                            "$($LstTbl[ $_ ,[TTMS]::IPAddress])",
                                            "$($LstTbl[ $_ ,[TTMS]::LoginUser])")
        )
      }
    }
  }
  [string]ToString()
  {
    return "$($this.RowNum) $($this.ColNum)"
  }
}
####################################################################################
  <#
    PS PowerShell.Core\FileSystem::\\AutoLoginEx> $a = [loginsheet]::new()
    PS PowerShell.Core\FileSystem::\\AutoLoginEx> $a
    PS PowerShell.Core\FileSystem::\\AutoLoginEx> $a.add( [DefineLoginSheet]::new("12","2","3","4","5"))
    PS PowerShell.Core\FileSystem::\\AutoLoginEx> $a
    No        : 12
    Category  : 2
    hostname  : 3
    IPAddress : 4
    LoginUser : 5
    PS PowerShell.Core\FileSystem::\\AutoLoginEx>
  #>
####################################################################################
enum DefFiles 
{
  TetaTermMacro
  Common
  PASDAT
  DAT
  LOG
}
####################################################################################
enum TTMS
{
  No        = 1
  Category  = 2
  hostname  = 3
  IPAddress = 4
  LoginUser = 5
}
####################################################################################
enum LayerCategory
{
  LB
  L2SW
  L3SW
}
####################################################################################
enum TTMCMD
{
  LBCMD
  L2CMD
  L3CMD
  ENCPASS
}
####################################################################################
