# Upload nach GitHub und KaffeeundCode

## Das kann hochgeladen werden

Der vollständige Repository-Inhalt ist als dokumentierte Skriptbibliothek vorbereitet: 510 Skripte mit sichtbarem Prüfstatus, Hilfsquellen für die Pflege, Katalog, Tests und fünf App-Beschreibungen. Ungeprüfte Einträge bleiben ausdrücklich ungeprüft.

1. Das Quellarchiv entpacken und seinen Inhalt in den vorhandenen lokalen Checkout von `Kaffeeundcode/Intune-Scripts` übernehmen. Bestehende Ordnerstruktur und Dateinamen erhalten. Den `.git`-Ordner des Checkouts behalten.
2. Änderungen mit Git beziehungsweise GitHub Desktop als Commit hochladen. Das ZIP nicht als Ersatz für die einzelnen Repository-Dateien hochladen: Der Website-Import liest die Verzeichnisse und Skriptdateien.
3. In WordPress den vorhandenen Eintrag „Skripte → GitHub Sync“ öffnen und die vorhandene Synchronisierung starten. Bei der lokal untersuchten Importversion synchronisiert dieser Knopf auch das konfigurierte n8n-Repository.
4. Anschließend die bekannten Skriptseiten aufrufen und prüfen: Prüfstatus in der Beschreibung sichtbar, Copy-Code-Inhalt vollständig, GitHub-Link zeigt die richtige Datei. Eine neue Intune-Datei und die fünf App-Beschreibungen ebenfalls kontrollieren.

Der lokale Kompatibilitätstest bildet die untersuchte Importlogik nach. Er ersetzt nicht die Kontrolle nach der echten Synchronisierung. Bestehende zusätzliche Website-Seiten und ihre Links werden nicht entfernt. Die 34 nicht zugeordneten Seiten sind im Bestandsbericht einzeln gelistet.

## App-Dateien separat behandeln

Die fünf ZIPs und fünf INTUNEWIN-Dateien sind lokale Testartefakte. Sie wurden gebaut, aber nicht als installierte Apps abgenommen. Erst nach Installationstests und vollständiger Lizenzprüfung als versionierte GitHub-Release-Assets veröffentlichen und die jeweiligen README-Seiten auf genau diese Version verlinken. Der normale GitHub-Sync lädt Release-Dateien nicht automatisch.

Nicht hochladen: `.artifacts/`, temporäre Testdateien, Anmeldedaten, lokale Installer oder den Microsoft-Paketierer. `.gitignore` schließt lokale Artefakte aus.

## Noch offene fachliche Abnahme

Ein Intune-Testtenant ist derzeit nicht verbunden. Die geplanten 100 beziehungsweise später 200 vollständig geprüften Skripte sind daher noch nicht erreicht. Die fünf Folge-Apps werden erst nach Abnahme der ersten Serie ergänzt. Dieser Upload veröffentlicht den belegbaren aktuellen Stand; er erklärt die Bibliothek nicht pauschal für produktionsgeprüft.
