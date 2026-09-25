# OWASP ZAP --> Przypadki testowe


## TC-OWASP-001 – Scan aplikacji webowej

**Cel:**  
Sprawdzenie aplikacji webowej pod kątem podstawowych podatności bezpieczeństwa.

**Target:**  
`https://automationintesting.online/`

**Kroki:**
1. Uruchomić OWASP ZAP.
2. Dodać adres aplikacji jako target.
3. Uruchomić skanowanie aplikacji.
4. Poczekać na zakończenie skanowania.
5. Przeanalizować znalezione alerty.
6. Zweryfikować poziom ryzyka wykrytych podatności.

**Oczekiwany rezultat:**
- Skanowanie zostaje wykonane poprawnie.
- OWASP ZAP generuje raport.
- Wykryte podatności zostają sklasyfikowane według poziomu ryzyka.
- Brak podatności o poziomie High lub Critical.


---

## TC-OWASP-002 – Scan API

**Cel:**  
Sprawdzenie API pod kątem podstawowych podatności bezpieczeństwa.

**Target:**  
`https://automationintesting.online/api/`

**Kroki:**
1. Uruchomić OWASP ZAP.
2. Skonfigurować target API.
3. Uruchomić skanowanie wybranych endpointów API.
4. Poczekać na zakończenie skanowania.
5. Przeanalizować znalezione alerty.
6. Wygenerować raport.

**Oczekiwany rezultat:**
- Endpointy API zostają przeskanowane.
- OWASP ZAP generuje raport.
- Wykryte problemy zostają sklasyfikowane według poziomu ryzyka.
- Brak podatności o poziomie High lub Critical.


---

## TC-OWASP-003 – Analiza nagłówków bezpieczeństwa

**Cel:**  
Sprawdzenie poprawności podstawowych nagłówków bezpieczeństwa HTTP.

**Target:**  
`https://automationintesting.online/`

**Kroki:**
1. Uruchomić OWASP ZAP.
2. Wykonać skanowanie aplikacji.
3. Przejść do sekcji Alerts.
4. Sprawdzić alerty związane z nagłówkami HTTP.
5. Zweryfikować znalezione problemy.

**Oczekiwany rezultat:**
- OWASP ZAP wykrywa potencjalne problemy związane z nagłówkami bezpieczeństwa.
- Wyniki zostają zapisane w raporcie.
- Każdy wykryty problem posiada określony poziom ryzyka.
