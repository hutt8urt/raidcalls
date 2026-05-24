addon.author   = 'toogood'
addon.name     = 'raidcalls'
addon.version  = '2.6'

require('common')
local imgui = require('imgui')

local showWindow = true

-------------------------------------------------
-- Chat Mode
-------------------------------------------------
local chatMode = 'p'
local tellTarget = ''

-------------------------------------------------
-- Command Help
-------------------------------------------------
print('==============================')
print('[RaidCalls] Commands:')
print('/rcmode p              -> Party Chat')
print('/rcmode l              -> Linkshell 1')
print('/rcmode l2             -> Linkshell 2')
print('/rcmode t <player>     -> Tell Player')
print('/rcmode pt <player>    -> Party + Tell')
print('==============================')

-------------------------------------------------
-- Helper
-------------------------------------------------
local function sendMessage(msg)

    -------------------------------------------------
    -- Party
    -------------------------------------------------
    if (chatMode == 'p' or chatMode == 'pt') then

        AshitaCore:GetChatManager():QueueCommand(
            1,
            string.format('/p >>> %s <<<', msg)
        )
    end

    -------------------------------------------------
    -- Linkshell 1
    -------------------------------------------------
    if (chatMode == 'l') then

        AshitaCore:GetChatManager():QueueCommand(
            1,
            string.format('/l >>> %s <<<', msg)
        )
    end

    -------------------------------------------------
    -- Linkshell 2
    -------------------------------------------------
    if (chatMode == 'l2') then

        AshitaCore:GetChatManager():QueueCommand(
            1,
            string.format('/l2 >>> %s <<<', msg)
        )
    end

    -------------------------------------------------
    -- Tell
    -------------------------------------------------
    if (chatMode == 't' or chatMode == 'pt') then

        if (tellTarget == '') then
            print('[RaidCalls] No tell target set.')
            return
        end

        AshitaCore:GetChatManager():QueueCommand(
            1,
            string.format(
                '/tell %s >>> %s <<<',
                tellTarget,
                msg
            )
        )
    end
end

-------------------------------------------------
-- Commands
-------------------------------------------------
ashita.events.register('command', 'raidcalls_command', function (e)

    local args = e.command:args()

    if (#args == 0) then
        return
    end

    -------------------------------------------------
    -- Chat Modes
    -------------------------------------------------
    if (args[1] == '/rcmode') then
        e.blocked = true

        -------------------------------------------------
        -- Party
        -------------------------------------------------
        if (args[2] == 'p') then

            chatMode = 'p'

            print('[RaidCalls] Mode set to Party.')

        -------------------------------------------------
        -- Linkshell 1
        -------------------------------------------------
        elseif (args[2] == 'l') then

            chatMode = 'l'

            print('[RaidCalls] Mode set to Linkshell 1.')

        -------------------------------------------------
        -- Linkshell 2
        -------------------------------------------------
        elseif (args[2] == 'l2') then

            chatMode = 'l2'

            print('[RaidCalls] Mode set to Linkshell 2.')

        -------------------------------------------------
        -- Tell
        -------------------------------------------------
        elseif (args[2] == 't') then

            chatMode = 't'

            if (args[3] ~= nil) then
                tellTarget = args[3]
            end

            print(string.format(
                '[RaidCalls] Mode set to Tell (%s).',
                tellTarget
            ))

        -------------------------------------------------
        -- Party + Tell
        -------------------------------------------------
        elseif (args[2] == 'pt') then

            chatMode = 'pt'

            if (args[3] ~= nil) then
                tellTarget = args[3]
            end

            print(string.format(
                '[RaidCalls] Mode set to Party + Tell (%s).',
                tellTarget
            ))
        end
    end
end)

-------------------------------------------------
-- Draw UI
-------------------------------------------------
ashita.events.register('d3d_present', 'raidcalls_ui', function ()

    if (not showWindow) then
        return
    end

    imgui.SetNextWindowSize({255, 430}, ImGuiCond_FirstUseEver)

    if (imgui.Begin('Raid Calls', true)) then

        -------------------------------------------------
        -- Mode Display
        -------------------------------------------------
        local modeDisplay = 'Party'

        if (chatMode == 'l') then

            modeDisplay = 'Linkshell 1'

        elseif (chatMode == 'l2') then

            modeDisplay = 'Linkshell 2'

        elseif (chatMode == 't') then

            modeDisplay = string.format(
                'Tell: %s',
                tellTarget
            )

        elseif (chatMode == 'pt') then

            modeDisplay = string.format(
                'Party + Tell: %s',
                tellTarget
            )
        end

        imgui.Text(string.format(
            'Mode: %s',
            modeDisplay
        ))

        imgui.Separator()

        -------------------------------------------------
        -- Main
        -------------------------------------------------
        imgui.Text('Main')

        if (imgui.Button('Start', {115, 22})) then
            sendMessage('START DPS')
        end

        imgui.SameLine()

        if (imgui.Button('Hold', {115, 22})) then
            sendMessage('HOLD DPS')
        end

        if (imgui.Button('Focus Add', {115, 22})) then
            sendMessage('FOCUS ADD')
        end

        imgui.SameLine()

        if (imgui.Button('Focus Boss', {115, 22})) then
            sendMessage('FOCUS BOSS')
        end

        if (imgui.Button('Stun #1', {115, 22})) then
            sendMessage('STUN #1 GO!')
        end

        imgui.SameLine()

        if (imgui.Button('Stun #2', {115, 22})) then
            sendMessage('STUN #2 GO!')
        end

        -------------------------------------------------
        -- Dynamis
        -------------------------------------------------
        imgui.Spacing()
        imgui.Text('Dynamis')

        if (imgui.Button('Ninja', {115, 22})) then
            sendMessage('NINJA WARNING')
        end

        imgui.SameLine()

        if (imgui.Button('Hold TP', {115, 22})) then
            sendMessage('HOLD TP')
        end

        if (imgui.Button('Perfect Dodge', {115, 22})) then
            sendMessage(
                'PERFECT DODGE - BLM PICK OFF MOBS'
            )
        end

        imgui.SameLine()

        if (imgui.Button('Invincible', {115, 22})) then
            sendMessage(
                'INVINCIBLE - BLM PICK OFF MOBS'
            )
        end

        if (imgui.Button('Slimes', {115, 22})) then
            sendMessage('SLIMES NEED SILENCE')
        end

        imgui.SameLine()

        if (imgui.Button('White Mage', {115, 22})) then
            sendMessage('WHITE MAGE WARNING')
        end

        -------------------------------------------------
        -- Holds
        -------------------------------------------------
        imgui.Spacing()
        imgui.Text('20% Holds')

        if (imgui.Button('80%', {115, 22})) then
            sendMessage('HOLD AT NEXT 80%')
        end

        imgui.SameLine()

        if (imgui.Button('60%', {115, 22})) then
            sendMessage('HOLD AT NEXT 60%')
        end

        if (imgui.Button('40%', {115, 22})) then
            sendMessage('HOLD AT NEXT 40%')
        end

        imgui.SameLine()

        if (imgui.Button('20%', {115, 22})) then
            sendMessage('HOLD AT NEXT 20%')
        end

        imgui.Spacing()
        imgui.Text('25% Holds')

        if (imgui.Button('75%', {115, 22})) then
            sendMessage('HOLD AT NEXT 75%')
        end

        imgui.SameLine()

        if (imgui.Button('50%', {115, 22})) then
            sendMessage('HOLD AT NEXT 50%')
        end

        if (imgui.Button('25%', {115, 22})) then
            sendMessage('HOLD AT NEXT 25%')
        end
    end

    imgui.End()
end)