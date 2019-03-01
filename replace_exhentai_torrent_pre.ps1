# 去掉exhentai下载种子的{EHT PERSONALIZED TORRENT - DO NOT REDISTRIBUTE}前缀
$ps_path = $MyInvocation.MyCommand.Definition
$ps_path = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $ps_path

foreach ($i in (get-childitem `{*))
{
    $i | Rename-Item -newname { $_.name -replace "{EHT PERSONALIZED TORRENT - DO NOT REDISTRIBUTE} ",""}
    $i | Format-List -Property Name

}
