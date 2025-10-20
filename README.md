# 🌐 NexCash

**NexCash** adalah proyek berbasis **AI-powered financial assistant** yang mengintegrasikan **Flutter**, **Flask API**, dan **DeepSeek API** untuk membantu pengguna mengelola keuangan pribadi secara cerdas dan real-time.
Proyek ini dikembangkan dengan pendekatan lintas platform — backend di-serve melalui Flask API, sedangkan antarmuka pengguna dikembangkan dengan Flutter dan di-deploy menggunakan **Vercel**.

---

## 📁 Repository Structure

```
Nexcash_Repo/
│
├── MyFlask/                   # Backend API berbasis Flask (AI-powered)
│   ├── app.py                 # Main Flask server
│   ├── requirements.txt       # Python dependencies
│   └── model/                 # Model dan endpoint AI (DeepSeek API)
│
├── flutter_app/               # Frontend aplikasi mobile Flutter
│   ├── lib/                   # Source code Flutter
│   ├── pubspec.yaml           # Flutter dependencies
│   └── assets/                # Assets UI & icons
│
├── build/app/outputs/apk/debug/
│   └── app-debug.apk          # File APK untuk instalasi langsung
│
└── README.md                  # Dokumentasi proyek
```

---

## 🚀 Tech Stack

| Layer                    | Teknologi          | Deskripsi                                                                                                                                                                                                  |
| :----------------------- | :----------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Frontend**             | **Flutter**        | Framework cross-platform untuk membangun UI dinamis dan responsif pada Android, iOS, dan web. Flutter digunakan untuk membangun tampilan utama aplikasi NexCash dan menghubungkannya dengan backend Flask. |
| **Backend API**          | **Flask (Python)** | Framework web lightweight yang digunakan untuk membangun REST API dan menangani permintaan data dari aplikasi. Mengatur komunikasi dengan DeepSeek API untuk pemrosesan bahasa alami.                      |
| **AI Service**           | **DeepSeek API**   | Model AI yang digunakan untuk menganalisis teks dan konteks finansial, memberikan rekomendasi, dan menjawab pertanyaan pengguna terkait keuangan.                                                          |
| **Hosting & Deployment** | **Vercel**         | Platform deployment serverless untuk menyajikan frontend Flutter web secara cepat, efisien, dan terintegrasi dengan CI/CD.                                                                                 |

---

## 🧠 Core Features

* 💬 **AI Chat Assistant:** Menjawab pertanyaan finansial pengguna secara natural menggunakan DeepSeek API.
* 📊 **Smart Expense Tracker:** Mendeteksi, mencatat, dan menganalisis pengeluaran secara otomatis.
* 📈 **Visualization Dashboard:** Menampilkan grafik dan statistik keuangan secara interaktif.
* 🔐 **Secure Data Handling:** Komunikasi terenkripsi antara aplikasi Flutter dan Flask backend.
* ☁️ **Cross-Platform Sync:** Data disimpan di server Flask dan dapat diakses lintas perangkat.

---

## ⚙️ Installation Guide

### 🧩 1. Instalasi Aplikasi (Android)

1. Masuk ke directory berikut:

   ```
   Nexcash_Repo\build\app\outputs\apk\debug\
   ```
2. Instal file berikut ke perangkat Android Anda:

   ```
   app-debug.apk
   ```
3. Jalankan aplikasi **NexCash** di perangkat Anda.

---

### 🖥️ 2. Menjalankan Backend Flask

1. Buka terminal di directory `MyFlask/`
2. Install dependencies:

   ```bash
   pip install -r requirements.txt
   ```
3. Jalankan server Flask:

   ```bash
   python app.py
   ```
4. Server akan berjalan di:

   ```
   http://127.0.0.1:5000/
   ```

---

### 📱 3. Menjalankan Flutter App (Development Mode)

1. Masuk ke branch `flutter_app`

   ```bash
   git checkout flutter_app
   ```
2. Install dependencies:

   ```bash
   flutter pub get
   ```
3. Jalankan aplikasi:

   ```bash
   flutter run
   ```

---

## 💼 Commercialization Plans & Future of the Project

NexCash dirancang sebagai **personal finance AI platform** yang dapat dikomersialisasikan melalui:

* **Freemium model:** Pengguna dasar gratis, fitur premium untuk analisis keuangan mendalam.
* **AI Consultation Service:** Pengguna dapat berkonsultasi langsung dengan AI tentang strategi finansial.
* **API monetization:** Menyediakan akses API untuk pengembang aplikasi finansial pihak ketiga.

### 🔮 Future Development

* Integrasi dengan **Open Banking API** untuk sinkronisasi akun bank.
* Implementasi **machine learning model lokal** untuk rekomendasi pengeluaran.
* Pengembangan **web dashboard berbasis Vercel + Flask API** untuk analisis keuangan lintas platform.

---

## 👥 Contributors

| Name                                       | Role                          | Description                                           |
| :----------------------------------------- | :---------------------------- | :---------------------------------------------------- |
| [Azmi Basri](https://github.com/Azmibasri) | Lead Developer                | Pengembang utama dan arsitek sistem                   |
| [Muhammad Aqil Mubarak](https://github.com/Eruumaa) | Research & System Integration | Pengembangan integrasi API, dokumentasi, dan UI logic |
| [Muhammad Fathir](https://github.com/Eruumaa) | System Developer & Bussiness Planner | Pengembangan sistem, kuis, dan rencana bisnis |

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---
