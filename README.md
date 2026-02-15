# Ticket Booking App (Flutter) — Seat Selection

A Flutter seat selection app built using **Clean Architecture**, **Bloc (flutter_bloc)**, and **Dependency Injection (GetIt)**.  
Data is fetched via **GraphQL** (mocked locally using a custom Link) and rendered dynamically to support different seat layouts (e.g., 2+2, 1+2).

---

## Features

- Dynamic seat layout rendering from JSON (supports multiple layout types)
- Seat states:
  - Available
  - Selected
  - Booked (non-selectable)
- Sticky footer showing:
  - Selected seat numbers
  - Total price (real-time)
- Clean Architecture layering: `data` → `domain` → `presentation`
- State management using Bloc (event/state pattern)
- Dependency injection using GetIt (service locator)

---

## Setup Instructions

### 1) Prerequisites

- Flutter SDK installed
- Dart SDK (comes with Flutter)
- A simulator/emulator or physical device

### 2) Clone the repository

```bash
git clone <YOUR_GITHUB_REPO_LINK>
cd <PROJECT_FOLDER>
```
