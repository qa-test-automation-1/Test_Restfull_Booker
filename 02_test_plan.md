# Test Plan – Restful Booker Platform
=================================================
<br>
<br>
<br>
## 1. Cel dokumentu

Celem dokumentu jest określenie zakresu, podejścia, środowiska oraz kryteriów
testowania aplikacji Restful Booker Platform.

Testy mają na celu weryfikację poprawności działania aplikacji webowej oraz
udostępnianego przez nią API, a także ocenę zachowania API pod obciążeniem.

---

## 2. Cel testów

### 2.1 Aplikacja

**Nazwa:** Restful Booker Platform

**URL:** https://automationintesting.online/

Aplikacja jest systemem webowym przeznaczonym do obsługi rezerwacji
w obiekcie noclegowym.

Zakres funkcjonalny aplikacji obejmuje m.in.:

- logowanie,
- wyświetlanie pokoi,
- przeglądanie informacji o pokojach,
- tworzenie rezerwacji,
- obsługę danych rezerwacji.

### 2.2 API

Aplikacja udostępnia REST API wykorzystywane do komunikacji z backendem.

**API Base URL:**

`https://automationintesting.online/api/`

Dokumentacja API jest dostępna za pomocą Swagger UI.
https://automationintesting.online/api/booking/swagger-ui/index.html 
[https://automationintesting.online](https://www.postman.com/automation-in-testing/restful-booker-collections/collection/55eh7vh/restful-booker?sideView=agentMode)

API będzie testowane niezależnie od interfejsu użytkownika.

---

## 3. Cele testów

Główne cele testów:

- sprawdzenie poprawności działania kluczowych funkcji aplikacji,
- sprawdzenie poprawności komunikacji poprzez REST API,
- weryfikacja kodów odpowiedzi HTTP,
- weryfikacja struktury i zawartości odpowiedzi API,
- sprawdzenie obsługi poprawnych i niepoprawnych danych wejściowych,
- sprawdzenie podstawowych scenariuszy związanych z rezerwacjami,
- określenie zachowania API pod zwiększonym obciążeniem.
- sprawdzenie podstawowych podatności na ataki

---

## 4. Zakres testów

### 4.1 Testy UI

W ramach testów interfejsu użytkownika zostaną zweryfikowane m.in.:

- wyświetlanie strony głównej,
- logowanie,
- wyświetlanie listy pokoi,
- wyświetlanie szczegółów pokoju,
- tworzenie rezerwacji,
- walidacja formularzy,
- obsługa niepoprawnych danych.

Testy UI będą automatyzowane przy użyciu **Playwright**.

---

### 4.2 Testy API

Testy API obejmą:

- autoryzację,
- pobieranie danych,
- tworzenie danych,
- aktualizację danych,
- częściową aktualizację danych,
- usuwanie danych,
- walidację kodów HTTP,
- walidację odpowiedzi JSON,
- walidację wymaganych pól,
- obsługę niepoprawnych danych wejściowych.

Testy API będą przygotowane w **Postman** i uruchamiane automatycznie
przy użyciu **Newman**.

---

### 4.3 Testy wydajnościowe

Testy wydajnościowe będą koncentrować się na API.

Sprawdzane będą m.in.:

- czas odpowiedzi,
- throughput,
- liczba błędów,
- response time percentiles,
- zachowanie API przy zwiększonym obciążeniu.

Testy zostaną przygotowane i wykonane przy użyciu **Apache JMeter**.

---

### 4.4 Testy bezpieczeństwa

Testy bezpieczeństwa będą koncentrować się na identyfikacji podstawowych
podatności aplikacji webowej oraz API.

W ramach testów zostaną sprawdzone m.in.:

- podstawowe podatności aplikacji webowej,
- podatności związane z obsługą żądań HTTP,
- nieprawidłowe nagłówki bezpieczeństwa,
- problemy związane z konfiguracją aplikacji,
- podstawowe podatności API,
- potencjalne problemy związane z walidacją danych wejściowych,
- informacje ujawniane przez aplikację,
- podstawowe podatności zgodne z OWASP Top 10.

Testy bezpieczeństwa będą wykonywane przy użyciu **OWASP ZAP (Zed Attack Proxy)**.

OWASP ZAP będzie wykorzystywany do automatycznego skanowania aplikacji
webowej oraz wybranych endpointów API.

Wyniki skanowania będą zapisywane w formie raportów i przechowywane
w katalogu:

`reports/owasp/`


---


## 5. Poza zakresem

Poza zakresem projektu znajdują się:

- testy infrastruktury serwera,
- testy bezpieczeństwa typu penetration testing,
- testy aplikacji mobilnej,
- testy kompatybilności ze wszystkimi możliwymi urządzeniami,
- testy obciążeniowe interfejsu użytkownika,
- testy produkcyjnej infrastruktury serwerowej.

---

## 6. Strategie testowania

Projekt będzie wykorzystywał następujące rodzaje testów:

| Rodzaj testu | Narzędzie | Cel |
|---|---|---|
| UI Testing | Playwright | Weryfikacja działania interfejsu |
| API Testing | Postman | Manualne/projektowe testowanie API |
| API Automation | Newman | Automatyczne wykonywanie kolekcji Postman |
| Performance Testing | JMeter | Testowanie zachowania API pod obciążeniem |
| Security Testing | OWASP ZAP | Automatyczne wykrywanie podstawowych podatności aplikacji i API |
| CI Automation | GitHub Actions | Automatyczne uruchamianie testów |

---

## 7. Środowisko testowe

### Application

**Restful Booker Platform**

`https://automationintesting.online/`

### API

`https://automationintesting.online/api/`

### Narzędzia

- Visual Studio Code
- Git
- GitHub
- Postman
- Newman
- Apache JMeter
- Playwright
- Docker
- GitHub Actions

---

## 8. Przypadki testowe

Projekt będzie zawierał:

### UI

Przykładowe obszary testowe:

- logowanie,
- wyświetlanie pokoi,
- rezerwacja pokoju,
- walidacja formularza,
- obsługa błędnych danych.

### API

Przygotowanych zostanie 5 głównych przypadków testowych:

- test autoryzacji,
- pobranie danych,
- utworzenie danych,
- aktualizacja danych,
- usunięcie danych.

Szczegółowe przypadki testowe zostaną opisane w:

`02_test_case_postman.md`

### Performance

Przygotowanych zostanie 5 scenariuszy wydajnościowych.

Szczegółowe scenariusze zostaną opisane w:

`03_test_case_jmeter.md`

---

## 9. Kryteria wejścia

Testy mogą rozpocząć się, gdy:

- aplikacja jest dostępna,
- API jest dostępne,
- wymagane endpointy są dostępne,
- środowisko testowe jest skonfigurowane,
- przygotowano przypadki testowe,
- wymagane narzędzia są zainstalowane.

---

## 10. Kryteria wyjścia

Testowanie może zostać zakończone, gdy:

- zaplanowane przypadki testowe zostały wykonane,
- wyniki testów zostały zarejestrowane,
- znalezione błędy zostały udokumentowane,
- wykonano zaplanowane testy API,
- wykonano zaplanowane testy wydajnościowe,
- przygotowano raport z testów.

---

## 11. Dane testowe

Dane testowe będą obejmowały m.in.:

- dane użytkowników,
- dane autoryzacyjne,
- dane pokoi,
- dane rezerwacji,
- poprawne dane wejściowe,
- niepoprawne dane wejściowe,
- dane graniczne.

Dane testowe powinny być oddzielone od danych produkcyjnych.

---

## 12. Raportowanie

Wyniki testów będą przechowywane w repozytorium Git.

Planowana struktura raportowania:

```text
reports/
├── postman/
├── jmeter/
└── playwright/
└── owasp/

