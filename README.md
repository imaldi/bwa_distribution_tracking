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

    Note tentang generate Hive Adapter dari Freezed Class:
    Kalau mau create Adapter dari class freezed, pertama tulis saja dulu mixins-
    nya dengan tambahan _ setelah dolar, contoh:
    class ExampleModel with _$_ExampleModel{}
    lalu setelah tergenerate, hapus saja _ tambahan tadi jadi
    class ExampleModel with _$ExampleModel{}

    gunakan build_runner watch supaya tidak perlu jalankan build berulang2
    

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
- Buat Flavor
