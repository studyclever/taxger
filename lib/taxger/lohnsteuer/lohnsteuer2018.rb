module Taxger
  module Lohnsteuer
    class Lohnsteuer2018
      # CONSTANTS

      # Tabelle fuer die Vomhundertsaetze des Versorgungsfreibetrags
      TAB1            = [BigDecimal.value_of(0.0), BigDecimal.value_of(0.4), BigDecimal.value_of(0.384), BigDecimal.value_of(0.368),
                    BigDecimal.value_of(0.352), BigDecimal.value_of(0.336), BigDecimal.value_of(0.32), BigDecimal.value_of(0.304),
                    BigDecimal.value_of(0.288), BigDecimal.value_of(0.272), BigDecimal.value_of(0.256), BigDecimal.value_of(0.24),
                    BigDecimal.value_of(0.224), BigDecimal.value_of(0.208), BigDecimal.value_of(0.192), BigDecimal.value_of(0.176),
                    BigDecimal.value_of(0.16), BigDecimal.value_of(0.152), BigDecimal.value_of(0.144), BigDecimal.value_of(0.136),
                    BigDecimal.value_of(0.128), BigDecimal.value_of(0.12), BigDecimal.value_of(0.112), BigDecimal.value_of(0.104),
                    BigDecimal.value_of(0.096), BigDecimal.value_of(0.088), BigDecimal.value_of(0.08), BigDecimal.value_of(0.072),
                    BigDecimal.value_of(0.064), BigDecimal.value_of(0.056), BigDecimal.value_of(0.048), BigDecimal.value_of(0.04),
                    BigDecimal.value_of(0.032), BigDecimal.value_of(0.024), BigDecimal.value_of(0.016), BigDecimal.value_of(0.008),
                    BigDecimal.value_of(0.0)]

      # Tabelle fuer die Hoechstbetrage des Versorgungsfreibetrags
      TAB2            = [BigDecimal.value_of(0), BigDecimal.value_of(3000), BigDecimal.value_of(2880), BigDecimal.value_of(2760),
                    BigDecimal.value_of(2640), BigDecimal.value_of(2520), BigDecimal.value_of(2400), BigDecimal.value_of(2280),
                    BigDecimal.value_of(2160), BigDecimal.value_of(2040), BigDecimal.value_of(1920), BigDecimal.value_of(1800),
                    BigDecimal.value_of(1680), BigDecimal.value_of(1560), BigDecimal.value_of(1440), BigDecimal.value_of(1320),
                    BigDecimal.value_of(1200), BigDecimal.value_of(1140), BigDecimal.value_of(1080), BigDecimal.value_of(1020),
                    BigDecimal.value_of(960), BigDecimal.value_of(900), BigDecimal.value_of(840), BigDecimal.value_of(780),
                    BigDecimal.value_of(720), BigDecimal.value_of(660), BigDecimal.value_of(600), BigDecimal.value_of(540),
                    BigDecimal.value_of(480), BigDecimal.value_of(420), BigDecimal.value_of(360), BigDecimal.value_of(300),
                    BigDecimal.value_of(240), BigDecimal.value_of(180), BigDecimal.value_of(120), BigDecimal.value_of(60),
                    BigDecimal.value_of(0)]

      # Tabelle fuer die Zuschlaege zum Versorgungsfreibetrag
      TAB3            = [BigDecimal.value_of(0), BigDecimal.value_of(900), BigDecimal.value_of(864), BigDecimal.value_of(828),
                    BigDecimal.value_of(792), BigDecimal.value_of(756), BigDecimal.value_of(720), BigDecimal.value_of(684),
                    BigDecimal.value_of(648), BigDecimal.value_of(612), BigDecimal.value_of(576), BigDecimal.value_of(540),
                    BigDecimal.value_of(504), BigDecimal.value_of(468), BigDecimal.value_of(432), BigDecimal.value_of(396),
                    BigDecimal.value_of(360), BigDecimal.value_of(342), BigDecimal.value_of(324), BigDecimal.value_of(306),
                    BigDecimal.value_of(288), BigDecimal.value_of(270), BigDecimal.value_of(252), BigDecimal.value_of(234),
                    BigDecimal.value_of(216), BigDecimal.value_of(198), BigDecimal.value_of(180), BigDecimal.value_of(162),
                    BigDecimal.value_of(144), BigDecimal.value_of(126), BigDecimal.value_of(108), BigDecimal.value_of(90),
                    BigDecimal.value_of(72), BigDecimal.value_of(54), BigDecimal.value_of(36), BigDecimal.value_of(18),
                    BigDecimal.value_of(0)]

      # Tabelle fuer die Vomhundertsaetze des Altersentlastungsbetrags
      TAB4            = [BigDecimal.value_of(0.0), BigDecimal.value_of(0.4), BigDecimal.value_of(0.384), BigDecimal.value_of(0.368),
                    BigDecimal.value_of(0.352), BigDecimal.value_of(0.336), BigDecimal.value_of(0.32), BigDecimal.value_of(0.304),
                    BigDecimal.value_of(0.288), BigDecimal.value_of(0.272), BigDecimal.value_of(0.256), BigDecimal.value_of(0.24),
                    BigDecimal.value_of(0.224), BigDecimal.value_of(0.208), BigDecimal.value_of(0.192), BigDecimal.value_of(0.176),
                    BigDecimal.value_of(0.16), BigDecimal.value_of(0.152), BigDecimal.value_of(0.144), BigDecimal.value_of(0.136),
                    BigDecimal.value_of(0.128), BigDecimal.value_of(0.12), BigDecimal.value_of(0.112), BigDecimal.value_of(0.104),
                    BigDecimal.value_of(0.096), BigDecimal.value_of(0.088), BigDecimal.value_of(0.08), BigDecimal.value_of(0.072),
                    BigDecimal.value_of(0.064), BigDecimal.value_of(0.056), BigDecimal.value_of(0.048), BigDecimal.value_of(0.04),
                    BigDecimal.value_of(0.032), BigDecimal.value_of(0.024), BigDecimal.value_of(0.016), BigDecimal.value_of(0.008),
                    BigDecimal.value_of(0.0)]

      # Tabelle fuer die Hoechstbetraege des Altersentlastungsbetrags
      TAB5            = [BigDecimal.value_of(0), BigDecimal.value_of(1900), BigDecimal.value_of(1824), BigDecimal.value_of(1748),
                    BigDecimal.value_of(1672), BigDecimal.value_of(1596), BigDecimal.value_of(1520), BigDecimal.value_of(1444),
                    BigDecimal.value_of(1368), BigDecimal.value_of(1292), BigDecimal.value_of(1216), BigDecimal.value_of(1140),
                    BigDecimal.value_of(1064), BigDecimal.value_of(988), BigDecimal.value_of(912), BigDecimal.value_of(836),
                    BigDecimal.value_of(760), BigDecimal.value_of(722), BigDecimal.value_of(684), BigDecimal.value_of(646),
                    BigDecimal.value_of(608), BigDecimal.value_of(570), BigDecimal.value_of(532), BigDecimal.value_of(494),
                    BigDecimal.value_of(456), BigDecimal.value_of(418), BigDecimal.value_of(380), BigDecimal.value_of(342),
                    BigDecimal.value_of(304), BigDecimal.value_of(266), BigDecimal.value_of(228), BigDecimal.value_of(190),
                    BigDecimal.value_of(152), BigDecimal.value_of(114), BigDecimal.value_of(76), BigDecimal.value_of(38),
                    BigDecimal.value_of(0)]

      # Zahlenkonstanten fuer im Plan oft genutzte BigDecimal Werte
      ZAHL1           = BigDecimal.ONE
      ZAHL2           = BigDecimal.new(2)
      ZAHL5           = BigDecimal.new(5)
      ZAHL7           = BigDecimal.new(7)
      ZAHL12          = BigDecimal.new(12)
      ZAHL100         = BigDecimal.new(100)
      ZAHL360         = BigDecimal.new(360)
      ZAHL500         = BigDecimal.new(500)
      ZAHL700         = BigDecimal.new(700)
      ZAHL1000        = BigDecimal.new(1000)
      ZAHL10000       = BigDecimal.new(10000)

      attr_accessor :bk
      attr_accessor :bks
      attr_accessor :bkv
      attr_accessor :lstlzz
      attr_accessor :solzlzz
      attr_accessor :solzs
      attr_accessor :solzv
      attr_accessor :sts
      attr_accessor :stv
      attr_accessor :vkvlzz
      attr_accessor :vkvsonst
      attr_accessor :vfrb
      attr_accessor :vfrbs1
      attr_accessor :vfrbs2
      attr_accessor :wvfrb
      attr_accessor :wvfrbo
      attr_accessor :wvfrbm

      INPUT_VARS = [:af, :ajahr, :alter1, :entsch, :f, :jfreib, :jhinzu, :jre4, :jvbez, :krv, :kvz, :lzz, :lzzfreib, :lzzhinzu, :pkpv, :pkv, :pvs, :pvz, :r, :re4, :sonstb, :sterbe, :stkl, :vbez, :vbezm, :vbezs, :vbs, :vjahr, :vkapa, :vmt, :zkf, :zmvb, :jre4ent, :sonstent]
      OUTPUT_VARS = [:bk, :bks, :bkv, :lstlzz, :solzlzz, :solzs, :solzv, :sts, :stv, :vkvlzz, :vkvsonst, :vfrb, :vfrbs1, :vfrbs2, :wvfrb, :wvfrbo, :wvfrbm]
      def initialize(params)
        raise "Unknown parameters: #{params.keys - INPUT_VARS}" if params.keys - INPUT_VARS != []
        # INPUTS

        # 1, wenn die Anwendung des Faktorverfahrens gewählt wurden (nur in Steuerklasse IV)
        @af             = 1                    # int

        # Auf die Vollendung des 64. Lebensjahres folgende
        # Kalenderjahr (erforderlich, wenn ALTER1=1)
        @ajahr          = 0                    # int

        # 1, wenn das 64. Lebensjahr zu Beginn des Kalenderjahres vollendet wurde, in dem
        # der Lohnzahlungszeitraum endet (§ 24 a EStG), sonst = 0
        @alter1         = 0                    # int

        # in VKAPA und VMT enthaltene Entschädigungen nach §24 Nummer 1 EStG in Cent
        @entsch         = BigDecimal.new(0)    # BigDecimal

        # eingetragener Faktor mit drei Nachkommastellen
        @f              = 1.0                  # double

        # Jahresfreibetrag nach Maßgabe der Eintragungen auf der
        # Lohnsteuerkarte in Cents (ggf. 0)
        @jfreib         = BigDecimal.new(0)    # BigDecimal

        # Jahreshinzurechnungsbetrag in Cents (ggf. 0)
        @jhinzu         = BigDecimal.new(0)    # BigDecimal

        # Voraussichtlicher Jahresarbeitslohn ohne sonstige Bezüge und ohne Vergütung für mehrjährige Tätigkeit in Cent.
        # Anmerkung: Die Eingabe dieses Feldes (ggf. 0) ist erforderlich bei Eingabe „sonsti-ger Bezüge“ (Feld SONSTB)
        # oder bei Eingabe der „Vergütung für mehrjährige Tätigkeit“ (Feld VMT).
        # Sind in einem vorangegangenen Abrechnungszeitraum bereits sonstige Bezüge gezahlt worden, so sind sie dem
        # voraussichtlichen Jahresarbeitslohn hinzuzurechnen. Vergütungen für mehrere Jahres aus einem vorangegangenen
        # Abrechnungszeitraum sind in voller Höhe hinzuzurechnen.
        @jre4           = BigDecimal.new(0)    # BigDecimal

        # In JRE4 enthaltene Versorgungsbezuege in Cents (ggf. 0)
        @jvbez          = BigDecimal.new(0)    # BigDecimal

        # Merker für die Vorsorgepauschale
        # 2 = der Arbeitnehmer ist NICHT in der gesetzlichen Rentenversicherung versichert.
        #
        # 1 = der Arbeitnehmer ist in der gesetzlichen Rentenversicherung versichert, es gilt die
        # Beitragsbemessungsgrenze OST.
        #
        # 0 = der Arbeitnehmer ist in der gesetzlichen Rentenversicherung versichert, es gilt die
        # Beitragsbemessungsgrenze WEST.
        @krv            = 0                    # int

        # Einkommensbezogener Zusatzbeitragssatz eines gesetzlich krankenversicherten Arbeitnehmers,
        # auf dessen Basis der an die Krankenkasse zu zahlende Zusatzbeitrag berechnet wird,
        # in Prozent (bspw. 0,90 für 0,90 %) mit 2 Dezimalstellen.
        # Der von der Kranken-kasse festgesetzte Zusatzbeitragssatz ist bei Abweichungen unmaßgeblich.
        @kvz            = BigDecimal.new(0)    # BigDecimal

        # Lohnzahlungszeitraum:
        # 1 = Jahr
        # 2 = Monat
        # 3 = Woche
        # 4 = Tag
        @lzz            = 0                    # int

        # In der Lohnsteuerkarte des Arbeitnehmers eingetragener Freibetrag für
        # den Lohnzahlungszeitraum in Cent
        @lzzfreib       = BigDecimal.new(0)    # BigDecimal

        # In der Lohnsteuerkarte des Arbeitnehmers eingetragener Hinzurechnungsbetrag
        # für den Lohnzahlungszeitraum in Cent
        @lzzhinzu       = BigDecimal.new(0)    # BigDecimal

        # Dem Arbeitgeber mitgeteilte Zahlungen des Arbeitnehmers zur privaten
        # Kranken- bzw. Pflegeversicherung im Sinne des §10 Abs. 1 Nr. 3 EStG 2010
        # als Monatsbetrag in Cent (der Wert ist inabhängig vom Lohnzahlungszeitraum immer
        # als Monatsbetrag anzugeben).
        @pkpv           = BigDecimal.new(0)    # BigDecimal

        # Krankenversicherung:
        # 0 = gesetzlich krankenversicherte Arbeitnehmer
        # 1 = ausschließlich privat krankenversicherte Arbeitnehmer OHNE Arbeitgeberzuschuss
        # 2 = ausschließlich privat krankenversicherte Arbeitnehmer MIT Arbeitgeberzuschuss
        @pkv            = 0                    # int

        # 1, wenn bei der sozialen Pflegeversicherung die Besonderheiten in Sachsen zu berücksichtigen sind bzw.
        # zu berücksichtigen wären, sonst 0.
        @pvs            = 0                    # int

        # 1, wenn er der Arbeitnehmer den Zuschlag zur sozialen Pflegeversicherung
        # zu zahlen hat, sonst 0.
        @pvz            = 0                    # int

        # Religionsgemeinschaft des Arbeitnehmers lt. Lohnsteuerkarte (bei
        # keiner Religionszugehoerigkeit = 0)
        @r              = 0                    # int

        # Steuerpflichtiger Arbeitslohn vor Beruecksichtigung der Freibetraege
        # fuer Versorgungsbezuege, des Altersentlastungsbetrags und des auf
        # der Lohnsteuerkarte fuer den Lohnzahlungszeitraum eingetragenen
        # Freibetrags in Cents.
        @re4            = BigDecimal.new(0)    # BigDecimal

        # Sonstige Bezuege (ohne Verguetung aus mehrjaehriger Taetigkeit) einschliesslich
        # Sterbegeld bei Versorgungsbezuegen sowie Kapitalauszahlungen/Abfindungen,
        # soweit es sich nicht um Bezuege fuer mehrere Jahre handelt in Cents (ggf. 0)
        @sonstb         = BigDecimal.new(0)    # BigDecimal

        # Sterbegeld bei Versorgungsbezuegen sowie Kapitalauszahlungen/Abfindungen,
        # soweit es sich nicht um Bezuege fuer mehrere Jahre handelt
        # (in SONSTB enthalten) in Cents
        @sterbe         = BigDecimal.new(0)    # BigDecimal

        # Steuerklasse:
        # 1 = I
        # 2 = II
        # 3 = III
        # 4 = IV
        # 5 = V
        # 6 = VI
        @stkl           = 0                    # int

        # In RE4 enthaltene Versorgungsbezuege in Cents (ggf. 0)
        @vbez           = BigDecimal.new(0)    # BigDecimal

        # Vorsorgungsbezug im Januar 2005 bzw. fuer den ersten vollen Monat
        # in Cents
        @vbezm          = BigDecimal.new(0)    # BigDecimal

        # Voraussichtliche Sonderzahlungen im Kalenderjahr des Versorgungsbeginns
        # bei Versorgungsempfaengern ohne Sterbegeld, Kapitalauszahlungen/Abfindungen
        # bei Versorgungsbezuegen in Cents
        @vbezs          = BigDecimal.new(0)    # BigDecimal

        # In SONSTB enthaltene Versorgungsbezuege einschliesslich Sterbegeld
        # in Cents (ggf. 0)
        @vbs            = BigDecimal.new(0)    # BigDecimal

        # Jahr, in dem der Versorgungsbezug erstmalig gewaehrt wurde; werden
        # mehrere Versorgungsbezuege gezahlt, so gilt der aelteste erstmalige Bezug
        @vjahr          = 0                    # int

        # Kapitalauszahlungen / Abfindungen / Nachzahlungen bei Versorgungsbezügen
        # für mehrere Jahre in Cent (ggf. 0)
        @vkapa          = BigDecimal.new(0)    # BigDecimal

        # Vergütung für mehrjährige Tätigkeit ohne Kapitalauszahlungen und ohne Abfindungen
        # bei Versorgungsbezügen in Cent (ggf. 0)
        @vmt            = BigDecimal.new(0)    # BigDecimal

        # Zahl der Freibetraege fuer Kinder (eine Dezimalstelle, nur bei Steuerklassen
        # I, II, III und IV)
        @zkf            = BigDecimal.new(0)    # BigDecimal

        # Zahl der Monate, fuer die Versorgungsbezuege gezahlt werden (nur
        # erforderlich bei Jahresberechnung (LZZ = 1)
        @zmvb           = 0                    # int

        # In JRE4 enthaltene Entschädigungen nach § 24 Nummer 1 EStG in Cent
        @jre4ent        = BigDecimal.ZERO      # BigDecimal

        # In SONSTB enthaltene Entschädigungen nach § 24 Nummer 1 EStG in Cent
        @sonstent       = BigDecimal.ZERO      # BigDecimal

        # OUTPUTS

        # Bemessungsgrundlage fuer die Kirchenlohnsteuer in Cents
        @bk             = BigDecimal.new(0)    # BigDecimal

        # Bemessungsgrundlage der sonstigen Einkuenfte (ohne Verguetung
        # fuer mehrjaehrige Taetigkeit) fuer die Kirchenlohnsteuer in Cents
        @bks            = BigDecimal.new(0)    # BigDecimal
        @bkv            = BigDecimal.new(0)    # BigDecimal

        # Fuer den Lohnzahlungszeitraum einzubehaltende Lohnsteuer in Cents
        @lstlzz         = BigDecimal.new(0)    # BigDecimal

        # Fuer den Lohnzahlungszeitraum einzubehaltender Solidaritaetszuschlag
        # in Cents
        @solzlzz        = BigDecimal.new(0)    # BigDecimal

        # Solidaritaetszuschlag fuer sonstige Bezuege (ohne Verguetung fuer mehrjaehrige
        # Taetigkeit) in Cents
        @solzs          = BigDecimal.new(0)    # BigDecimal

        # Solidaritaetszuschlag fuer die Verguetung fuer mehrjaehrige Taetigkeit in
        # Cents
        @solzv          = BigDecimal.new(0)    # BigDecimal

        # Lohnsteuer fuer sonstige Einkuenfte (ohne Verguetung fuer mehrjaehrige
        # Taetigkeit) in Cents
        @sts            = BigDecimal.new(0)    # BigDecimal

        # Lohnsteuer fuer Verguetung fuer mehrjaehrige Taetigkeit in Cents
        @stv            = BigDecimal.new(0)    # BigDecimal

        # Für den Lohnzahlungszeitraum berücksichtigte Beiträge des Arbeitnehmers zur
        # privaten Basis-Krankenversicherung und privaten Pflege-Pflichtversicherung (ggf. auch
        # die Mindestvorsorgepauschale) in Cent beim laufenden Arbeitslohn. Für Zwecke der Lohn-
        # steuerbescheinigung sind die einzelnen Ausgabewerte außerhalb des eigentlichen Lohn-
        # steuerbescheinigungsprogramms zu addieren; hinzuzurechnen sind auch die Ausgabewerte
        # VKVSONST
        @vkvlzz         = BigDecimal.new(0)    # BigDecimal

        # Für den Lohnzahlungszeitraum berücksichtigte Beiträge des Arbeitnehmers
        # zur privaten Basis-Krankenversicherung und privaten Pflege-Pflichtversicherung (ggf.
        # auch die Mindestvorsorgepauschale) in Cent bei sonstigen Bezügen. Der Ausgabewert kann
        # auch negativ sein. Für tarifermäßigt zu besteuernde Vergütungen für mehrjährige
        # Tätigkeiten enthält der PAP keinen entsprechenden Ausgabewert.
        @vkvsonst       = BigDecimal.new(0)    # BigDecimal

        # INTERNALS

        # Altersentlastungsbetrag nach Alterseinkünftegesetz in €,
        # Cent (2 Dezimalstellen)
        @alte           = BigDecimal.new(0)

        # Arbeitnehmer-Pauschbetrag in EURO
        @anp            = BigDecimal.new(0)

        # Auf den Lohnzahlungszeitraum entfallender Anteil von Jahreswerten
        # auf ganze Cents abgerundet
        @anteil1        = BigDecimal.new(0)

        # Bemessungsgrundlage für Altersentlastungsbetrag in €, Cent
        # (2 Dezimalstellen)
        @bmg            = BigDecimal.new(0)

        # Beitragsbemessungsgrenze in der gesetzlichen Krankenversicherung
        # und der sozialen Pflegeversicherung in Euro
        @bbgkvpv        = BigDecimal.new(0)

        # allgemeine Beitragsbemessungsgrenze in der allgemeinen Renten-versicherung in Euro
        @bbgrv          = BigDecimal.new(0)

        # Differenz zwischen ST1 und ST2 in EURO
        @diff           = BigDecimal.new(0)

        # Entlastungsbetrag fuer Alleinerziehende in EURO
        @efa            = BigDecimal.new(0)

        # Versorgungsfreibetrag in €, Cent (2 Dezimalstellen)
        @fvb            = BigDecimal.new(0)

        # Versorgungsfreibetrag in €, Cent (2 Dezimalstellen) für die Berechnung
        # der Lohnsteuer für den sonstigen Bezug
        @fvbso          = BigDecimal.new(0)

        # Zuschlag zum Versorgungsfreibetrag in EURO
        @fvbz           = BigDecimal.new(0)

        # Zuschlag zum Versorgungsfreibetrag in EURO fuer die Berechnung
        # der Lohnsteuer beim sonstigen Bezug
        @fvbzso         = BigDecimal.new(0)

        # Grundfreibetrag in Euro
        @gfb            = BigDecimal.new(0)

        # Maximaler Altersentlastungsbetrag in €
        @hbalte         = BigDecimal.new(0)

        # Massgeblicher maximaler Versorgungsfreibetrag in €
        @hfvb           = BigDecimal.new(0)

        # Massgeblicher maximaler Zuschlag zum Versorgungsfreibetrag in €,Cent
        # (2 Dezimalstellen)
        @hfvbz          = BigDecimal.new(0)

        # Massgeblicher maximaler Zuschlag zum Versorgungsfreibetrag in €, Cent
        # (2 Dezimalstellen) für die Berechnung der Lohnsteuer für den
        # sonstigen Bezug
        @hfvbzso        = BigDecimal.new(0)

        # Nummer der Tabellenwerte fuer Versorgungsparameter
        @j              = 0

        # Jahressteuer nach § 51a EStG, aus der Solidaritaetszuschlag und
        # Bemessungsgrundlage fuer die Kirchenlohnsteuer ermittelt werden in EURO
        @jbmg           = BigDecimal.new(0)

        # Auf einen Jahreslohn hochgerechneter LZZFREIB in €, Cent
        # (2 Dezimalstellen)
        @jlfreib        = BigDecimal.new(0)

        # Auf einen Jahreslohn hochgerechnete LZZHINZU in €, Cent
        # (2 Dezimalstellen)
        @jlhinzu        = BigDecimal.new(0)

        # Jahreswert, dessen Anteil fuer einen Lohnzahlungszeitraum in
        # UPANTEIL errechnet werden soll in Cents
        @jw             = BigDecimal.new(0)

        # Nummer der Tabellenwerte fuer Parameter bei Altersentlastungsbetrag
        @k              = 0

        # Merker für Berechnung Lohnsteuer für mehrjährige Tätigkeit.
        # 0 = normale Steuerberechnung
        # 1 = Steuerberechnung für mehrjährige Tätigkeit
        # 2 = entfällt
        @kennvmt        = 0

        # Summe der Freibetraege fuer Kinder in EURO
        @kfb            = BigDecimal.new(0)

        # Beitragssatz des Arbeitgebers zur Krankenversicherung
        @kvsatzag       = BigDecimal.new(0)

        # Beitragssatz des Arbeitnehmers zur Krankenversicherung
        @kvsatzan       = BigDecimal.new(0)

        # Kennzahl fuer die Einkommensteuer-Tabellenart:
        # 1 = Grundtabelle
        # 2 = Splittingtabelle
        @kztab          = 0

        # Jahreslohnsteuer in EURO
        @lstjahr        = BigDecimal.new(0)

        # Zwischenfelder der Jahreslohnsteuer in Cent
        @lst1           = BigDecimal.new(0)
        @lst2           = BigDecimal.new(0)
        @lst3           = BigDecimal.new(0)
        @lstoso         = BigDecimal.new(0)
        @lstso          = BigDecimal.new(0)

        # Mindeststeuer fuer die Steuerklassen V und VI in EURO
        @mist           = BigDecimal.new(0)

        # Beitragssatz des Arbeitgebers zur Pflegeversicherung
        @pvsatzag       = BigDecimal.new(0)

        # Beitragssatz des Arbeitnehmers zur Pflegeversicherung
        @pvsatzan       = BigDecimal.new(0)

        # Beitragssatz des Arbeitnehmers in der allgemeinen gesetzlichen Rentenversicherung (4 Dezimalstellen)
        @rvsatzan       = BigDecimal.new(0)

        # Rechenwert in Gleitkommadarstellung
        @rw             = BigDecimal.new(0)

        # Sonderausgaben-Pauschbetrag in EURO
        @sap            = BigDecimal.new(0)

        # Freigrenze fuer den Solidaritaetszuschlag in EURO
        @solzfrei       = BigDecimal.new(0)

        # Solidaritaetszuschlag auf die Jahreslohnsteuer in EURO, C (2 Dezimalstellen)
        @solzj          = BigDecimal.new(0)

        # Zwischenwert fuer den Solidaritaetszuschlag auf die Jahreslohnsteuer
        # in EURO, C (2 Dezimalstellen)
        @solzmin        = BigDecimal.new(0)

        # Tarifliche Einkommensteuer in EURO
        @st             = BigDecimal.new(0)

        # Tarifliche Einkommensteuer auf das 1,25-fache ZX in EURO
        @st1            = BigDecimal.new(0)

        # Tarifliche Einkommensteuer auf das 0,75-fache ZX in EURO
        @st2            = BigDecimal.new(0)

        # Zwischenfeld zur Ermittlung der Steuer auf Vergütungen für mehrjährige Tätigkeit
        @stovmt         = BigDecimal.new(0)

        # Teilbetragssatz der Vorsorgepauschale für die Rentenversicherung (2 Dezimalstellen)
        @tbsvorv        = BigDecimal.new(0)

        # Bemessungsgrundlage fuer den Versorgungsfreibetrag in Cents
        @vbezb          = BigDecimal.new(0)

        # Bemessungsgrundlage für den Versorgungsfreibetrag in Cent für
        # den sonstigen Bezug
        @vbezbso        = BigDecimal.new(0)

        # Hoechstbetrag der Vorsorgepauschale nach Alterseinkuenftegesetz in EURO, C
        @vhb            = BigDecimal.new(0)

        # Vorsorgepauschale in EURO, C (2 Dezimalstellen)
        @vsp            = BigDecimal.new(0)

        # Vorsorgepauschale nach Alterseinkuenftegesetz in EURO, C
        @vspn           = BigDecimal.new(0)

        # Zwischenwert 1 bei der Berechnung der Vorsorgepauschale nach
        # dem Alterseinkuenftegesetz in EURO, C (2 Dezimalstellen)
        @vsp1           = BigDecimal.new(0)

        # Zwischenwert 2 bei der Berechnung der Vorsorgepauschale nach
        # dem Alterseinkuenftegesetz in EURO, C (2 Dezimalstellen)
        @vsp2           = BigDecimal.new(0)

        # Vorsorgepauschale mit Teilbeträgen für die gesetzliche Kranken- und
        # soziale Pflegeversicherung nach fiktiven Beträgen oder ggf. für die
        # private Basiskrankenversicherung und private Pflege-Pflichtversicherung
        # in Euro, Cent (2 Dezimalstellen)
        @vsp3           = BigDecimal.new(0)

        # Erster Grenzwert in Steuerklasse V/VI in Euro
        @w1stkl5        = BigDecimal.new(0)

        # Zweiter Grenzwert in Steuerklasse V/VI in Euro
        @w2stkl5        = BigDecimal.new(0)

        # Dritter Grenzwert in Steuerklasse V/VI in Euro
        @w3stkl5        = BigDecimal.new(0)

        # Hoechstbetrag der Vorsorgepauschale nach § 10c Abs. 2 Nr. 2 EStG in EURO
        @vspmax1        = BigDecimal.new(0)

        # Hoechstbetrag der Vorsorgepauschale nach § 10c Abs. 2 Nr. 3 EStG in EURO
        @vspmax2        = BigDecimal.new(0)

        # Vorsorgepauschale nach § 10c Abs. 2 Satz 2 EStG vor der Hoechstbetragsberechnung
        # in EURO, C (2 Dezimalstellen)
        @vspo           = BigDecimal.new(0)

        # Fuer den Abzug nach § 10c Abs. 2 Nrn. 2 und 3 EStG verbleibender
        # Rest von VSPO in EURO, C (2 Dezimalstellen)
        @vsprest        = BigDecimal.new(0)

        # Hoechstbetrag der Vorsorgepauschale nach § 10c Abs. 2 Nr. 1 EStG
        # in EURO, C (2 Dezimalstellen)
        @vspvor         = BigDecimal.new(0)

        # Zu versteuerndes Einkommen gem. § 32a Abs. 1 und 2 EStG €, C
        # (2 Dezimalstellen)
        @x              = BigDecimal.new(0)

        # gem. § 32a Abs. 1 EStG (6 Dezimalstellen)
        @y              = BigDecimal.new(0)

        # Auf einen Jahreslohn hochgerechnetes RE4 in €, C (2 Dezimalstellen)
        # nach Abzug der Freibeträge nach § 39 b Abs. 2 Satz 3 und 4.
        @zre4           = BigDecimal.new(0)

        # Auf einen Jahreslohn hochgerechnetes RE4 in €, C (2 Dezimalstellen)
        @zre4j          = BigDecimal.new(0)

        # Auf einen Jahreslohn hochgerechnetes RE4 in €, C (2 Dezimalstellen)
        # nach Abzug des Versorgungsfreibetrags und des Alterentlastungsbetrags
        # zur Berechnung der Vorsorgepauschale in €, Cent (2 Dezimalstellen)
        @zre4vp         = BigDecimal.new(0)

        # Feste Tabellenfreibeträge (ohne Vorsorgepauschale) in €, Cent
        # (2 Dezimalstellen)
        @ztabfb         = BigDecimal.new(0)

        # Auf einen Jahreslohn hochgerechnetes (VBEZ abzueglich FVB) in
        # EURO, C (2 Dezimalstellen)
        @zvbez          = BigDecimal.new(0)

        # Auf einen Jahreslohn hochgerechnetes VBEZ in €, C (2 Dezimalstellen)
        @zvbezj         = BigDecimal.new(0)

        # Zu versteuerndes Einkommen in €, C (2 Dezimalstellen)
        @zve            = BigDecimal.new(0)

        # Zwischenfelder zu X fuer die Berechnung der Steuer nach § 39b
        # Abs. 2 Satz 7 EStG in €
        @zx             = BigDecimal.new(0)
        @zzx            = BigDecimal.new(0)
        @hoch           = BigDecimal.new(0)
        @vergl          = BigDecimal.new(0)

        # Jahreswert der berücksichtigten Beiträge zur privaten Basis-Krankenversicherung und
        # privaten Pflege-Pflichtversicherung (ggf. auch die Mindestvorsorgepauschale) in Cent.
        @vkv            = BigDecimal.new(0)

        params.each do |key, value|
          instance_variable_set("@#{key}", value)
        end

        mpara
        mre4jl
        @vbezbso = BigDecimal.ZERO
        @kennvmt = 0
        mre4
        mre4abz
        mberech
        msonst
        mvmt
      end

      private

      def mpara
        if @krv < 2
          if @krv == 0
            @bbgrv = BigDecimal.new(78000)
          else
            @bbgrv = BigDecimal.new(69600)
          end
          @rvsatzan = BigDecimal.value_of(0.093)
          @tbsvorv = BigDecimal.value_of(0.72)
        end
        @bbgkvpv = BigDecimal.new(53100)
        @kvsatzan = (@kvz.divide(ZAHL100)).add(BigDecimal.value_of(0.07))
        @kvsatzag = BigDecimal.value_of(0.07)
        if @pvs == 1
          @pvsatzan = BigDecimal.value_of(0.01775)
          @pvsatzag = BigDecimal.value_of(0.00775)
        else
          @pvsatzan = BigDecimal.value_of(0.01275)
          @pvsatzag = BigDecimal.value_of(0.01275)
        end
        if @pvz == 1
          @pvsatzan = @pvsatzan.add(BigDecimal.value_of(0.0025))
        end
        @w1stkl5 = BigDecimal.new(10440)
        @w2stkl5 = BigDecimal.new(27475)
        @w3stkl5 = BigDecimal.new(208426)
        @gfb = BigDecimal.new(9000)
        @solzfrei = BigDecimal.new(972)
      end

      def mre4jl
        if @lzz == 1
          @zre4j = @re4.divide(ZAHL100, 2, BigDecimal.ROUND_DOWN)
          @zvbezj = @vbez.divide(ZAHL100, 2, BigDecimal.ROUND_DOWN)
          @jlfreib = @lzzfreib.divide(ZAHL100, 2, BigDecimal.ROUND_DOWN)
          @jlhinzu = @lzzhinzu.divide(ZAHL100, 2, BigDecimal.ROUND_DOWN)
        else
          if @lzz == 2
            @zre4j = (@re4.multiply(ZAHL12)).divide(ZAHL100, 2, BigDecimal.ROUND_DOWN)
            @zvbezj = (@vbez.multiply(ZAHL12)).divide(ZAHL100, 2, BigDecimal.ROUND_DOWN)
            @jlfreib = (@lzzfreib.multiply(ZAHL12)).divide(ZAHL100, 2, BigDecimal.ROUND_DOWN)
            @jlhinzu = (@lzzhinzu.multiply(ZAHL12)).divide(ZAHL100, 2, BigDecimal.ROUND_DOWN)
          else
            if @lzz == 3
              @zre4j = (@re4.multiply(ZAHL360)).divide(ZAHL700, 2, BigDecimal.ROUND_DOWN)
              @zvbezj = (@vbez.multiply(ZAHL360)).divide(ZAHL700, 2, BigDecimal.ROUND_DOWN)
              @jlfreib = (@lzzfreib.multiply(ZAHL360)).divide(ZAHL700, 2, BigDecimal.ROUND_DOWN)
              @jlhinzu = (@lzzhinzu.multiply(ZAHL360)).divide(ZAHL700, 2, BigDecimal.ROUND_DOWN)
            else
              @zre4j = (@re4.multiply(ZAHL360)).divide(ZAHL100, 2, BigDecimal.ROUND_DOWN)
              @zvbezj = (@vbez.multiply(ZAHL360)).divide(ZAHL100, 2, BigDecimal.ROUND_DOWN)
              @jlfreib = (@lzzfreib.multiply(ZAHL360)).divide(ZAHL100, 2, BigDecimal.ROUND_DOWN)
              @jlhinzu = (@lzzhinzu.multiply(ZAHL360)).divide(ZAHL100, 2, BigDecimal.ROUND_DOWN)
            end
          end
        end
        if @af == 0
          @f = 1
        end
      end

      def mre4
        if @zvbezj.compare_to(BigDecimal.ZERO) == 0
          @fvbz = BigDecimal.ZERO
          @fvb = BigDecimal.ZERO
          @fvbzso = BigDecimal.ZERO
          @fvbso = BigDecimal.ZERO
        else
          if @vjahr < 2006
            @j = 1
          else
            if @vjahr < 2040
              @j = @vjahr - 2004
            else
              @j = 36
            end
          end
          if @lzz == 1
            @vbezb = (@vbezm.multiply(BigDecimal.value_of(@zmvb))).add(@vbezs)
            @hfvb = TAB2[@j].divide(ZAHL12).multiply(BigDecimal.value_of(@zmvb))
            @fvbz = TAB3[@j].divide(ZAHL12).multiply(BigDecimal.value_of(@zmvb)).set_scale(0, BigDecimal.ROUND_UP)
          else
            @vbezb = ((@vbezm.multiply(ZAHL12)).add(@vbezs)).set_scale(2, BigDecimal.ROUND_DOWN)
            @hfvb = TAB2[@j]
            @fvbz = TAB3[@j]
          end
          @fvb = ((@vbezb.multiply(TAB1[@j]))).divide(ZAHL100).set_scale(2, BigDecimal.ROUND_UP)
          if @fvb.compare_to(@hfvb) == 1
            @fvb = @hfvb
          end
          if @fvb.compare_to(@zvbezj) == 1
            @fvb = @zvbezj
          end
          @fvbso = (@fvb.add((@vbezbso.multiply(TAB1[@j])).divide(ZAHL100))).set_scale(2, BigDecimal.ROUND_UP)
          if @fvbso.compare_to(TAB2[@j]) == 1
            @fvbso = TAB2[@j]
          end
          @hfvbzso = (((@vbezb.add(@vbezbso)).divide(ZAHL100)).subtract(@fvbso)).set_scale(2, BigDecimal.ROUND_DOWN)
          @fvbzso = (@fvbz.add((@vbezbso).divide(ZAHL100))).set_scale(0, BigDecimal.ROUND_UP)
          if @fvbzso.compare_to(@hfvbzso) == 1
            @fvbzso = @hfvbzso.set_scale(0, BigDecimal.ROUND_UP)
          end
          if @fvbzso.compare_to(TAB3[@j]) == 1
            @fvbzso = TAB3[@j]
          end
          @hfvbz = ((@vbezb.divide(ZAHL100)).subtract(@fvb)).set_scale(2, BigDecimal.ROUND_DOWN)
          if @fvbz.compare_to(@hfvbz) == 1
            @fvbz = @hfvbz.set_scale(0, BigDecimal.ROUND_UP)
          end
        end
        mre4alte
      end

      def mre4alte
        if @alter1 == 0
          @alte = BigDecimal.ZERO
        else
          if @ajahr < 2006
            @k = 1
          else
            if @ajahr < 2040
              @k = @ajahr - 2004
            else
              @k = 36
            end
          end
          @bmg = @zre4j.subtract(@zvbezj)
          @alte = (@bmg.multiply(TAB4[@k])).set_scale(0, BigDecimal.ROUND_UP)
          @hbalte = TAB5[@k]
          if @alte.compare_to(@hbalte) == 1
            @alte = @hbalte
          end
        end
      end

      def mre4abz
        @zre4 = (@zre4j.subtract(@fvb).subtract(@alte).subtract(@jlfreib).add(@jlhinzu)).set_scale(2, BigDecimal.ROUND_DOWN)
        if @zre4.compare_to(BigDecimal.ZERO) == -1
          @zre4 = BigDecimal.ZERO
        end
        @zre4vp = @zre4j
        if @kennvmt == 2
          @zre4vp = @zre4vp.subtract(@entsch.divide(ZAHL100)).set_scale(2, BigDecimal.ROUND_DOWN)
        end
        @zvbez = @zvbezj.subtract(@fvb).set_scale(2, BigDecimal.ROUND_DOWN)
        if @zvbez.compare_to(BigDecimal.ZERO) == -1
          @zvbez = BigDecimal.ZERO
        end
      end

      def mberech
        mztabfb
        @vfrb = ((@anp.add(@fvb.add(@fvbz))).multiply(ZAHL100)).set_scale(0, BigDecimal.ROUND_DOWN)
        mlstjahr
        @wvfrb = ((@zve.subtract(@gfb)).multiply(ZAHL100)).set_scale(0, BigDecimal.ROUND_DOWN)
        if @wvfrb.compare_to(BigDecimal.ZERO) == -1
          @wvfrb = BigDecimal.value_of(0)
        end
        @lstjahr = (@st.multiply(BigDecimal.value_of(@f))).set_scale(0, BigDecimal.ROUND_DOWN)
        uplstlzz
        upvkvlzz
        if @zkf.compare_to(BigDecimal.ZERO) == 1
          @ztabfb = @ztabfb.add(@kfb)
          mre4abz
          mlstjahr
          @jbmg = (@st.multiply(BigDecimal.value_of(@f))).set_scale(0, BigDecimal.ROUND_DOWN)
        else
          @jbmg = @lstjahr
        end
        msolz
      end

      def mztabfb
        @anp = BigDecimal.ZERO
        if @zvbez.compare_to(BigDecimal.ZERO) >= 0 && @zvbez.compare_to(@fvbz) == -1
          @fvbz = BigDecimal.value_of(@zvbez.longValue())
        end
        if @stkl < 6
          if @zvbez.compare_to(BigDecimal.ZERO) == 1
            if (@zvbez.subtract(@fvbz)).compare_to(BigDecimal.value_of(102)) == -1
              @anp = (@zvbez.subtract(@fvbz)).set_scale(0, BigDecimal.ROUND_UP)
            else
              @anp = BigDecimal.value_of(102)
            end
          end
        else
          @fvbz = BigDecimal.value_of(0)
          @fvbzso = BigDecimal.value_of(0)
        end
        if @stkl < 6
          if @zre4.compare_to(@zvbez) == 1
            if @zre4.subtract(@zvbez).compare_to(ZAHL1000) == -1
              @anp = @anp.add(@zre4).subtract(@zvbez).set_scale(0, BigDecimal.ROUND_UP)
            else
              @anp = @anp.add(ZAHL1000)
            end
          end
        end
        @kztab = 1
        if @stkl == 1
          @sap = BigDecimal.value_of(36)
          @kfb = (@zkf.multiply(BigDecimal.value_of(7428))).set_scale(0, BigDecimal.ROUND_DOWN)
        else
          if @stkl == 2
            @efa = BigDecimal.value_of(1908)
            @sap = BigDecimal.value_of(36)
            @kfb = (@zkf.multiply(BigDecimal.value_of(7428))).set_scale(0, BigDecimal.ROUND_DOWN)
          else
            if @stkl == 3
              @kztab = 2
              @sap = BigDecimal.value_of(36)
              @kfb = (@zkf.multiply(BigDecimal.value_of(7428))).set_scale(0, BigDecimal.ROUND_DOWN)
            else
              if @stkl == 4
                @sap = BigDecimal.value_of(36)
                @kfb = (@zkf.multiply(BigDecimal.value_of(3714))).set_scale(0, BigDecimal.ROUND_DOWN)
              else
                if @stkl == 5
                  @sap = BigDecimal.value_of(36)
                  @kfb = BigDecimal.ZERO
                else
                  @kfb = BigDecimal.ZERO
                end
              end
            end
          end
        end
        @ztabfb = (@efa.add(@anp).add(@sap).add(@fvbz)).set_scale(2, BigDecimal.ROUND_DOWN)
      end

      def mlstjahr
        upevp
        if @kennvmt != 1
          @zve = (@zre4.subtract(@ztabfb).subtract(@vsp)).set_scale(2, BigDecimal.ROUND_DOWN)
          upmlst
        else
          @zve = (@zre4.subtract(@ztabfb).subtract(@vsp).subtract((@vmt).divide(ZAHL100)).subtract((@vkapa).divide(ZAHL100))).set_scale(2, BigDecimal.ROUND_DOWN)
          if @zve.compare_to(BigDecimal.ZERO) == -1
            @zve = @zve.add(@vmt.divide(ZAHL100)).add(@vkapa.divide(ZAHL100)).divide(ZAHL5).set_scale(2, BigDecimal.ROUND_DOWN)
            upmlst
            @st = (@st.multiply(ZAHL5)).set_scale(0, BigDecimal.ROUND_DOWN)
          else
            upmlst
            @stovmt = @st
            @zve = (@zve.add(((@vmt.add(@vkapa)).divide(ZAHL500)))).set_scale(2, BigDecimal.ROUND_DOWN)
            upmlst
            @st = (((@st.subtract(@stovmt)).multiply(ZAHL5)).add(@stovmt)).set_scale(0, BigDecimal.ROUND_DOWN)
          end
        end
      end

      def upvkvlzz
        upvkv
        @jw = @vkv
        upanteil
        @vkvlzz = @anteil1
      end

      def upvkv
        if @pkv > 0
          if @vsp2.compare_to(@vsp3) == 1
            @vkv = @vsp2.multiply(ZAHL100)
          else
            @vkv = @vsp3.multiply(ZAHL100)
          end
        else
          @vkv = BigDecimal.ZERO
        end
      end

      def uplstlzz
        @jw = @lstjahr.multiply(ZAHL100)
        upanteil
        @lstlzz = @anteil1
      end

      def upmlst
        if @zve.compare_to(ZAHL1) == -1
          @zve = BigDecimal.ZERO
          @x = BigDecimal.ZERO
        else
          @x = (@zve.divide(BigDecimal.value_of(@kztab))).set_scale(0, BigDecimal.ROUND_DOWN)
        end
        if @stkl < 5
          uptab18
        else
          mst5_6
        end
      end

      def upevp
        if @krv > 1
          @vsp1 = BigDecimal.ZERO
        else
          if @zre4vp.compare_to(@bbgrv) == 1
            @zre4vp = @bbgrv
          end
          @vsp1 = (@tbsvorv.multiply(@zre4vp)).set_scale(2, BigDecimal.ROUND_DOWN)
          @vsp1 = (@vsp1.multiply(@rvsatzan)).set_scale(2, BigDecimal.ROUND_DOWN)
        end
        @vsp2 = (@zre4vp.multiply(BigDecimal.value_of(0.12))).set_scale(2, BigDecimal.ROUND_DOWN)
        if @stkl == 3
          @vhb = BigDecimal.value_of(3000)
        else
          @vhb = BigDecimal.value_of(1900)
        end
        if @vsp2.compare_to(@vhb) == 1
          @vsp2 = @vhb
        end
        @vspn = (@vsp1.add(@vsp2)).set_scale(0, BigDecimal.ROUND_UP)
        mvsp
        if @vspn.compare_to(@vsp) == 1
          @vsp = @vspn.set_scale(2, BigDecimal.ROUND_DOWN)
        end
      end

      def mvsp
        if @zre4vp.compare_to(@bbgkvpv) == 1
          @zre4vp = @bbgkvpv
        end
        if @pkv > 0
          if @stkl == 6
            @vsp3 = BigDecimal.ZERO
          else
            @vsp3 = @pkpv.multiply(ZAHL12).divide(ZAHL100)
            if @pkv == 2
              @vsp3 = @vsp3.subtract(@zre4vp.multiply(@kvsatzag.add(@pvsatzag))).set_scale(2, BigDecimal.ROUND_DOWN)
            end
          end
        else
          @vsp3 = @zre4vp.multiply(@kvsatzan.add(@pvsatzan)).set_scale(2, BigDecimal.ROUND_DOWN)
        end
        @vsp = @vsp3.add(@vsp1).set_scale(0, BigDecimal.ROUND_UP)
      end

      def mst5_6
        @zzx = @x
        if @zzx.compare_to(@w2stkl5) == 1
          @zx = @w2stkl5
          up5_6
          if @zzx.compare_to(@w3stkl5) == 1
            @st = (@st.add((@w3stkl5.subtract(@w2stkl5)).multiply(BigDecimal.value_of(0.42)))).set_scale(0, BigDecimal.ROUND_DOWN)
            @st = (@st.add((@zzx.subtract(@w3stkl5)).multiply(BigDecimal.value_of(0.45)))).set_scale(0, BigDecimal.ROUND_DOWN)
          else
            @st = (@st.add((@zzx.subtract(@w2stkl5)).multiply(BigDecimal.value_of(0.42)))).set_scale(0, BigDecimal.ROUND_DOWN)
          end
        else
          @zx = @zzx
          up5_6
          if @zzx.compare_to(@w1stkl5) == 1
            @vergl = @st
            @zx = @w1stkl5
            up5_6
            @hoch = (@st.add((@zzx.subtract(@w1stkl5)).multiply(BigDecimal.value_of(0.42)))).set_scale(0, BigDecimal.ROUND_DOWN)
            if @hoch.compare_to(@vergl) == -1
              @st = @hoch
            else
              @st = @vergl
            end
          end
        end
      end

      def up5_6
        @x = (@zx.multiply(BigDecimal.value_of(1.25))).set_scale(2, BigDecimal.ROUND_DOWN)
        uptab18
        @st1 = @st
        @x = (@zx.multiply(BigDecimal.value_of(0.75))).set_scale(2, BigDecimal.ROUND_DOWN)
        uptab18
        @st2 = @st
        @diff = (@st1.subtract(@st2)).multiply(ZAHL2)
        @mist = (@zx.multiply(BigDecimal.value_of(0.14))).set_scale(0, BigDecimal.ROUND_DOWN)
        if @mist.compare_to(@diff) == 1
          @st = @mist
        else
          @st = @diff
        end
      end

      def msolz
        @solzfrei = (@solzfrei.multiply(BigDecimal.value_of(@kztab)))
        if @jbmg.compare_to(@solzfrei) == 1
          @solzj = (@jbmg.multiply(BigDecimal.value_of(5.5))).divide(ZAHL100).set_scale(2, BigDecimal.ROUND_DOWN)
          @solzmin = (@jbmg.subtract(@solzfrei)).multiply(BigDecimal.value_of(20)).divide(ZAHL100).set_scale(2, BigDecimal.ROUND_DOWN)
          if @solzmin.compare_to(@solzj) == -1
            @solzj = @solzmin
          end
          @jw = @solzj.multiply(ZAHL100).set_scale(0, BigDecimal.ROUND_DOWN)
          upanteil
          @solzlzz = @anteil1
        else
          @solzlzz = BigDecimal.ZERO
        end
        if @r > 0
          @jw = @jbmg.multiply(ZAHL100)
          upanteil
          @bk = @anteil1
        else
          @bk = BigDecimal.ZERO
        end
      end

      def upanteil
        if @lzz == 1
          @anteil1 = @jw
        else
          if @lzz == 2
            @anteil1 = @jw.divide(ZAHL12, 0, BigDecimal.ROUND_DOWN)
          else
            if @lzz == 3
              @anteil1 = (@jw.multiply(ZAHL7)).divide(ZAHL360, 0, BigDecimal.ROUND_DOWN)
            else
              @anteil1 = @jw.divide(ZAHL360, 0, BigDecimal.ROUND_DOWN)
            end
          end
        end
      end

      def msonst
        @lzz = 1
        if @zmvb == 0
          @zmvb = 12
        end
        if @sonstb.compare_to(BigDecimal.ZERO) == 0
          @vkvsonst = BigDecimal.ZERO
          @lstso = BigDecimal.ZERO
          @sts = BigDecimal.ZERO
          @solzs = BigDecimal.ZERO
          @bks = BigDecimal.ZERO
        else
          mosonst
          upvkv
          @vkvsonst = @vkv
          @zre4j = ((@jre4.add(@sonstb)).divide(ZAHL100)).set_scale(2, BigDecimal.ROUND_DOWN)
          @zvbezj = ((@jvbez.add(@vbs)).divide(ZAHL100)).set_scale(2, BigDecimal.ROUND_DOWN)
          @vbezbso = @sterbe
          mre4sonst
          mlstjahr
          @wvfrbm = (@zve.subtract(@gfb)).multiply(ZAHL100).set_scale(2, BigDecimal.ROUND_DOWN)
          if @wvfrbm.compare_to(BigDecimal.ZERO) == -1
            @wvfrbm = BigDecimal.ZERO
          end
          upvkv
          @vkvsonst = @vkv.subtract(@vkvsonst)
          @lstso = @st.multiply(ZAHL100)
          @sts = @lstso.subtract(@lstoso).multiply(BigDecimal.value_of(@f)).divide(ZAHL100, 0, BigDecimal.ROUND_DOWN).multiply(ZAHL100)
          if @sts.compare_to(BigDecimal.ZERO) == -1
            @sts = BigDecimal.ZERO
          end
          @solzs = @sts.multiply(BigDecimal.value_of(5.5)).divide(ZAHL100, 0, BigDecimal.ROUND_DOWN)
          if @r > 0
            @bks = @sts
          else
            @bks = BigDecimal.ZERO
          end
        end
      end

      def mvmt
        if @vkapa.compare_to(BigDecimal.ZERO) == -1
          @vkapa = BigDecimal.ZERO
        end
        if (@vmt.add(@vkapa)).compare_to(BigDecimal.ZERO) == 1
          if @lstso.compare_to(BigDecimal.ZERO) == 0
            mosonst
            @lst1 = @lstoso
          else
            @lst1 = @lstso
          end
          @vbezbso = @sterbe.add(@vkapa)
          @zre4j = ((@jre4.add(@sonstb).add(@vmt).add(@vkapa)).divide(ZAHL100)).set_scale(2, BigDecimal.ROUND_DOWN)
          @zvbezj = ((@jvbez.add(@vbs).add(@vkapa)).divide(ZAHL100)).set_scale(2, BigDecimal.ROUND_DOWN)
          @kennvmt = 2
          mre4sonst
          mlstjahr
          @lst3 = @st.multiply(ZAHL100)
          mre4abz
          @zre4vp = @zre4vp.subtract(@jre4ent.divide(ZAHL100)).subtract(@sonstent.divide(ZAHL100))
          @kennvmt = 1
          mlstjahr
          @lst2 = @st.multiply(ZAHL100)
          @stv = @lst2.subtract(@lst1)
          @lst3 = @lst3.subtract(@lst1)
          if @lst3.compare_to(@stv) == -1
            @stv = @lst3
          end
          if @stv.compare_to(BigDecimal.ZERO) == -1
            @stv = BigDecimal.ZERO
          else
            @stv = @stv.multiply(BigDecimal.value_of(@f)).divide(ZAHL100, 0, BigDecimal.ROUND_DOWN).multiply(ZAHL100)
          end
          @solzv = ((@stv.multiply(BigDecimal.value_of(5.5))).divide(ZAHL100)).set_scale(0, BigDecimal.ROUND_DOWN)
          if @r > 0
            @bkv = @stv
          else
            @bkv = BigDecimal.ZERO
          end
        else
          @stv = BigDecimal.ZERO
          @solzv = BigDecimal.ZERO
          @bkv = BigDecimal.ZERO
        end
      end

      def mosonst
        @zre4j = (@jre4.divide(ZAHL100)).set_scale(2, BigDecimal.ROUND_DOWN)
        @zvbezj = (@jvbez.divide(ZAHL100)).set_scale(2, BigDecimal.ROUND_DOWN)
        @jlfreib = @jfreib.divide(ZAHL100, 2, BigDecimal.ROUND_DOWN)
        @jlhinzu = @jhinzu.divide(ZAHL100, 2, BigDecimal.ROUND_DOWN)
        mre4
        mre4abz
        @zre4vp = @zre4vp.subtract(@jre4ent.divide(ZAHL100))
        mztabfb
        @vfrbs1 = ((@anp.add(@fvb.add(@fvbz))).multiply(ZAHL100)).set_scale(2, BigDecimal.ROUND_DOWN)
        mlstjahr
        @wvfrbo = ((@zve.subtract(@gfb)).multiply(ZAHL100)).set_scale(2, BigDecimal.ROUND_DOWN)
        if @wvfrbo.compare_to(BigDecimal.ZERO) == -1
          @wvfrbo = BigDecimal.ZERO
        end
        @lstoso = @st.multiply(ZAHL100)
      end

      def mre4sonst
        mre4
        @fvb = @fvbso
        mre4abz
        @zre4vp = @zre4vp.subtract(@jre4ent.divide(ZAHL100)).subtract(@sonstent.divide(ZAHL100))
        @fvbz = @fvbzso
        mztabfb
        @vfrbs2 = ((((@anp.add(@fvb).add(@fvbz))).multiply(ZAHL100))).subtract(@vfrbs1)
      end

      def uptab18
        if @x.compare_to(@gfb.add(ZAHL1)) == -1
          @st = BigDecimal.ZERO
        else
          if @x.compare_to(BigDecimal.value_of(13997)) == -1
            @y = (@x.subtract(@gfb)).divide(ZAHL10000, 6, BigDecimal.ROUND_DOWN)
            @rw = @y.multiply(BigDecimal.value_of(997.8))
            @rw = @rw.add(BigDecimal.value_of(1400))
            @st = (@rw.multiply(@y)).set_scale(0, BigDecimal.ROUND_DOWN)
          else
            if @x.compare_to(BigDecimal.value_of(54950)) == -1
              @y = (@x.subtract(BigDecimal.value_of(13996))).divide(ZAHL10000, 6, BigDecimal.ROUND_DOWN)
              @rw = @y.multiply(BigDecimal.value_of(220.13))
              @rw = @rw.add(BigDecimal.value_of(2397))
              @rw = @rw.multiply(@y)
              @st = (@rw.add(BigDecimal.value_of(948.49))).set_scale(0, BigDecimal.ROUND_DOWN)
            else
              if @x.compare_to(BigDecimal.value_of(260533)) == -1
                @st = ((@x.multiply(BigDecimal.value_of(0.42))).subtract(BigDecimal.value_of(8621.75))).set_scale(0, BigDecimal.ROUND_DOWN)
              else
                @st = ((@x.multiply(BigDecimal.value_of(0.45))).subtract(BigDecimal.value_of(16437.7))).set_scale(0, BigDecimal.ROUND_DOWN)
              end
            end
          end
        end
        @st = @st.multiply(BigDecimal.value_of(@kztab))
      end

    end
  end
end
