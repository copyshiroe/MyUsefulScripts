# 更新 bt-tracker 到 qBittorrent
$merged = 'merged.txt'
$ConfigFile = "$env:APPDATA\qBittorrent\qBittorrent.ini"
# write-host $ConfigFile

# 下载tracker
Invoke-WebRequest -Uri 'https://torrents.me/tracker-list/?download=latest' -OutFile 'trackers_last.txt'
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt' -OutFile 'trackers_all.txt'
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all_ip.txt' -OutFile 'trackers_all_ip.txt'

# 合并 txt
get-content trackers_all_ip.txt,trackers_last.txt,trackers_all.txt | out-file $merged

# 去空行和重复行 
(gc $merged) | ? {$_.trim() -ne "" } | Select-Object -Unique | set-content $merged

# 合并tracker为一行 
$TrackersList = 'Bittorrent\TrackersList='
foreach($l in (gc $merged))
{
    $TrackersList += $l + '\n' 
}

# 更新到 $env:APPDATA\qBittorrent\qBittorrent.ini
(gc $ConfigFile) | % { $_ -replace "^Bittorrent\\TrackersList=.*$", $TrackersList } | set-content $ConfigFile

# pause
remove-item trackers_last.txt, trackers_all.txt, trackers_all_ip.txt, $merged
