# 祝日ファイルダウンロード
Invoke-WebRequest -Uri "https://www8.cao.go.jp/chosei/shukujitsu/syukujitsu.csv" -OutFile .\syukujitsu_kyujitsu.csv
# CSV 読み込み
$syukujitsu_kyujitsu_csv = Import-Csv .\syukujitsu_kyujitsu.csv -Delimiter "`t" -Encoding Default -Header "day"
#今日の日付
$today = (Get-Date).ToString("yyyy/M/d") 
Write-output "本日の日付： $today "
#日付マッチング
foreach ($holiday in $syukujitsu_kyujitsu_csv.day )
{
 #$holiday.Substring(0, $holiday.IndexOf(','))
 if ($holiday.Substring(0, $holiday.IndexOf(',')) -eq $today)
 {
    Write-output "今日は祝日です。"
    exit
 }
} 
    Write-output "今日は平日です。"
