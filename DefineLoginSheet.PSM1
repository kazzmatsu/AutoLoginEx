using namespace System.Text
using namespace System.Collections
using namespace System.Collections.Generic
####################################################################################
class DefineLoginSheet
{
  [string]$No
  [string]$Category
  [string]$hostname
  [string]$IPAddress
  [string]$LoginUser
  DefineLoginSheet( )  {}
  DefineLoginSheet( [object[,]]$ListTable )
  {
    
  }
  DefineLoginSheet( [string]$No, [string]$Category, [string]$hostname, [string]$IPAddress, [string]$LoginUser )
  {
    $this.No        = $No
    $this.Category  = $Category
    $this.hostname  = $hostname
    $this.IPAddress = $IPAddress
    $this.LoginUser = $LoginUser
  }
  [string] ToString() {
    return "$($this.No) $($this.Category) $($this.hostname) $($this.IPAddress) $($this.LoginUser)"
  }
}
####################################################################################
class EncTable
{
  [int]$tNo
  [string]$User
  [string]$EncPass
  EncTable ( ) { }
  EncTable ( [int]$tNo, [string]$User, [string]$EncPass )
  {
    this.tNo      = $tNo
    this.User     = $User
    this.EncPass  = $EncPass
  }
}
####################################################################################
class CmdTable
{
  [int]$No
  [string]$Send
  [string]$Wait
  CmdTable ( ) { }
  CmdTable ( [int]$No, [string]$Send, [string]$Wait )
  {
    this.No    = $No
    this.Send  = $Send
    this.Wait  = $Wait
  }
}
####################################################################################
