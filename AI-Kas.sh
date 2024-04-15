#!usr/bin/perl
#author: prakasa putra
#saya membuat tools ini karena saya ingin mencobanya, karena web ini menampilkan data JSON yang seharusnya tersimpan rapih pada API nya.
#yang menemukan bug pada data JSON web AI CNEKO adalah Mas Willy.

cls || clear #menghapus semua tampilan untuk windows & linux
echo "----------------------------------------"
echo "  Author: Prakasa Putra | IG: akas_644  "
echo " AI-Kas is tool Artificial Intelligence "
echo "----------------------------------------"
echo "╭─prakasap05@AI-Kas:Message AI-Kas"
read -p "╰─$ " promptkas #menginput kata-kata perintah atau prompt kamu

#mengubah spasi dari kata perintah atau prompot menjadi tanda tambah (+) pada URL
akas_query=$(echo "$promptkas" | sed 's/ /+/g')

#mengambil data dari URL menggunakan curl
json=$(curl -s "https://chat.ai.cneko.org/?t=$akas_query&p=null")

#membersihkan karakter non-printable dari JSON menggunakan sed
json_clean=$(echo "$json" | sed -E 's/[^[:print:]]//g')

#memproses data JSON menggunakan jq dan menghapus * dan \n
response=$(echo "$json_clean" | jq -r '.response' | sed 's/\*//g; s/\\n//g')
source_response=$(echo "$json_clean" | jq -r '.source_response' | sed 's/\*//g; s/\\n//g')
input=$(echo "$json_clean" | jq -r '.input')
prompt=$(echo "$json_clean" | jq -r '.prompt')

#menampilkan response dari prompt yang anda ketik disini
echo "\nInput kamu: $input\nHasil response: $response"

#menampilkan response dari prompt yang anda ketik disini
echo "\nInput kamu: $input\nHasil response: $response\n"
echo "╭─prakasap05@AI-Kas:Type next to continue"
read -p "╰─$ " lanjut #menginput untuk melanjutkan AI-Kas

if [ $lanjut = "next" ] || [ $lanjut = "Next" ]
then
sh AI-Kas.sh
fi
