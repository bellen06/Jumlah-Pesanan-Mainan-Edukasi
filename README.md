# Simulasi dan Pemodelan: Ketidakpastian Probabilitas pada Penjualan Mainan Edukasi (Studi Kasus: CV Omochatoys)

**Oleh:** Rahma Dewinta  
**Mata Kuliah:** Sistem Pemodelan (Tugas 2)

---

## 1. Deskripsi Simulasi dan Pemodelan Proyek

Dalam operasional bisnis penjualan mainan edukasi di CV Omochatoys, jumlah pesanan harian yang masuk bersifat fluktuatif dan mengandung ketidakpastian. Oleh karena itu, diperlukan pendekatan simulasi untuk memperkirakan volume pesanan guna membantu perencanaan persediaan dan operasional harian.

Proyek ini bertujuan untuk memodelkan ketidakpastian permintaan pelanggan harian menggunakan **Simulasi Monte Carlo** berbasis variabel acak diskret, serta menghitung proyeksi **Total Pesanan ($T$)** dan **Rata-rata Pesanan Harian ($\bar{X}$)** selama periode pengamatan 10 hari.

Pemodelan dilakukan dengan memetakan nilai bilangan acak ($R$) yang terdistribusi seragam pada rentang $[0, 1)$ ke dalam 3 kategori permintaan harian beserta nilai jumlah pesanannya ($X_i$):

1. **Kategori Sepi ($X = 1$):** Terjadi apabila nilai bilangan acak berada pada interval $0 \le R < 0.20$ (Probabilitas: $0.20$, Jumlah pesanan: $1\text{ pesanan}$).
2. **Kategori Normal ($X = 4$):** Terjadi apabila nilai bilangan acak berada pada interval $0.20 \le R < 0.70$ (Probabilitas: $0.50$, Jumlah pesanan: $4\text{ pesanan}$).
3. **Kategori Ramai ($X = 7$):** Terjadi apabila nilai bilangan acak berada pada interval $0.70 \le R < 1.00$ (Probabilitas: $0.30$, Jumlah pesanan: $7\text{ pesanan}$).

### Rumus Pemodelan Matematis

Akumulasi total pesanan dan rata-rata pesanan per hari selama 10 hari simulasi dihitung menggunakan rumus berikut:

$$T = \sum_{i=1}^{10} X_i$$

$$\bar{X} = \frac{T}{10}$$

Dari hasil pemodelan dan operasi perhitungan simulasi selama 10 hari, didapatkan nilai total pesanan $T = 43\text{ pesanan}$ dan nilai rata-rata $\bar{X} = 4.3\text{ pesanan}$ per hari. Artinya, berdasarkan distribusi bilangan acak pada periode pengamatan tersebut, rata-rata jumlah pesanan harian yang diharapkan di CV Omochatoys adalah **4.3 pesanan per hari**.

---

## 2. Sumber Data

Data yang digunakan dalam pemodelan dan simulasi ini merupakan **Data Sintetis** berupa 10 bilangan acak terdistribusi seragam (*uniformly distributed random numbers*): `0.12, 0.45, 0.82, 0.31, 0.67, 0.08, 0.91, 0.54, 0.73, dan 0.26`.

### Tabel Aturan Interval Probabilitas

| Kategori Permintaan | Probabilitas ($P_i$) | Interval Bilangan Acak ($R$) | Jumlah Pesanan ($X_i$) |
| :------------------ | :------------------: | :--------------------------: | :--------------------: |
| Sepi                |        $0.20$        |       $0 \le R < 0.20$       |     $1\text{ Pesanan}$     |
| Normal              |        $0.50$        |     $0.20 \le R < 0.70$      |     $4\text{ Pesanan}$     |
| Ramai               |        $0.30$        |     $0.70 \le R < 1.00$      |     $7\text{ Pesanan}$     |
| **TOTAL**           |      **$1.00$**      |                              |                        |

### Tabel Hasil Simulasi 10 Hari

| Hari ($i$) | Bilangan Acak ($R$) | Kategori | Pesanan ($X_i$) |
| :--------: | :-----------------: | :------- | :-------------: |
|     1      |       $0.12$        | Sepi     |       $1$       |
|     2      |       $0.45$        | Normal   |       $4$       |
|     3      |       $0.82$        | Ramai    |       $7$       |
|     4      |       $0.31$        | Normal   |       $4$       |
|     5      |       $0.67$        | Normal   |       $4$       |
|     6      |       $0.08$        | Sepi     |       $1$       |
|     7      |       $0.91$        | Ramai    |       $7$       |
|     8      |       $0.54$        | Normal   |       $4$       |
|     9      |       $0.73$        | Ramai    |       $7$       |
|     10     |       $0.26$        | Normal   |       $4$       |
| **TOTAL ($T$)** |                |          |     **$43$**    |
| **RATA-RATA ($\bar{X}$)** |      |          |    **$4.3$**    |

---

## 3. Bahasa Pemrograman yang Digunakan

Proyek pemodelan dan perhitungan ini diimplementasikan menggunakan:

- **Bahasa Pemrograman:** **R** (menggunakan fungsi logika dasar `ifelse` bersarang, komputasi vektor, dan `data.frame` bawaan R tanpa *library* eksternal tambahan).
- **Environment / Tools:** RStudio / R Console.

### Cuplikan Kode Simulasi (`simulasi.r`)

```R
hari <- 1:10
R <- c(0.12, 0.45, 0.82, 0.31, 0.67, 0.08, 0.91, 0.54, 0.73, 0.26)

kategori <- ifelse(R < 0.20, "Sepi",
  ifelse(R < 0.70, "Normal", "Ramai")
)

pesanan_X <- ifelse(R < 0.20, 1,
  ifelse(R < 0.70, 4, 7)
)

tabel_simulasi <- data.frame(
  Hari = hari,
  Bilangan_Acak_R = R,
  Kategori = kategori,
  Pesanan_X = pesanan_X
)

print("Tabel Hasil Simulasi Pesanan Harian:")
print(tabel_simulasi)

total_pesanan_T <- sum(tabel_simulasi$Pesanan_X)
rata_rata_pesanan <- total_pesanan_T / 10

cat("\n--- Ringkasan Perhitungan ---\n")
cat(sprintf("Total pesanan selama 10 hari (T) : %d\n", total_pesanan_T))
cat(sprintf("Rata-rata pesanan harian (X_bar) : %.1f\n", rata_rata_pesanan))
```

---

## 4. Persentase Keterlibatan Tools AI & Pembuktian

**Persentase Penggunaan AI:** **1%** (Maksimal batas ketentuan: 20%)

### Rincian Pembagian Pengerjaan (99% Mandiri vs 1% AI):

- **Pengerjaan Mandiri (99%):**
  1. Menentukan topik studi kasus (estimasi pesanan harian mainan edukasi pada CV Omochatoys).
  2. Menyusun logika pemodelan dan pembagian interval probabilitas variabel acak diskret ($R < 0.20$, $0.20 \le R < 0.70$, dan $R \ge 0.70$).
  3. Melakukan pengujian eksekusi program di RStudio serta melakukan perhitungan dan analisis hasil rata-rata pesanan harian.
  4. Menyusun laporan lengkap studi kasus (`Tugas 2 Sistem Pemodelan_Rahma Dewinta.pdf`).
- **Bantuan Tools AI (1%):**
  1. Pemeriksaan sintaksis fungsi `ifelse` bersarang (*nested ifelse*) pada bahasa R.
  2. Perapihan format luaran (*output*) menggunakan fungsi `sprintf` dan dokumentasi struktur `README.md`.

### Bukti Keterlibatan AI (Transparansi & Verifikasi):

**Dokumen Orisinal & Hasil Pemindaian AI:** Terlampir file `Tugas 2 Sistem Pemodelan_Rahma Dewinta.pdf` yang berisi konsep pemodelan serta perhitungan lengkap yang disusun secara mandiri, bersama dengan bukti verifikasi pemindaian pada file `GPTZero AI Scan - Tugas 2 Sistem Pemodelan_Rahma Dewinta.docx.pdf`.

---

## Struktur File Repositori

- `README.md` - Dokumentasi utama pelaporan proyek di GitHub (untuk presensi dan penilaian).
- `Tugas 2 Sistem Pemodelan_Rahma Dewinta.pdf` - Dokumen laporan studi kasus dan perhitungan matematis pemodelan.
- `simulasi.r` - File kode program dalam bahasa R untuk menjalankan perhitungan simulasi model.
- `GPTZero AI Scan - Tugas 2 Sistem Pemodelan_Rahma Dewinta.docx.pdf` - Dokumentasi hasil pemindaian orisinalitas GPTZero.