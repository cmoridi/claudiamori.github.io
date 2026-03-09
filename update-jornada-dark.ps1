$file = "$PSScriptRoot\case-jornada-tea.html"
$content = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

# Variáveis raiz
$content = $content -replace '--fundo:\s*#FFFFFF;', '--fundo:     #141414;'
$content = $content -replace '--fundo-alt:\s*#F6F3F0;', '--fundo-alt: #1E1E1C;'
$content = $content -replace '--texto:\s*#0E0C18;', '--texto:     #EFE9E1;'
$content = $content -replace '--t60:\s*rgba\(14,12,24,\.6\);', '--t60:       rgba(239,233,225,.65);'
$content = $content -replace '--t35:\s*rgba\(14,12,24,\.35\);', '--t35:       rgba(239,233,225,.35);'
$content = $content -replace '--t12:\s*rgba\(14,12,24,\.12\);', '--t12:       rgba(239,233,225,.1);'

# Fundo do menu
$content = $content -replace 'background:\s*rgba\(255,255,255,\.96\);', 'background: rgba(20,20,20,.96);'

# Hero lado direito
$content = $content -replace '\.hero-dir\s*{\s*background:\s*var\(--creme\);', '.hero-dir {
  background: #1A1A18;'

# Hover do botão de voltar
$content = $content -replace '\.nav-back:hover\s*{\s*color:\s*var\(--preto\);\s*}', '.nav-back:hover { color: var(--creme); }'
$content = $content -replace '(\.nav-projeto\s*{\s*[^}]*?)color:\s*var\(--preto\);', '$1color: var(--creme);'

# Títulos escuros 
$content = $content -replace '(\.sec-titulo\s*{\s*[^}]*?)color:\s*var\(--preto\);', '$1color: var(--creme);'
$content = $content -replace '(\.sec-titulo\s*em\s*{\s*[^}]*?)color:\s*var\(--violeta\);', '$1color: #A89BD5;'

$content = $content -replace '(\.diag-titulo\s*{\s*[^}]*?)color:\s*var\(--preto\);', '$1color: var(--creme);'
$content = $content -replace '(\.pilar-titulo\s*{\s*[^}]*?)color:\s*var\(--preto\);', '$1color: var(--creme);'
$content = $content -replace '(\.cap-titulo\s*{\s*[^}]*?)color:\s*var\(--preto\);', '$1color: var(--creme);'
$content = $content -replace '(\.ac-titulo\s*{\s*[^}]*?)color:\s*var\(--preto\);', '$1color: var(--creme);'
$content = $content -replace '(\.parceria-titulo\s*{\s*[^}]*?)color:\s*var\(--preto\);', '$1color: var(--creme);'

# Títulos e acentos que ficam escuros demais
$content = $content -replace '(\.cap-nome\s*{\s*[^}]*?)color:\s*var\(--violeta\);', '$1color: #A89BD5;'
$content = $content -replace '(\.resumo-frase\s*{\s*[^}]*?)color:\s*var\(--violeta\);', '$1color: #A89BD5;'
$content = $content -replace '(\.res-qual-titulo\s*{\s*[^}]*?)color:\s*var\(--violeta\);', '$1color: #A89BD5;'
$content = $content -replace '(\.papel-quote\s*{\s*[^}]*?)color:\s*var\(--violeta\);', '$1color: #A89BD5;'

# Outras caixas e fundos
$content = $content -replace '(\.papel-texto-wrap\s*{\s*[^}]*?)background:\s*rgba\(45,34,96,\.07\);', '$1background: rgba(168, 155, 213, .1);'
$content = $content -replace '<div style="margin-top:2px; background:var\(--creme\); padding:2\.5rem 3rem;">', '<div style="margin-top:2px; background:#1E1E1C; padding:2.5rem 3rem;">'
$content = $content -replace 'color:var\(--violeta\); line-height:1\.6;">A estrutura interativa', 'color:#A89BD5; line-height:1.6;">A estrutura interativa'

# Hero-dir border correction since now dark
$content = $content -replace 'border-left:\s*3px solid var\(--ambar\);', 'border-left: 3px solid var(--ambar);'

[System.IO.File]::WriteAllText($file, $content, [System.Text.Encoding]::UTF8)
Write-Host "Arquivo atualizado e configurado para Dark Mode com sucesso."
