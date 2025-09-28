---
layout: page
title: PSY Aktivita 1
permalink: /teaching/psy-z-25-act-1
---

## Co si vyzkoušíte
- vyzkoušíte si práci s příkazovou řádkou
- zkusíte si zprovoznit `git` na vašem počítači
  a vyzkoušíte si práci s balíčkovacím systémem
- vyzkoušíte si jazyk Markdown
- vyzkoušíte si správu projektu
- naučíte se vygenerovat SSH klíč

## Bodové ohodnocení
Co mě přidáte jako developera do projektu,
budu schopen prohlížet vaši práci. Pokud budete mít vše splněno, tak vám dám 2 body.

## Shrnutí úkolu
1. Nainstalujte si Git na váš počítač, návod [zde](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).
2. Vytvořte prázdný projekt na školním [Gitlabu](https://gitlab.fel.cvut.cz) se jménem
   `psy-activities`.
3. Vygenerujte si sadu SSH klíčů pro verzování a přidejte jej do Gitlabu.
4. Tento prázdný projekt si naklonujete a přidáte do něj pouze jednoduché `README.md`
   s nějakým vašim popisem. Tento commit bude obsahovat zprávu
   `README.md: added root PSY readme`.
   `README.md` bude napsané v jazyku Markdown a bude obsahovat
   minimálně jeden nadpis, popis vašeho repositáře, a hyperlink
   odkazující se na stránku `psy.pages.fel.cvut.cz`.
   Vytvoříte 
6. Do projektu mě přidáte jako developera.

Co se týče GITu, budeme dopředu oproti sylabu předmětu. Ale zde budeme předpokládat
nejzákladnější práci, která se může hodit už v prvním semestru. Níže najdete nápovědu.

## Návod
### Balíčkovací systémy
Na Linuxu či Mac (dnes již na Windows také přítomné) je zvykem stahovat nové programy
pomocí centrálního balíčkovacího systému. To má obrovskou výhodu,
že stahujete (snad většinou) ověřené programy a umožňuje je centrálně
spravovat. Na Ubuntu/Debian se používá `apt/apt-get`, na systémech
od Red Hat se používá `dnf/yum`, na Arch Linux `pacman`.
Mezi různými distribucemi se také používá `snap` či `flatpak`,
které umožňují spouštět aplikace v izolovaných kontejnerech (s vlastním
filesystemem).

Pro vás bude nejdůležitější asi `apt/apt-get`.

### Založení repositáře
Do školního Gitlabu se přihlásíte pomocí ČVUT SSO. Vpravo nahoře byste měli vidět
tlačítko `New project`. Zvolte `Create blank project` a viditelnost nastavte
na `Private`. **Nezaškrtávejte Initialize repository with a README!**.
Nezapomeňte nastavit jméno projektu.

### Co je to GIT?
Git je program sloužící pro verzování softwaru, tzn. umožňuje ukládat soubory,
včetně jejich historie pomocí tzv. snapshotů.
Tuto historii lze následně zpětně prohlížet.
De facto by se dalo říct, že Git je pouze chytrým
wrapperem okolo příkazů `diff` a `patch`. Každý nový příspěvek v Gitovém
repositáři se nazývá `commit` (pokud pomineme ostatní věci jako branches,
tags či submodules).

Verzování v Gitu funguje lokálně, ale většinou je využíván tak,
že lokální historii synchronizujete s nějakým serverem (většinou hostovaný
na Github, Gitlab či vašem Gitovém serveru), který budeme
nazývat jako `remote`. Pro synchronizaci
vzdálené historie s lokální historií se používá příkaz `pull`/`fetch`.
Pro synchronizaci vaší historie s `remote` používáte `push`.
Na `remote` má přístup více vývojářů, tedy umožňuje práci v týmu.

**🧠 K zamyšlení:** Jaký je rozdíl mezi GITem a Githubem/Gitlabem? K čemu jednotlivé technologie slouží
a co každá technologie neumí?

GIT umí posílat data v aplikačních protokolech HTTPS či SSH.
Pro náš přístup budeme používat protokol SSH, který ale vyžaduje vygenerování
dvou klíčů - private a public. Než se pustíme do GITu, naučíme
se generovat klíče a přidat je do Gitlabu.

### Vygenerování SSH klíčů

Přečtěte si návod [zde](https://docs.gitlab.com/user/ssh/).
Je tam popsán proces generování klíče a přidávání do samotného
Gitlabu.

**⚠️ Upozornění**: k práci s GITem nepotřebujete, aby vám běžel
`ssh-agent` a nepotřebujete jej přidávat pomocí `ssh-add`. Ale když
to uděláte, tak nebudete muset zadávat furt heslo.

**⚠️ Upozornění**: Sekce **Add an SSH key to your GitLab account**
to dělá nějak složitě. Stačí udělat:
```
$ cat ~/.ssh/<váš veřejný klíč>
```
Výstup příkazu zkopírujete sem:
![ssh](../../assets/gitlab-ssh.webp)

**🧠 K zamyšlení:** co by se stalo, kdybychom přidali ten privátní?

### Základní práce s GITem
Za předpokladu že SSH klíč máte v Gitlabu, můžete
naklonovat váš repositář pomocí příkazu
```
$ git clone <ssh-adresa>
```
SSH adresu zjistíte tak, že půjdete do svého repositáře a rozkliknete
kolonku **Code**.

V repositáři můžete nové soubory (či změny v souborech) přidávat
pomocí příkazu
```
$ git add <jméno souboru>
```
To tento soubor hodí do takzvané "staging area". Na všechny soubory
v "staging area" můžete poté udělat `commit`.
Zajímají nás dvě varianty:
```
$ git commit -m "Commit zpráva"
```
či
```
$ git commit
```

První varianta udělá commit se zprávou za `-m`. Druhá varianta vám
otevře defaultní textový editor systému. V něm vyplníte commit zprávu,
uložíte a zavřete.

**⚠️ Upozornění**: pokud vám to otevře v editoru `vim`, naučte se
jej uzavírat 😉.

Jakýkoli stav vašeho repositáře vypíšete pomocí příkazu
```
$ git status
```

Pro nahrání commitu použijte
```
$ git push origin <jmeno-vetve>
```
či zkráceně jen
```
$ git push
```
Ve vašem případě budete pushovat do politicky korektní větve `main`,
dřív do `master`.

Pro synchronizace historie s vašim repositářem použijte
```
$ git pull
```

### Markdown
Jednoduchý značkovací jazyk pro psaní jednoduchých strukturovaných
dokumentů s nadpisy, obrázky, linky, tabulkami, atp.
Jednodušší než html. Na internetu existuje hodně příkladů
a tutoriálů.

### Přidání mě jako developera
Otevřete si svůj repositář v Gitlabu. V záložce nalevo zvolte
Manage/Members. Po otevření kliknete na **Invite members**
a vyhledáte mě pomocí jména či mailu. Následně by mi měl přijít mail.