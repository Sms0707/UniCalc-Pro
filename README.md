UniCalc Pro 🧮

UniCalc Pro is a sophisticated, mobile-first advanced calculus application designed for university-level mathematics. It pairs a beautiful, responsive Flutter frontend with a powerful Python (FastAPI + SymPy) backend to compute complex equations, verify theorems, and provide step-by-step mathematical proofs.

✨ Features

Comprehensive Math Domains: Supports Normal Calculus, Limits, Integration (Single, Double, Triple), ODEs, PDEs, Vector Calculus, Laplace Transforms, and Complex Analysis.

Theorem Verification Engine: Specialized UI and logic to verify advanced theorems (e.g., Green's Theorem, Stoke's Theorem) with selectable path orientations and surface normals.

Step-by-Step Solutions: Doesn't just give the final answer. The history modal breaks down the exact mathematical derivation (LHS vs. RHS).

Premium UI/UX: Built with Flutter, featuring a sleek, textbook-style aesthetic with full Dark Mode and Light Mode support.

Calculation History: A seamless slide-out drawer to keep track of past computations.

🛠️ Tech Stack

Frontend: Flutter (Dart)

Backend: FastAPI (Python)

Math Engine: SymPy (Python)

🚀 Getting Started

To run this project locally, you will need to start both the Python backend server and the Flutter mobile application.

1. Backend Setup (FastAPI & SymPy)

The backend handles all the heavy mathematical lifting using SymPy.

Navigate to the backend directory:

cd backend


Install the required Python dependencies:

pip install fastapi uvicorn sympy pydantic


Start the server using Uvicorn:

uvicorn main:app --reload


The backend will now be running at http://localhost:8000. You can view the interactive API docs at http://localhost:8000/docs.

2. Frontend Setup (Flutter)

The frontend provides the interactive mobile UI.

Ensure you have Flutter installed on your machine.

Navigate to the root of the Flutter project:

cd unicalc_pro


Fetch the Flutter dependencies:

flutter pub get


Run the app on your connected device or emulator:

flutter run


📡 Architecture Note

Currently, the application requires an active internet connection to compute new problems, as the frontend sends mathematical inputs to the external FastAPI server for processing via SymPy.

🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the issues page if you want to contribute.

📝 License

This project is licensed under the MIT License.
