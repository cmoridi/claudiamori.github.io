$file = "$PSScriptRoot\case-jornada-tea.html"
$c = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

# Variáveis (agora com espaços na regex)
$c = $c -replace '--texto:\s*#0E0C18', '--texto: #EFE9E1'
$c = $c -replace '--t60:\s*rgba\(14,\s*12,\s*24,\s*\.6\)', '--t60: rgba(239,233,225,.65)'
$c = $c -replace '--t35:\s*rgba\(14,\s*12,\s*24,\s*\.35\)', '--t35: rgba(239,233,225,.35)'
$c = $c -replace '--t12:\s*rgba\(14,\s*12,\s*24,\s*\.12\)', '--t12: rgba(239,233,225,.1)'

# Fundo escuro
$c = $c -replace '--fundo:\s*#FFFFFF', '--fundo: #141414'
$c = $c -replace '--fundo-alt:\s*#F6F3F0', '--fundo-alt: #1E1E1C'

# Tudo que força color: var(--preto) precisa virar color: var(--creme)
# Podemos fazer um replace abrangente já que é garantido que var(--preto) em texto tá invisível
$c = $c -replace 'color:\s*var\(--preto\)', 'color: var(--creme)'

# Textos específicos com acento violeta (que ficam invisíveis)
$c = $c -replace 'color:\s*var\(--violeta\)', 'color: #A89BD5'

# Arrumando a nav que pode ter color: #fff etc
$c = $c -replace 'background:\s*rgba\(255,\s*255,\s*255,\s*\.96\)', 'background: rgba(20,20,20,.96)'

# Arrumar hero-dir
$c = $c -replace '\.hero-dir\s*{([^}]*?)background:\s*var\(--creme\)', '.hero-dir {$1background: #1A1A18'

# Caixa papel resumo
$c = $c -replace 'background:\s*rgba\(45,\s*34,\s*96,\s*\.07\)', 'background: rgba(168, 155, 213, .1)'

$c = $c -replace 'background:\s*var\(--creme\);\s*padding:\s*2\.5rem\s+3rem;', 'background: #1E1E1C; padding: 2.5rem 3rem;'

[System.IO.File]::WriteAllText($file, $c, [System.Text.Encoding]::UTF8)
Write-Host "Cores arrumadas!"
