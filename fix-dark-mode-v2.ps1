$files = Get-ChildItem -Path "$PSScriptRoot\case-*.html"

foreach ($f in $files) {
    $content = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)

    # ============================================================
    # 1. Fix --texto, --t60, --t35, --t12 (some files still have dark values)
    # ============================================================
    # jornada-tea
    $content = $content -replace '--texto:\s*#0E0C18;', '--texto:    #EFE9E1;'
    $content = $content -replace '--t60:\s*rgba\(14,12,24,\.6\)', '--t60:      rgba(239,233,225,.65)'
    $content = $content -replace '--t35:\s*rgba\(14,12,24,\.35\)', '--t35:      rgba(239,233,225,.35)'
    $content = $content -replace '--t12:\s*rgba\(14,12,24,\.12\)', '--t12:      rgba(239,233,225,.1)'
    # cerimonial-inclusivo
    $content = $content -replace '--texto:\s*#161215;', '--texto:    #EFE9E1;'
    $content = $content -replace '--t60:\s*rgba\(22,18,21,\.6\)', '--t60:      rgba(239,233,225,.65)'
    $content = $content -replace '--t35:\s*rgba\(22,18,21,\.35\)', '--t35:      rgba(239,233,225,.35)'
    $content = $content -replace '--t12:\s*rgba\(22,18,21,\.12\)', '--t12:      rgba(239,233,225,.1)'
    # videoteca
    $content = $content -replace '--texto:\s*#0C100E;', '--texto:    #EFE9E1;'
    $content = $content -replace '--t60:\s*rgba\(12,16,14,\.6\)', '--t60:      rgba(239,233,225,.65)'
    $content = $content -replace '--t35:\s*rgba\(12,16,14,\.35\)', '--t35:      rgba(239,233,225,.35)'
    $content = $content -replace '--t12:\s*rgba\(12,16,14,\.12\)', '--t12:      rgba(239,233,225,.1)'
    
    # ============================================================
    # 2. Fix --fundo-alt  (some files still have light values)
    # ============================================================
    $content = $content -replace '--fundo-alt:\s*#F6F3F0;', '--fundo-alt:#1E1E1C;'
    $content = $content -replace '--fundo-alt:\s*#F7F3EF;', '--fundo-alt:#1E1E1C;'
    $content = $content -replace '--fundo-alt:\s*#F5F2ED;', '--fundo-alt:#1E1E1C;'
    
    # ============================================================
    # 3. Fix ALL text elements that use color: var(--preto) 
    #    These are INVISIBLE on dark backgrounds
    # ============================================================
    # .sec-titulo  (the main one from your screenshots!)
    $content = $content -replace '(\.sec-titulo\s*\{[^}]*?)color:\s*var\(--preto\)', '$1color: var(--creme)'
    # Also sec-titulo em with dark accent colors -> lighten them
    $content = $content -replace '\.sec-titulo em \{ font-style: italic; color: var\(--borgonha\); \}', '.sec-titulo em { font-style: italic; color: #C47A8E; }'
    $content = $content -replace '\.sec-titulo em \{ font-style:italic; color:var\(--borgonha\); \}', '.sec-titulo em { font-style:italic; color:#C47A8E; }'
    $content = $content -replace '\.sec-titulo em \{ font-style: italic; color: var\(--azul\); \}', '.sec-titulo em { font-style: italic; color: #5B9AD5; }'
    $content = $content -replace '\.sec-titulo em \{ font-style: italic; color: var\(--teal\); \}', '.sec-titulo em { font-style: italic; color: #4CA8B8; }'
    $content = $content -replace '\.sec-titulo em \{ font-style: italic; color: var\(--violeta\); \}', '.sec-titulo em { font-style: italic; color: #A89BD5; }'
    $content = $content -replace '\.sec-titulo em \{ font-style: italic; color: var\(--verde2\); \}', '.sec-titulo em { font-style: italic; color: #5CB580; }'
    $content = $content -replace '\.sec-titulo em \{ font-style: italic; color: var\(--vinho\); \}', '.sec-titulo em { font-style: italic; color: #B877A8; }'

    # .nav-back:hover and .nav-projeto - text in nav
    $content = $content -replace '\.nav-back:hover \{ color: var\(--preto\); \}', '.nav-back:hover { color: var(--creme); }'
    $content = $content -replace '\.nav-back:hover \{ color:var\(--preto\); \}', '.nav-back:hover { color:var(--creme); }'
    # nav-projeto
    $content = $content -replace '(\.nav-projeto\s*\{[^}]*?)color:\s*var\(--preto\)', '$1color: var(--creme)'

    # .obj-titulo
    $content = $content -replace '(\.obj-titulo\s*\{[^}]*?)color:\s*var\(--preto\)', '$1color: var(--creme)'

    # .diag-titulo 
    $content = $content -replace '(\.diag-titulo\s*\{[^}]*?)color:\s*var\(--preto\)', '$1color: var(--creme)'

    # .pilar-titulo
    $content = $content -replace '(\.pilar-titulo\s*\{[^}]*?)color:\s*var\(--preto\)', '$1color: var(--creme)'
    
    # .cap-titulo
    $content = $content -replace '(\.cap-titulo\s*\{[^}]*?)color:\s*var\(--preto\)', '$1color: var(--creme)'

    # .ac-titulo
    $content = $content -replace '(\.ac-titulo\s*\{[^}]*?)color:\s*var\(--preto\)', '$1color: var(--creme)'

    # .parceria-titulo
    $content = $content -replace '(\.parceria-titulo\s*\{[^}]*?)color:\s*var\(--preto\)', '$1color: var(--creme)'
    
    # .barra-nome (didatica)
    $content = $content -replace '(\.barra-nome\s*\{[^}]*?)color:\s*var\(--preto\)', '$1color: var(--creme)'

    # .fb-titulo (didatica)
    $content = $content -replace '(\.fb-titulo\s*\{[^}]*?)color:\s*var\(--preto\)', '$1color: var(--creme)'

    # .pub-titulo-trabalho (digitavox)
    $content = $content -replace '(\.pub-titulo-trabalho\s*\{[^}]*?)color:\s*var\(--preto\)', '$1color: var(--creme)'

    # .aprend-titulo
    $content = $content -replace '(\.aprend-titulo\s*\{[^}]*?)color:\s*var\(--preto\)', '$1color: var(--creme)'
    
    # ============================================================
    # 4. Fix accent colors used for text that are too dark on dark bg
    # ============================================================
    # .est-titulo  with dark accent colors
    $content = $content -replace '(\.est-titulo\s*\{[^}]*?)color:\s*var\(--azul\)', '$1color: #5B9AD5'
    $content = $content -replace '(\.est-titulo\s*\{[^}]*?)color:\s*var\(--teal\)', '$1color: #4CA8B8'
    $content = $content -replace '(\.est-titulo\s*\{[^}]*?)color:\s*var\(--vinho\)', '$1color: #B877A8'

    # .vid-titulo with dark accents 
    $content = $content -replace '(\.vid-titulo\s*\{[^}]*?)color:\s*var\(--vinho\)', '$1color: #B877A8'
    $content = $content -replace '(\.vid-titulo\s*\{[^}]*?)color:\s*var\(--azul\)', '$1color: #5B9AD5'

    # .cap-nome with dark accents 
    $content = $content -replace '(\.cap-nome\s*\{[^}]*?)color:\s*var\(--violeta\)', '$1color: #A89BD5'
    $content = $content -replace '(\.cap-nome\s*\{[^}]*?)color:\s*var\(--verde2\)', '$1color: #5CB580'
    $content = $content -replace '(\.cap-nome\s*\{[^}]*?)color:\s*var\(--borgonha\)', '$1color: #C47A8E'

    # .dado-val with dark accents
    $content = $content -replace '(\.dado-val\s*\{[^}]*?)color:\s*var\(--azul\)', '$1color: #5B9AD5'
    $content = $content -replace '(\.dado-val\s*\{[^}]*?)color:\s*var\(--teal\)', '$1color: #4CA8B8'
    $content = $content -replace '(\.dado-val\s*\{[^}]*?)color:\s*var\(--vinho\)', '$1color: #B877A8'
    $content = $content -replace '(\.dado-val\s*\{[^}]*?)color:\s*var\(--borgonha\)', '$1color: #C47A8E'

    # .barra-nota, .fb-n-val with dark accents
    $content = $content -replace '(\.barra-nota\s*\{[^}]*?)color:\s*var\(--azul\)', '$1color: #5B9AD5'
    $content = $content -replace '(\.fb-n-val\s*\{[^}]*?)color:\s*var\(--azul\)', '$1color: #5B9AD5'

    # .resumo-frase - on the hero-dir dark panel, these accent colors are too dark
    $content = $content -replace '(\.resumo-frase\s*\{[^}]*?)color:\s*var\(--azul\)', '$1color: #5B9AD5'
    $content = $content -replace '(\.resumo-frase\s*\{[^}]*?)color:\s*var\(--teal\)', '$1color: #4CA8B8'
    $content = $content -replace '(\.resumo-frase\s*\{[^}]*?)color:\s*var\(--borgonha\)', '$1color: #C47A8E'
    $content = $content -replace '(\.resumo-frase\s*\{[^}]*?)color:\s*var\(--violeta\)', '$1color: #A89BD5'
    $content = $content -replace '(\.resumo-frase\s*\{[^}]*?)color:\s*var\(--vinho\)', '$1color: #B877A8'
    $content = $content -replace '(\.resumo-frase\s*\{[^}]*?)color:\s*var\(--verde\)', '$1color: #5CB580'

    # .papel-quote with dark accents
    $content = $content -replace '(\.papel-quote\s*\{[^}]*?)color:\s*var\(--violeta\)', '$1color: #A89BD5'
    $content = $content -replace '(\.papel-quote\s*\{[^}]*?)color:\s*var\(--verde\)', '$1color: #5CB580'

    # .res-qual-titulo with dark accents 
    $content = $content -replace '(\.res-qual-titulo\s*\{[^}]*?)color:\s*var\(--violeta\)', '$1color: #A89BD5'
    $content = $content -replace '(\.res-qual-titulo\s*\{[^}]*?)color:\s*var\(--verde2\)', '$1color: #5CB580'

    # .pilar-nome with dark accents
    $content = $content -replace '(\.pilar-nome\s*\{[^}]*?)color:\s*var\(--verde2\)', '$1color: #5CB580'

    # .sec-label with dark accents (some use dark colors like --uva #5C3566)
    $content = $content -replace '(\.sec-label\s*\{[^}]*?)color:\s*var\(--uva\)', '$1color: #B87CC8'
    
    # .resumo-label with dark accents
    $content = $content -replace '(\.resumo-label\s*\{[^}]*?)color:\s*var\(--uva\)', '$1color: #B87CC8'

    # ============================================================
    # 5. Fix .sec-alt, .pilar, .acessib, .cap backgrounds on dark
    # ============================================================
    # .papel-texto-wrap with translucent colors that may be invisible
    $content = $content -replace 'rgba\(45,34,96,\.07\)', 'rgba(168, 155, 213, .1)'
    $content = $content -replace 'rgba\(26,61,42,\.07\)', 'rgba(92, 181, 128, .1)'

    # .vid-num with translucent dark colors
    $content = $content -replace '(\.vid-num\s*\{[^}]*?)color:\s*rgba\(44,26,46,\.32\)', '$1color: rgba(184,119,168,.35)'

    # inline styles on creme backgrounds (like the jornada-tea creme box)
    $content = $content -replace 'background:var\(--creme\); padding:2\.5rem 3rem;', 'background:#1E1E1C; padding:2.5rem 3rem;'

    [System.IO.File]::WriteAllText($f.FullName, $content, [System.Text.Encoding]::UTF8)
    Write-Host "Updated: $($f.Name)"
}

Write-Host "`nDone! All case files updated for Dark Mode v2."
