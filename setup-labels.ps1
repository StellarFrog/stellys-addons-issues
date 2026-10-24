# setup-labels.ps1 - create the triage labels on this issues repo.
#
# Run once after the repo exists:   .\setup-labels.ps1
# Safe to re-run: existing labels are updated rather than duplicated.
#
# Why per-addon labels: the fleet is 17 addons sharing one tracker, so "which addon" is the first
# question on every issue. The dropdown in the bug form records it in the body, but only a LABEL
# makes it filterable, which is what you actually want three months in.
#
# Every file in this repo is deliberately ASCII only, with no byte order mark. Editing these files
# with PowerShell's Get-Content/Set-Content silently re-encodes them through the ANSI codepage and
# corrupts any non-ASCII character, which is how the first version of this repo ended up rendering
# emoji as mojibake on GitHub.

param(
    [string]$Repo = "StellarFrog/stellys-addons-issues"
)
$ErrorActionPreference = 'Continue'

# name, colour, description
$labels = @(
    # --- type ---
    @('bug',              'd73a4a', 'Something is broken'),
    @('feedback',         '0e8a16', 'A suggestion, request or opinion'),
    @('needs triage',     'ededed', 'Not yet looked at'),
    @('confirmed',        'b60205', 'Reproduced, and it is a real defect'),
    @('cannot reproduce', 'fef2c0', 'Could not make it happen; more detail needed'),
    @('duplicate',        'cfd3d7', 'Already tracked in another issue'),
    @('upstream',         '5319e7', 'Caused by DXRP core or the s&box engine, not an addon'),
    @('fixed pending release', '1d76db', 'Fixed in development, not published yet'),
    @('wont fix',         'ffffff', 'Working as intended, or out of scope'),

    # --- priority ---
    @('priority: high',   'b60205', 'Breaks a server, loses money or blocks play'),
    @('priority: normal', 'fbca04', 'Should be fixed'),
    @('priority: low',    'c2e0c6', 'Minor or cosmetic'),

    # --- addon ---
    @('addon: living skies',    '1f6feb', 'Weather, sky, day and night'),
    @('addon: events',          '1f6feb', 'Classic Events Pack'),
    @('addon: lottery',         '1f6feb', 'Classic Lottery'),
    @('addon: movement',        '1f6feb', 'Classic Movement'),
    @('addon: kidnapping',      '1f6feb', 'Classic Kidnapping'),
    @('addon: thief',           '1f6feb', 'Classic Thief'),
    @('addon: command center',  '1f6feb', "Stelly's Command Center"),
    @('addon: black market',    '1f6feb', "Stelly's Black Market"),
    @('addon: dj kit',          '1f6feb', "Stelly's DJ Kit"),
    @('addon: fit kit',         '1f6feb', "Stelly's Fit Kit"),
    @('addon: mining',          '1f6feb', "Stelly's Mining Co."),
    @('addon: narcotics',       '1f6feb', "Stelly's Narcotics"),
    @('addon: precinct',        '1f6feb', "Stelly's Precinct"),
    @('addon: press',           '1f6feb', "Stelly's Press"),
    @('addon: rewards',         '1f6feb', "Stelly's Rewards System"),
    @('addon: skate',           '1f6feb', "Stelly's Skate"),
    @('addon: smokes',          '1f6feb', "Stelly's Smokes")
)

$made = 0; $failed = 0
foreach ($l in $labels) {
    $name = $l[0]; $colour = $l[1]; $desc = $l[2]
    $out = & gh label create $name --repo $Repo --color $colour --description $desc --force 2>&1
    if ($LASTEXITCODE -eq 0) {
        $made++
        Write-Host ("  {0}" -f $name) -ForegroundColor Green
    }
    else {
        $failed++
        Write-Host ("  {0}  FAILED: {1}" -f $name, ($out -join ' ')) -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "$made applied, $failed failed" -ForegroundColor Cyan
Write-Host "GitHub's own defaults (enhancement, question, good first issue) are left alone; delete them in the UI if you do not want them."
