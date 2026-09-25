# Postman API --> Przypadki testowe

## Dokumentacja API

-  [Booking API – Swagger UI](https://automationintesting.online/api/booking/swagger-ui/index.html)]
-  [Restful Booker Platform – Postman Documentation](https://www.postman.com/automation-in-testing/restful-booker-collections/collection/ci13ds3/restful-booker-platform)



## TC-API-001 – Authentication

**Cel:**  
Sprawdzenie poprawności logowania użytkownika.

**Endpoint:**  
`POST /auth`

**Dane wejściowe:**

```json
{
  "username": "admin",
  "password": "password"
}
```

**Kroki:**
1. Wysłać żądanie `POST /auth`.
2. Przekazać poprawne dane logowania.
3. Odebrać odpowiedź API.
4. Zweryfikować kod odpowiedzi.
5. Zweryfikować odpowiedź JSON.

**Oczekiwany rezultat:**
- Użytkownik zostaje poprawnie uwierzytelniony.
- API zwraca dane wymagane do autoryzacji kolejnych operacji.
- Odpowiedź ma poprawną strukturę.

---

## TC-API-002 – Get Booking

**Cel:**  
Sprawdzenie możliwości pobrania istniejącej rezerwacji.

**Endpoint:**  
`GET /booking/{id}`

**Dane wejściowe:**

```text
bookingId = istniejące ID rezerwacji
```

**Kroki:**
1. Wybrać istniejące ID rezerwacji.
2. Wysłać żądanie `GET /booking/{id}`.
3. Odebrać odpowiedź API.
4. Zweryfikować kod odpowiedzi.
5. Zweryfikować strukturę odpowiedzi.
6. Zweryfikować dane rezerwacji.

**Oczekiwany rezultat:**
- API zwraca istniejącą rezerwację.
- Odpowiedź zawiera dane rezerwacji.
- Odpowiedź ma poprawną strukturę JSON.

---

## TC-API-003 – Create Booking

**Cel:**  
Sprawdzenie możliwości utworzenia nowej rezerwacji.

**Endpoint:**  
`POST /booking`

**Dane wejściowe:**

```json
{
  "firstname": "John",
  "lastname": "Doe",
  "totalprice": 150,
  "depositpaid": true,
  "bookingdates": {
    "checkin": "2026-10-01",
    "checkout": "2026-10-05"
  },
  "additionalneeds": "Breakfast"
}
```

**Kroki:**
1. Wysłać żądanie `POST /booking`.
2. Przekazać dane nowej rezerwacji.
3. Odebrać odpowiedź API.
4. Zweryfikować kod odpowiedzi.
5. Zweryfikować strukturę odpowiedzi.
6. Sprawdzić, czy API zwróciło ID utworzonej rezerwacji.
7. Pobrać utworzoną rezerwację za pomocą `GET /booking/{id}`.
8. Porównać dane z requestu z danymi zapisanymi w systemie.

**Oczekiwany rezultat:**
- Rezerwacja zostaje utworzona.
- API zwraca ID utworzonej rezerwacji.
- Dane zapisanej rezerwacji odpowiadają danym przesłanym w żądaniu.

---

## TC-API-004 – Update Booking

**Cel:**  
Sprawdzenie możliwości aktualizacji istniejącej rezerwacji.

**Endpoint:**  
`PUT /booking/{id}`

**Dane wejściowe:**

```json
{
  "firstname": "Updated",
  "lastname": "User",
  "totalprice": 200,
  "depositpaid": true,
  "bookingdates": {
    "checkin": "2026-10-10",
    "checkout": "2026-10-15"
  },
  "additionalneeds": "Breakfast"
}
```

**Kroki:**
1. Wybrać istniejące ID rezerwacji.
2. Wysłać żądanie `PUT /booking/{id}`.
3. Przekazać zmodyfikowane dane.
4. Odebrać odpowiedź API.
5. Zweryfikować kod odpowiedzi.
6. Zweryfikować odpowiedź JSON.
7. Wysłać `GET /booking/{id}`.
8. Sprawdzić, czy dane zostały zaktualizowane.

**Oczekiwany rezultat:**
- Rezerwacja zostaje zaktualizowana.
- API zwraca zaktualizowane dane.
- Dane rezerwacji odpowiadają wartościom przesłanym w żądaniu.

---

## TC-API-005 – Delete Booking

**Cel:**  
Sprawdzenie możliwości usunięcia istniejącej rezerwacji.

**Endpoint:**  
`DELETE /booking/{id}`

**Dane wejściowe:**

```text
bookingId = istniejące ID rezerwacji
```

**Kroki:**
1. Wybrać istniejące ID rezerwacji.
2. Wysłać żądanie `DELETE /booking/{id}`.
3. Odebrać odpowiedź API.
4. Zweryfikować kod odpowiedzi.
5. Wysłać `GET /booking/{id}`.
6. Sprawdzić, czy rezerwacja została usunięta.

**Oczekiwany rezultat:**
- Rezerwacja zostaje usunięta.
- API potwierdza wykonanie operacji.
- Próba pobrania usuniętej rezerwacji nie zwraca jej danych.
