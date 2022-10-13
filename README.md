# Distribution Tracking App of BWA

## Getting Started

> Readme sementara di tulis dengan bahasa Indonesia

> Jangan pakai Navigator bawaan dari Flutter, sudah pakai AutoRoute untuk navigasi
## Notes Architecture / Library yang digunakan

- State Management : bloc
- Persistence / NoSQL Database : hive
- Networking : http
- Scan Barcode : barcode_scanner2
- Routing : auto_route
- Data Class / Serializer : built_value
- Font : google_fonts


    Note: 
    - Kalau ada cara penulisan readme yang perlu diperbaiki dipersilahkan memperbaiki
    Saya hanya menulis seperlunya dulu

    Note tentang masalah generate Hive Adapter dan Auto Route dari Freezed Class:
    Kalau mau create route baru, pertama comit dulu semua model yang sudah tergenerate,
    baru setelah itu update dan generate dengan 'watch', lalu rollback folder 'model'
    
    setelah itu kalau mau tambah field baru, kasih komen saja di fieldnya yang baru itu
    pastiin adapter bener, dan kalau ada eror tambah2 atau hapus aja komen sampai solve sendiri selama watch
    comment nya tidak harus di setiap field, buat saja di atas tapi ctrl+s dan berbeda dari sebelum d generate
    pokoknya harus di gen, terus ubah lagi, baru ctrl+s lagi
    
    gunakan build_runner watch supaya tidak perlu jalankan build berulang2

    kalau mau rollback setelah gen freezed/hive, matikan dulu watch supaya ga ke gen lagi setelah rollback

    

## Application FLow:
    -> User Input 
    -> Widget adding Bloc Event to the related Bloc
    -> Bloc Event streamed
    -> Bloc responded based on the event to call the related UseCase and emitting loading state
    -> UseCase call specific Repository Method 
    -> Repository method checks Connection and choose DataSource
    -> DataSource returning the data requested
    -> Bloc emitting success/failed state based on DataSource's response
    -> Widget rebuilt based on the state emitted by Bloc

## To Do:

- Perbaiki Penggunaan Type Adapter dengan menggunakan type parameter saat register
- Pelajari dengan pasti cara kerja build runner supaya bisa exclude atau include suatu folder
- Buat Flavor
