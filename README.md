TUGAS 7

Pertanyaan 1 : Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.

    Stateless widget adalah widget yang tidak memiliki state atau tidak dapat berubah setelah diinisialisasi. Widget ini cocok untuk tampilan yang statis dan tidak memerlukan pembaruan atau perubahan data secara dinamis.
    Contoh: Text, Icon, Image, dan semua widget yang sifatnya hanya menampilkan data tanpa perubahan.

    Stateful widget adalah widget yang memiliki state dan memungkinkan tampilan berubah saat state atau datanya diperbarui. Widget ini cocok untuk elemen interaktif yang membutuhkan pembaruan tampilan secara real-time atau dinamis.
    Contoh: Checkbox, Slider, TextField, dan widget lainnya yang berinteraksi dengan pengguna atau memperbarui data.

    Perbedaan Utama dari keduanya yaitu, stateless widget tidak memiliki state internal dan bersifat statis setelah dibuat. 
    Sedangkan stateful widget memiliki state internal yang dapat diubah, sehingga tampilan dapat diperbarui secara dinamis.


Pertanyaan 2 : Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.

    Beberapa widget yang digunakan pada proyek ini beserta fungsinya adalah:

    MaterialApp: Membuat struktur dasar aplikasi berbasis Material Design, memberikan tema, warna, dan navigasi dasar.
    Scaffold: Struktur utama halaman yang menyediakan struktur seperti AppBar, body, dan floatingActionButton.
    AppBar: Bagian atas halaman (header) yang biasanya berisi judul, ikon, atau tombol tindakan lainnya.
    Column dan Row: Widget untuk menyusun elemen secara vertikal (Column) atau horizontal (Row).
    ElevatedButton: Tombol dengan gaya material yang bereaksi saat ditekan dan dapat memiliki latar belakang berwarna.
    InkWell: Menambahkan efek ripple saat elemen ditekan, memberi efek visual pada elemen yang interaktif.
    ScaffoldMessenger dan SnackBar: ScaffoldMessenger memungkinkan pengelolaan SnackBar, yang digunakan untuk menampilkan pesan singkat di bagian bawah layar.
    Icon dan Text: Icon untuk menampilkan ikon (misalnya untuk tombol), sedangkan Text menampilkan teks.

Pertanyaan 3 : Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

    Fungsi setState():

    setState() adalah metode dalam widget Stateful yang memberitahu Flutter untuk memperbarui tampilan dengan merender ulang elemen-elemen yang berubah.
    Ketika setState() dipanggil, seluruh tampilan pada StatefulWidget akan diperiksa ulang, sehingga elemen yang terkena perubahan akan ditampilkan sesuai nilai terbarunya.

    Variabel yang terdampak yaitu,
    hanya variabel yang berada dalam kelas State dari widget tersebut yang akan terpengaruh. Biasanya variabel-variabel ini adalah variabel instance dalam State, misalnya variabel yang menyimpan teks, warna, atau kondisi tampilan yang berubah karena interaksi pengguna.

Pertanyaan 4 : Jelaskan perbedaan antara const dengan final.

    const:

        1. const digunakan untuk nilai konstan pada waktu kompilasi yang tidak akan berubah selama runtime.
        2. Dengan const, objek dibuat secara langsung pada waktu kompilasi dan tidak dapat berubah, bahkan dalam memori.
        3. const lebih terbatas karena nilai harus diketahui saat kompilasi.

    final:

        1. final adalah nilai yang tidak dapat diubah setelah diinisialisasi, tetapi nilainya bisa ditentukan saat runtime.
        2. final memungkinkan kita menetapkan nilai sekali setelah program berjalan, seperti mengambil data dari server yang nilainya akan tetap setelah diambil.
        3. final lebih fleksibel dibandingkan const, karena nilai akhir bisa ditentukan setelah program berjalan.

Pertanyaan 5 : Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.

    Step 1 : Membuat sebuah program Flutter baru dengan tema E-Commerce yang sesuai dengan tugas-tugas sebelumnya.

        Pada tahap ini, kita harus menginstal flutter terlebih dahulu, setelah itu kita dapat membuat project baru dengan command  "flutter create product-mobile", setelah itu lakukan command "cd product-mobile" lalu project pun siap dikerjakan.

    Step 2 : Membuat tiga tombol sederhana dengan ikon dan teks untuk:

        Melihat daftar produk (Lihat Daftar Produk)
        Menambah produk (Tambah Produk)
        Logout (Logout)

        Pada tahap ini, karena hanya membutuhkan icon tombol sederhana dapat mengimplementasikan kode ini :
        ```
        final List<ItemHomepage> items = [
        ItemHomepage("Lihat Daftar Produk", Icons.shopping_bag, Colors.grey),
        ItemHomepage("Tambah Produk", Icons.add, Colors.green),
        ItemHomepage("Logout", Icons.logout, Colors.red),
        ];
        ```
        Kode ini berisi list item pada home page, format dari ItemHomepage ini sendiri yaitu, "Lihat Daftar Produk" sebagai teks dari tombol, "Icons.shopping_bag" menampilkan logo/icon shopping bag pada tombol, "colors.grey" yaitu warna background dari tombol.

    Step 3 : Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Daftar Produk, Tambah Produk, dan Logout).
        
        Seperti yang sudah saya jelaskan sebelumnya, background dari setiap tombol dapat diubah dengan mengganti Colors.<warna yang kita inginkan>.

    Step 4 : Memunculkan Snackbar dengan tulisan:

        "Kamu telah menekan tombol Lihat Daftar Produk" ketika tombol Lihat Daftar Produk ditekan.
        "Kamu telah menekan tombol Tambah Produk" ketika tombol Tambah Produk ditekan.
        "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.

        Pada tahap ini, saya memberikan code ini :

        ```
        Widget build(BuildContext context) {
        return Material(
            color: item.color,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
                onTap: () {
                    String message = "";
                    switch (item.name) {
                        case "Lihat Daftar Produk":
                            message = "Kamu telah menekan tombol Lihat Daftar Produk";
                            break;
                        case "Tambah Produk":
                            message = "Kamu telah menekan tombol Tambah Produk";
                            break;
                        case "Logout":
                            message = "Kamu telah menekan tombol Logout";
                            break;
                    }
                    ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                            SnackBar(content: Text(message)),
                        );
        ```

        Alur Eksekusi
        
            1. Saat pengguna menekan tombol, fungsi onTap dipanggil.
            2. Nilai item.name dicek dalam switch, dan message disesuaikan berdasarkan nama tombol.
            3. ScaffoldMessenger menampilkan SnackBar dengan pesan yang sesuai, memberikan umpan balik instan kepada pengguna.


TUGAS 8 


Pertanyaan 1 : Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?

    Kegunaan const di Flutter yaitu const membuat objek menjadi immutable (tidak bisa diubah) dan hanya dibuat satu kali saat compile-time. Keuntungannya adalah menghemat memori dan meningkatkan performa aplikasi. Sebaiknya gunakan const pada widget atau nilai yang tidak berubah sepanjang aplikasi berjalan, tetapi hindari jika nilai tersebut bersifat dinamis.


pertanyaan 2 : Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!

    Penggunaan Column dan Row di Flutter: Column mengatur widget secara vertikal (dari atas ke bawah), sedangkan Row mengatur secara horizontal (dari kiri ke kanan).

    Contoh column :
        ```
        Column(
            children: [
                Text("Item 1"),
                Text("Item 2"),
            ],
        )
        ```

    Contoh row : 
        ```
        Row(
            children: [
                Icon(Icons.star),
                Text("Rating"),
            ],
        )
        ```

Pertanyaan 3 : Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

    Untuk elemen input pada halaman form, saya menggunakan elemen TextField untuk name, amount, dan description. Elemen input lain yang ada di Flutter tetapi tidak digunakan adalah Checkbox, Radio, Switch, dan Slider, yang sesuai untuk kebutuhan input berbeda seperti pilihan tunggal, boolean, atau nilai dalam rentang.

Pertanyaan 4 : Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

    Iya, saya telah mengimplementasikannya. Untuk mengatur tema di flutter, tema dapat diatur pada MaterialApp menggunakan ThemeData untuk mendefinisikan skema warna, font, dan tampilan lainnya. Dengan mengimplementasikan tema, tampilan aplikasi menjadi konsisten di seluruh halaman.

Pertanyaan 5 : Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

    Navigasi antar halaman dilakukan dengan Navigator.push untuk pindah ke halaman baru, dan Navigator.pop untuk kembali ke halaman sebelumnya. Pada proyek, ini memungkinkan pengguna berpindah halaman dengan lancar.
        
