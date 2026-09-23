# Przypadki testów wydajnościowych – JMeter

## 1. Cel

Celem testów jest zbadanie zachowania REST API aplikacji Restful Booker
Platform przy różnym poziomie obciążenia.

Testy będą koncentrować się na obserwacji:

- czasu odpowiedzi,
- przepustowości (Throughput),
- liczby błędów,
- percentyli czasu odpowiedzi,
- zachowania API przy zwiększającym się obciążeniu,
- zachowania API przy długotrwałym obciążeniu.

Testy nie definiują wymagań SLA/SLO dla aplikacji. Wartości wykorzystane
w scenariuszach są parametrami eksperymentów testowych i służą do
porównania zachowania API przy różnych poziomach obciążenia.

---

# 2. Przypadki testowe

## TC-JMETER-001 – Test bazowej wydajności

### Cel

Określenie bazowych parametrów wydajności API przy niewielkim obciążeniu.

### Endpoint

`GET /api/booking/{id}`

### Scenariusz

- Liczba użytkowników wirtualnych: `10`
- Czas narastania obciążenia (Ramp-up): `10 sekund`
- Czas trwania testu: `1 minuta`

### Kroki

1. Uruchomić test z 10 użytkownikami wirtualnymi.
2. Stopniowo zwiększyć liczbę użytkowników przez 10 sekund.
3. Wykonywać żądania `GET /api/booking/{id}`.
4. Rejestrować czas odpowiedzi.
5. Rejestrować przepustowość (Throughput).
6. Rejestrować liczbę błędów.
7. Zapisać wyniki testu.

### Mierzone parametry

- Średni czas odpowiedzi (Average Response Time)
- Minimalny czas odpowiedzi (Min Response Time)
- Maksymalny czas odpowiedzi (Max Response Time)
- 90. percentyl czasu odpowiedzi
- Przepustowość (Throughput)
- Współczynnik błędów (Error Rate)

### Oczekiwany rezultat

Test ma dostarczyć wartości bazowych, które zostaną wykorzystane
do porównania wyników kolejnych testów wydajnościowych.

---

## TC-JMETER-002 – Test wydajności przy obciążeniu

### Cel

Obserwacja zachowania API przy zwiększonym, stabilnym obciążeniu.

### Endpoint

`GET /api/booking/{id}`

### Scenariusz

- Liczba użytkowników wirtualnych: `50`
- Czas narastania obciążenia (Ramp-up): `30 sekund`
- Czas trwania testu: `5 minut`

### Kroki

1. Uruchomić test z 50 użytkownikami wirtualnymi.
2. Stopniowo zwiększyć obciążenie przez 30 sekund.
3. Utrzymywać obciążenie przez 5 minut.
4. Rejestrować czas odpowiedzi.
5. Rejestrować przepustowość.
6. Rejestrować liczbę błędów.
7. Porównać wyniki z testem TC-JMETER-001.

### Mierzone parametry

- Średni czas odpowiedzi
- 90. percentyl
- 95. percentyl
- Przepustowość (Throughput)
- Współczynnik błędów (Error Rate)

### Oczekiwany rezultat

Określenie wpływu zwiększonego obciążenia na:

- czas odpowiedzi,
- przepustowość,
- liczbę błędów,
- percentyle czasu odpowiedzi.

Wyniki zostaną porównane z wynikami testu TC-JMETER-001.

---

## TC-JMETER-003 – Test przeciążeniowy

### Cel

Obserwacja zachowania API przy dalszym zwiększaniu obciążenia.

### Endpoint

`GET /api/booking/{id}`

### Scenariusz

- Liczba użytkowników wirtualnych: `100`
- Czas narastania obciążenia (Ramp-up): `60 sekund`
- Czas trwania testu: `5 minut`

### Kroki

1. Uruchomić test ze 100 użytkownikami wirtualnymi.
2. Stopniowo zwiększać obciążenie przez 60 sekund.
3. Utrzymywać zwiększone obciążenie przez 5 minut.
4. Monitorować czas odpowiedzi.
5. Monitorować przepustowość.
6. Monitorować liczbę błędów.
7. Porównać wyniki z wcześniejszymi testami.

### Mierzone parametry

- Średni czas odpowiedzi
- 90. percentyl
- 95. percentyl
- 99. percentyl
- Przepustowość (Throughput)
- Współczynnik błędów (Error Rate)

### Oczekiwany rezultat

Określenie, jak zmienia się zachowanie API wraz ze wzrostem obciążenia.

Test ma umożliwić obserwację:

- wzrostu czasu odpowiedzi,
- zmian przepustowości,
- wzrostu liczby błędów,
- potencjalnego pogorszenia wydajności.

Nie definiuje się konkretnej wartości granicznej bez odpowiednich
wymagań systemowych.

---

## TC-JMETER-004 – Test wydajności tworzenia rezerwacji

### Cel

Obserwacja zachowania endpointu odpowiedzialnego za tworzenie
rezerwacji przy zwiększonym obciążeniu.

### Endpoint

`POST /api/booking`

### Scenariusz

- Liczba użytkowników wirtualnych: `50`
- Czas narastania obciążenia (Ramp-up): `30 sekund`
- Czas trwania testu: `5 minut`

### Dane wejściowe

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

### Kroki

1. Uruchomić test z 50 użytkownikami wirtualnymi.
2. Stopniowo zwiększać obciążenie przez 30 sekund.
3. Każdy użytkownik wykonuje `POST /api/booking`.
4. Rejestrować czas odpowiedzi.
5. Rejestrować przepustowość.
6. Rejestrować liczbę błędów.
7. Zapisać wyniki testu.

### Mierzone parametry

- Średni czas odpowiedzi
- 90. percentyl
- 95. percentyl
- Przepustowość (Throughput)
- Współczynnik błędów (Error Rate)
- Liczba poprawnie wykonanych żądań

### Oczekiwany rezultat

Określenie zachowania endpointu `POST /api/booking` podczas zwiększonego
obciążenia.

Wyniki należy przeanalizować pod kątem:

- czasu odpowiedzi,
- liczby błędów,
- przepustowości,
- poprawności obsługi żądań.

---

## TC-JMETER-005 – Test długotrwałego obciążenia

### Cel

Obserwacja zachowania API podczas długotrwałego, stabilnego obciążenia.

### Endpoint

`GET /api/booking/{id}`

### Scenariusz

- Liczba użytkowników wirtualnych: `20`
- Czas narastania obciążenia (Ramp-up): `30 sekund`
- Czas trwania testu: `30 minut`

### Kroki

1. Uruchomić test z 20 użytkownikami wirtualnymi.
2. Stopniowo zwiększyć obciążenie przez 30 sekund.
3. Utrzymywać obciążenie przez 30 minut.
4. Rejestrować czas odpowiedzi w czasie trwania testu.
5. Rejestrować przepustowość.
6. Rejestrować liczbę błędów.
7. Porównać wyniki z początku i końca testu.

### Mierzone parametry

- Średni czas odpowiedzi
- 90. percentyl
- 95. percentyl
- Przepustowość (Throughput)
- Współczynnik błędów (Error Rate)
- Zmiana czasu odpowiedzi w czasie

### Oczekiwany rezultat

Określenie, czy parametry wydajności API pozostają względnie stabilne
podczas długotrwałego obciążenia.

Należy zwrócić szczególną uwagę na:

- stopniowy wzrost czasu odpowiedzi,
- wzrost liczby błędów,
- spadek przepustowości,
- inne oznaki degradacji wydajności.

---

# 3. Podsumowanie przypadków testowych

| ID | Przypadek testowy | Użytkownicy wirtualni | Ramp-up | Czas trwania |
|---|---|---:|---:|---:|
| TC-JMETER-001 | Test bazowej wydajności | 10 | 10 s | 1 min |
| TC-JMETER-002 | Test wydajności przy obciążeniu | 50 | 30 s | 5 min |
| TC-JMETER-003 | Test przeciążeniowy | 100 | 60 s | 5 min |
| TC-JMETER-004 | Test wydajności tworzenia rezerwacji | 50 | 30 s | 5 min |
| TC-JMETER-005 | Test długotrwałego obciążenia | 20 | 30 s | 30 min |

---

# 4. Parametry wydajnościowe

Podczas testów będą analizowane:

- czas odpowiedzi,
- średni czas odpowiedzi,
- minimalny czas odpowiedzi,
- maksymalny czas odpowiedzi,
- 90. percentyl,
- 95. percentyl,
- 99. percentyl,
- przepustowość (Throughput),
- współczynnik błędów (Error Rate),
- liczba wykonanych żądań.

---

# 5. Analiza wyników

Wyniki testów będą porównywane pomiędzy poszczególnymi scenariuszami.

Analiza będzie obejmować:

- zmianę czasu odpowiedzi wraz ze wzrostem obciążenia,
- zmianę przepustowości,
- zmianę współczynnika błędów,
- zmianę percentyli czasu odpowiedzi,
- stabilność API podczas długotrwałego obciążenia.

W przypadku braku zdefiniowanych wymagań wydajnościowych wyniki nie będą
klasyfikowane jako PASS/FAIL na podstawie arbitralnie ustalonych wartości.

Wyniki będą traktowane jako dane pomiarowe służące do analizy zachowania
systemu.

---

# 6. Struktura testów JMeter

```text
Testy wydajnościowe Restful Booker
│
├── TC-JMETER-001 – Test bazowej wydajności
├── TC-JMETER-002 – Test wydajności przy obciążeniu
├── TC-JMETER-003 – Test przeciążeniowy
├── TC-JMETER-004 – Test wydajności tworzenia rezerwacji
└── TC-JMETER-005 – Test długotrwałego obciążenia
```

---

# 7. Raportowanie

Po wykonaniu testów zostaną zapisane raporty zawierające wyniki
poszczególnych scenariuszy.

Raport powinien zawierać co najmniej:

- liczbę wykonanych żądań,
- liczbę poprawnych żądań,
- liczbę błędnych żądań,
- średni czas odpowiedzi,
- percentyle czasu odpowiedzi,
- przepustowość,
- współczynnik błędów.

Docelowo raporty będą generowane automatycznie podczas wykonywania testów
w GitHub Actions.