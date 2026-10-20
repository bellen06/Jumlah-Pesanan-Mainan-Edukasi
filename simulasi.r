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
