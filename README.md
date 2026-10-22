# Simulasi Monte Carlo Ketidakpastian Probabilitas pada Penjualan Mainan Edukasi Study Case CV Omochatoys

## Deskripsi Simulasi dan Pemodelan

Proyek ini memodelkan estimasi jumlah pesanan harian menggunakan variabel acak diskret dengan aturan interval nilai acak R:

- R < 0.20: Kategori Sepi (1 pesanan)
- 0.20 <= R < 0.70: Kategori Normal (4 pesanan)
- R >= 0.70: Kategori Ramai (7 pesanan)

Simulasi dijalankan selama 10 hari untuk menghitung total pesanan dan rata-rata pesanan harian.

## Sumber Data

Data yang digunakan adalah data sintetis berupa 10 bilangan acak terdistribusi seragam: 0.12, 0.45, 0.82, 0.31, 0.67, 0.08, 0.91, 0.54, 0.73, dan 0.26.

## Bahasa Pemrograman

Bahasa pemrograman yang digunakan adalah R.

## Prosentase Keterlibatan Tools AI

- Persentase AI: 1%
- Pembuktian Kontribusi:
  - 99% Kontribusi Mandiri: Pembuatan logika pemodelan, pembagian interval probabilitas, pengujian eksekusi program di RStudio, dan analisis hasil rata-rata.
  - 1% Kontribusi AI: Pemeriksaan sintaksis fungsi ifelse bersarang dan perapihan format luaran sprintf.
