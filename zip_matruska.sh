#!/bin/bash

# ZIP dosyasının başlangıç yolu
zip_file="/home/kerim/Downloads/matryoshka_bash.zip"
output_dir="/tmp/matryoshka_output"

# Çıktı dizinini temizleyip oluştur
rm -rf "$output_dir"
mkdir -p "$output_dir"

# İlk ZIP dosyasını kopyala
cp "$zip_file" "$output_dir/initial.zip"

# ZIP dosyalarını iç içe aç
while true; do
    # Geçerli ZIP dosyasının adını al
    current_zip=$(find "$output_dir" -name "*.zip" | head -n 1)

    if [ -z "$current_zip" ]; then
        echo "Tüm dosyalar açıldı veya yeni bir ZIP dosyası bulunamadı."
        break
    fi

    echo "Açılıyor: $current_zip"

    # Yeni bir dizine çıkar
    unzip -q "$current_zip" -d "$output_dir"
    rm "$current_zip"  # Eski ZIP dosyasını kaldır
done

echo "Tüm dosyalar açıldı. Çıktı dizini: $output_dir"
