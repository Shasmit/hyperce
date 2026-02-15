# Ticket Booking App (Flutter) — Seat Selection

A Flutter seat selection app built using **Clean Architecture**, **Bloc (flutter_bloc)**, and **Dependency Injection (GetIt)**.  
Data is fetched via **GraphQL** (mocked locally using a custom Link) and rendered dynamically to support different seat layouts.

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
git clone https://github.com/Shasmit/hyperce.git
cd hyperce
```

---

## Assumptions & Decisions

### Assumptions

- The backend GraphQL schema was not provided; therefore, vehicle seat layouts are mocked locally using JSON assets.
- The `vehicleId` parameter determines which vehicle layout should be loaded.
- Seat pricing is defined on a **per-seat basis** and is included in the layout payload.
- Booked seats are **non-selectable** and visually distinguished from available seats.

### Technical Decisions

#### GraphQL Mock Integration

- Implemented `graphql_flutter` with a custom **LocalMockLink** to simulate real GraphQL responses.
- This keeps the app ready for seamless backend integration in the future.

#### Architecture

- Adopted **Clean Architecture** to ensure:
  - Scalability
  - Maintainability
  - Clear separation of concerns (Data → Domain → Presentation)

#### State Management

- Used **Bloc (flutter_bloc)** with the event/state pattern.
- This provides predictable state flow and improves testability.

#### Dependency Injection

- Implemented **GetIt** as a service locator.
- All blocs, datasources, repositories, and use cases are registered through a centralized DI container for consistency and scalability.
