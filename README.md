# Intune-Scripts

Automatisiere Intune – ein Skript nach dem anderen.

Eine Sammlung von PowerShell-Skripten für Microsoft Intune, um IT-Administratoren bei täglichen Aufgaben im Gerätemanagement, bei Konfigurationen und beim Reporting zu unterstützen.

---

## 🚀 Überblick

Dieses Repository enthält PowerShell-Skripte rund um modernes Endpoint Management mit Microsoft Intune und der Microsoft Graph API.

Ziele dieses Projekts:

- Wiederholbare, gut dokumentierte Automatisierungen für Intune
- Klare Struktur nach Szenarien (Geräte, Apps, Compliance, Benutzer/Gruppen, Enrollment)
- Einfach zu forken, anzupassen und zu erweitern

Alle Skripte sind so aufgebaut, dass sie gut lesbar, modular und – nach Tests in der eigenen Umgebung – produktionsfähig sind.

---

## ✨ Wichtige Einsatzszenarien

- **Gerätemanagement** – Sammelaktionen, Inventur, Bereinigung und Reporting für verwaltete Geräte  
- **App-Management** – Bereitstellung, Aktualisierung und Auswertung von Win32-, Store- und anderen App-Typen  
- **Compliance & Konfiguration** – Compliance-Richtlinien, Konfigurationsprofile und Baselines  
- **Benutzer & Gruppen** – Zuweisungen, rollenbasierter Zugriff, Gruppenmitgliedschaften  
- **Enrollment & Autopilot** – Import, Pflege und Reporting für Autopilot- und Enrollment-Szenarien  

---

## 📁 Repository-Struktur

```text
Intune-Scripts/
├─ 01_Device_Management/        # Skripte für Geräte-Inventur, Bereinigung, Lebenszyklus
├─ 02_App_Management/           # Skripte für App-Bereitstellung und Update-Automatisierung
├─ 03_Compliance_Configuration/ # Skripte für Compliance- und Konfigurationsrichtlinien
├─ 04_Users_Groups/             # Skripte für Benutzer, Gruppen und Zuweisungen
├─ 05_Enrollment_Autopilot/     # Skripte für Enrollment- und Autopilot-Szenarien
└─ README.md                    # Diese Datei 🙂



⚙️ Voraussetzungen

Um die Skripte in diesem Repository zu verwenden, benötigst du in der Regel:
	•	PowerShell 5.1 oder höher (PowerShell 7+ empfohlen)
	•	Zugriff auf einen Intune-Tenant mit passenden Admin-Berechtigungen
	•	Microsoft Graph PowerShell Module, z. B.:
	•	Microsoft.Graph.Authentication
	•	Microsoft.Graph.DeviceManagement
	•	Ein Konto mit den erforderlichen Intune/Graph-API-Berechtigungen
(z. B. Intune-Administrator oder eine benutzerdefinierte Rolle mit vergleichbaren Rechten)

Die Kopfzeilen der einzelnen Skripte enthalten – falls nötig – zusätzliche Hinweise zu Voraussetzungen und Berechtigungen.

⸻

🧪 Schnellstart

Variante 1: Lokal ausführen (Tests und Ad-hoc-Aufgaben)
	1.	Repository klonen oder gewünschte Skripte herunterladen:

git clone https://github.com/Kaffeeundcode/Intune-Scripts.git
cd Intune-Scripts

	2.	Benötigte Module installieren (falls noch nicht vorhanden), z. B.:
Install-Module Microsoft.Graph -Scope CurrentUser

	3.	Verbindung zu Microsoft Graph / Intune herstellen:
Connect-MgGraph -Scopes "DeviceManagement.Read.All","DeviceManagement.ReadWrite.All"

	4.	In den passenden Ordner wechseln und das Skript mit den für dein Szenario passenden Parametern ausführen.

Variante 2: Einsatz in Automatisierungs-Umgebungen

Die Skripte können auch verwendet werden in:
	•	Azure Automation Runbooks
	•	Geplanten Tasks auf Management-Servern
	•	Anderen Orchestrierungstools (z. B. n8n), die PowerShell ausführen können

Dafür solltest du sicherstellen, dass:
	•	Eine sichere Authentifizierung genutzt wird (Managed Identity, Service Principal oder Automation Account)
	•	Die richtigen Graph-API-Berechtigungen für unbeaufsichtigte Ausführung gesetzt sind
	•	Logging und Fehlerbehandlung zu deiner Umgebung passen

⸻

🧩 Skript-Kategorien
	•	01_Device_Management
Inventarisierung, Reporting, Bereinigung (z. B. veraltete Geräte, alte Einträge).
	•	02_App_Management
Erstellen, Aktualisieren und Verwalten von App-Zuweisungen und Deployments.
	•	03_Compliance_Configuration
Arbeiten mit Compliance-Richtlinien, Konfigurationsprofilen und Auswertungen.
	•	04_Users_Groups
Verwaltung von Benutzern, Gruppen, Rollen und Zielgruppen für Richtlinien und Apps.
	•	05_Enrollment_Autopilot
Import und Pflege von Autopilot-Geräten, Exporte und Unterstützung von Enrollment-Workflows.

Jedes Skript enthält Kommentare, die Zweck und Anpassungsmöglichkeiten erklären.

⸻

🤝 Beiträge / Contributing

Beiträge sind ausdrücklich willkommen!

Wenn du ein Skript verbessern, ein neues Szenario ergänzen oder einen Fehler beheben möchtest:
	1.	Dieses Repository forken
	2.	Einen Feature-Branch erstellen
	3.	Skripte hinzufügen oder anpassen (mit Kommentaren und kurzer Doku)
	4.	Änderungen in einer Test- bzw. Nicht-Produktiv-Umgebung prüfen
	5.	Einen Pull Request mit kurzer Beschreibung des Szenarios und der Änderungen eröffnen

Vorschläge und Probleme können auch über GitHub Issues gemeldet werden.

⸻

❓ Fragen & Support

Bei Fragen, Ideen für neue Skripte oder Problemen:
	•	Eröffne ein Issue in diesem Repository
	•	Oder nutze die Kontaktdaten in meinem GitHub-Profil

Bitte keine mandanten- oder firmenkritischen Informationen in öffentlichen Issues posten.

⸻

📜 Lizenz

Dieses Projekt steht unter der MIT-Lizenz.
Du kannst die Skripte im Rahmen der Lizenz frei verwenden, anpassen und weitergeben.

⸻

👤 Autor

Mattia Cirillo
Ersteller von kaffeeundcode – Automatisierung, Intune & n8n in der Praxis.

Wenn dir diese Skripte helfen, freue ich mich über einen ⭐ auf GitHub.
