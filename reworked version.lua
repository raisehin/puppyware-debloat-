repeat 
    task.wait() 
until game:IsLoaded()

local StartTick = tick()
local Env = getgenv()

if Env.Puppyware and Env.Puppyware.Libraries and Env.Puppyware.Libraries.Utility and Env.Puppyware.Libraries.Utility.Unload then
    Env.Puppyware.Libraries.Utility:Unload()
end

-- Variables
    -- Game / Random Functions
        local game = game
        local assert, 
            loadstring, 
            select, 
            next, 
            type, 
            typeof, 
            pcall, 
            xpcall, 
            setmetatable, 
            tick, 
            warn, 
            pairs 
            = 
            assert, 
            loadstring, 
            select, 
            next, 
            type, 
            typeof, 
            pcall, 
            xpcall, 
            setmetatable, 
            tick, 
            warn, 
            pairs
        local stringformat = string.format
        local getgenv, 
            getrawmetatable, 
            gethiddenproperty 
            = 
            getgenv, 
            getrawmetatable, 
            gethiddenproperty
        local osclock = os.clock

        local game_mt = getrawmetatable(game)

        local game_index = game_mt.__index

        local GetServiceFunc = game_index(game, "GetService")

        local GetService = function(...) return GetServiceFunc(game, ...) end

        local FindFirstChild = game_index(game, "FindFirstChild")

        local FindFirstChildWhichIsA = game_index(game, "FindFirstChildWhichIsA")

        local IsA = game_index(game, "IsA") 

        local camera_mt = getrawmetatable(workspace.CurrentCamera)

        local camera_index = camera_mt.__index
        
        local WorldToViewportPoint = camera_index(workspace.CurrentCamera, "WorldToViewportPoint")

        local workspace_mt = getrawmetatable(workspace)

        local workspace_index = workspace_mt.__index
        
        local Raycast = workspace_index(workspace, "Raycast")
    --

    -- Services
        local Players = GetService("Players")
        local UserInputService = GetService("UserInputService")
        local RunService = GetService("RunService")
        local HttpService = GetService("HttpService")
        local Workspace = GetService("Workspace")
        local CoreGui = GetService("CoreGui")
        local ContextActionService = GetService("ContextActionService")
        local TeleportService = GetService("TeleportService")
        local Lighting = GetService("Lighting")
        local Stats = GetService("Stats")
        local TweenService = GetService("TweenService")
        local Debris = GetService("Debris")
        local TextChatService = GetService("TextChatService")
        local ReplicatedStorage = GetService("ReplicatedStorage")
    --

    -- Game
        local Camera = Workspace.CurrentCamera
        local LocalPlayer = Players.LocalPlayer
        local PlaceId = game.PlaceId
        local Mouse = LocalPlayer:GetMouse()
        local TextChannels = FindFirstChild(TextChatService, "TextChannels")
        local MainChannel = TextChannels and FindFirstChild(TextChannels, "RBXGeneral")
    --

    -- Position Spaces
        local Vector2new = Vector2.new
        local Vector3new = Vector3.new
        local CFramenew = CFrame.new
        local CFrameAngles = CFrame.Angles
        local Vector2zero = Vector2.zero
        local Vector3zero = Vector3.zero
        local UDim2new = UDim2.new
        local UDimnew = UDim.new
        local UDim2offset = UDim2.fromOffset
    --

    -- Math Functions
        local mathclamp = math.clamp
        local mathfloor = math.floor
        local mathcos = math.cos
        local mathabs = math.abs
        local mathatan2 = math.atan2
        local mathrad = math.rad
        local mathsin = math.sin
        local mathmax = math.max
        local mathmin = math.min
        local mathpi = math.pi
        local mathacos = math.acos
        local mathsqrt = math.sqrt
        local mathrandom = math.random
        local mathdeg = math.deg
        local halfpi = mathpi / 2
    --

    -- Color Functions
        local Color3new = Color3.new
        local Color3fromRGB = Color3.fromRGB
        local Color3fromHSV = Color3.fromHSV
        local Color3fromHex = Color3.fromHex
    --

    -- Table Functions
        local tableremove = table.remove
        local tableinsert = table.insert
        local tablefind = table.find
        local tablesort = table.sort
        local tableclear = table.clear
        local tableconcat = table.concat
        local tableunpack = table.unpack
    --

    -- Extra Functions
        local coroutinewrap = coroutine.wrap
        local taskwait = task.wait
        local Drawingnew = Drawing.new
        local Instancenew = Instance.new
        local taskspawn = task.spawn
        local MouseMoveRel = Env.mousemoverel
    --

    local Controller = {
        Alive = false,
        RootPart = nil,
        Humanoid = nil,
        Character = nil
    }

    local Misc = {
        ChatSpam = {
            Nerd = {},
            Random = {},
            Emojis = {},
            Symbols = {},
        },
        Sleeping = false,
        Gun = {
            Shotguns = {
                "[Double-Barrel SG]", 
                "[TacticalShotgun]", 
                "[Shotgun]"
            }
        },
        GunConnections = {},
        CurrentHealth = {},
        Hitsounds = {
            ["Skeet"] = "rbxassetid://5447626464",
            ["Slap"] = "rbxassetid://5447626464",
            ["Rust"] = "rbxassetid://5043539486",
            ["Bag"] = "rbxassetid://5043539486"
        },
        Prediction = {
            ["Close"] = {
                [30] = 0.12542465767834,
                [40] = 0.12742,
                [60] = 0.134543,
                [70] = 0.141,
                [80] = 0.1413,
                [90] = 0.1487,
                [120] = 0.15738,
                [140] = 0.12534,
                [200] = 0.1652131,
                [210] = 0.16789548,
                [220] = 0.17057786,
                [230] = 0.17326024,
                [240] = 0.17594262,
                [250] = 0.178,
                [260] = 0.18066667,
                [270] = 0.18333334,
                [280] = 0.186,
                [290] = 0.18866667,
                [300] = 0.190
            },
            ["Mid"] = {
                [30] = 0.12588,
                [40] = 0.11,
                [50] = 0.127668,
                [60] = 0.12731,
                [80] = 0.1365,
                [90] = 0.138,
                [120] = 0.157,
                [140] = 0.13432,
                [200] = 0.16779123,
                [210] = 0.170233106,
                [220] = 0.172674982,
                [230] = 0.175116858,
                [240] = 0.177558734,
                [250] = 0.181,
                [260] = 0.18366667,
                [270] = 0.18633334,
                [280] = 0.189,
                [290] = 0.19166667,
                [300] = 0.193
            },
            ["Far"] = {
                [30] = 0.11120,
                [40] = 0.11120,
                [50] = 0.12542465767834,
                [60] = 0.12921,
                [70] = 0.1311,
                [80] = 0.1311,
                [90] = 0.1311,
                [120] = 0.14325,
                [140] = 0.138876,
                [200] = 0.165455312399999,
                [210] = 0.168636781,
                [220] = 0.171818206,
                [230] = 0.174999631,
                [240] = 0.178181056,
                [250] = 0.178,
                [260] = 0.181,
                [270] = 0.184,
                [280] = 0.187,
                [290] = 0.189,
                [300] = 0.191
            }
        }
    }

    local Visuals = {
        BulletTracers = {
            ["Default"] = "rbxassetid://446111271",
            ["Beam"] = "rbxassetid://7151777149",
            ["Ion Beam"] = "rbxassetid://2950987173",
            ["Lightning"] = "rbxassetid://7151778302",
            ["Pulsing"] = "rbxassetid://11226108137",
            ["DNA"] = "rbxassetid://6511613786",
        },
        Materials = {
            ["ForceField"] = Enum.Material.ForceField,
            -- ["Glass"] = Enum.Material.Glass,
            -- ["Neon"] = Enum.Material.Neon,
            -- ["Plastic"] = Enum.Material.Plastic,
            -- ["Foil"] = Enum.Material.Foil,
            -- ["Ice"] = Enum.Material.Ice,
            -- ["Snow"] = Enum.Material.Snow,
            -- ["Cobblestone"] = Enum.Material.Cobblestone,
            -- ["Marble"] = Enum.Material.Marble,
        },
        Skyboxes = {
            ["Purple Nebula"] = {
                SkyboxBk = "rbxassetid://159454299",
                SkyboxDn = "rbxassetid://159454296",
                SkyboxFt = "rbxassetid://159454293",
                SkyboxLf = "rbxassetid://159454286",
                SkyboxRt = "rbxassetid://159454300",
                SkyboxUp = "rbxassetid://159454288"
            },
            ["Night Sky"] = {
                SkyboxBk = "rbxassetid://12064107",
                SkyboxDn = "rbxassetid://12064152",
                SkyboxFt = "rbxassetid://12064121",
                SkyboxLf = "rbxassetid://12063984",
                SkyboxRt = "rbxassetid://12064115",
                SkyboxUp = "rbxassetid://12064131"
            },
            ["Pink Daylight"] = {
                SkyboxBk = "rbxassetid://271042516",
                SkyboxDn = "rbxassetid://271077243",
                SkyboxFt = "rbxassetid://271042556",
                SkyboxLf = "rbxassetid://271042310",
                SkyboxRt = "rbxassetid://271042467",
                SkyboxUp = "rbxassetid://271077958"
            },
            ["Morning Glow"] = {
                SkyboxBk = "rbxassetid://1417494030",
                SkyboxDn = "rbxassetid://1417494146",
                SkyboxFt = "rbxassetid://1417494253",
                SkyboxLf = "rbxassetid://1417494402",
                SkyboxRt = "rbxassetid://1417494499",
                SkyboxUp = "rbxassetid://1417494643"
            },
            ["Setting Sun"] = {
                SkyboxBk = "rbxassetid://626460377",
                SkyboxDn = "rbxassetid://626460216",
                SkyboxFt = "rbxassetid://626460513",
                SkyboxLf = "rbxassetid://626473032",
                SkyboxRt = "rbxassetid://626458639",
                SkyboxUp = "rbxassetid://626460625"
            },
            ["Cache"] = {
                SkyboxBk = "rbxassetid://220513302",
                SkyboxDn = "rbxassetid://213221473",
                SkyboxFt = "rbxassetid://220513328",
                SkyboxLf = "rbxassetid://220513318",
                SkyboxRt = "rbxassetid://220513279",
                SkyboxUp = "rbxassetid://220513345"
            },
            ["Fade Blue"] = {
                SkyboxBk = "rbxassetid://153695414",
                SkyboxDn = "rbxassetid://153695352",
                SkyboxFt = "rbxassetid://153695452",
                SkyboxLf = "rbxassetid://153695320",
                SkyboxRt = "rbxassetid://153695383",
                SkyboxUp = "rbxassetid://153695471"
            },
            ["Elegant Morning"] = {
                SkyboxBk = "rbxassetid://153767241",
                SkyboxDn = "rbxassetid://153767216",
                SkyboxFt = "rbxassetid://153767266",
                SkyboxLf = "rbxassetid://153767200",
                SkyboxRt = "rbxassetid://153767231",
                SkyboxUp = "rbxassetid://153767288"
            },
            ["Neptune"] = {
                SkyboxBk = "rbxassetid://218955819",
                SkyboxDn = "rbxassetid://218953419",
                SkyboxFt = "rbxassetid://218954524",
                SkyboxLf = "rbxassetid://218958493",
                SkyboxRt = "rbxassetid://218957134",
                SkyboxUp = "rbxassetid://218950090"
            },
            ["Redshift"] = {
                SkyboxBk = "rbxassetid://401664839",
                SkyboxDn = "rbxassetid://401664862",
                SkyboxFt = "rbxassetid://401664960",
                SkyboxLf = "rbxassetid://401664881",
                SkyboxRt = "rbxassetid://401664901",
                SkyboxUp = "rbxassetid://401664936"
            },
            ["Aesthetic Night"] = {
                SkyboxBk = "rbxassetid://1045964490",
                SkyboxDn = "rbxassetid://1045964368",
                SkyboxFt = "rbxassetid://1045964655",
                SkyboxLf = "rbxassetid://1045964655",
                SkyboxRt = "rbxassetid://1045964655",
                SkyboxUp = "rbxassetid://1045962969"
            },
            ["Minecraft"] = {
                SkyboxBk = "rbxassetid://1876545003",
                SkyboxDn = "rbxassetid://1876544331",
                SkyboxFt = "rbxassetid://1876542941",
                SkyboxLf = "rbxassetid://1876543392",
                SkyboxRt = "rbxassetid://1876543764",
                SkyboxUp = "rbxassetid://1876544642"
            }
        },
        PartMaterials = {
            Minecraft = {
                Wood = "rbxassetid://3258599312",
                WoodPlanks = "rbxassetid://8676581022",
                Brick = "rbxassetid://8558400252",
                Cobblestone = "rbxassetid://5003953441",
                Concrete = "rbxassetid://7341687607",
                DiamondPlate = "rbxassetid://6849247561",
                Fabric = "rbxassetid://118776397",
                Granite = "rbxassetid://4722586771",
                Grass = "rbxassetid://4722588177",
                Ice = "rbxassetid://3823766459",
                Marble = "rbxassetid://62967586",
                Metal = "rbxassetid://62967586",
                Sand = "rbxassetid://152572215"
            },
        },
        Hits = {}
    }

    local ESP = {
        Players = {},
        Items = {},
        Image = nil,
        EnemyImage = nil,
        TeamImage = nil,
        FileType = nil,
        EnemyFileType = nil,
        TeamFileType = nil,
    }

    local Aimbot = {
        Targets = {},
        Target = nil,
        elapsedTime = 0,
        OldTarget = nil,
        Position = nil,
    }

    local SilentAim = {
        Targets = {},
        Target = nil,
        Position = nil,
    }

    local ConvertKeys = {
        [Enum.KeyCode.LeftShift] = "LS",
        [Enum.KeyCode.RightShift] = "RS",
        [Enum.KeyCode.LeftControl] = "LC",
        [Enum.KeyCode.RightControl] = "RC",
        [Enum.KeyCode.Insert] = "INS",
        [Enum.KeyCode.Backspace] = "BS",
        [Enum.KeyCode.Return] = "Ent",
        [Enum.KeyCode.LeftAlt] = "LA",
        [Enum.KeyCode.RightAlt] = "RA",
        [Enum.KeyCode.CapsLock] = "CAPS",
        [Enum.KeyCode.One] = "1",
        [Enum.KeyCode.Two] = "2",
        [Enum.KeyCode.Three] = "3",
        [Enum.KeyCode.Four] = "4",
        [Enum.KeyCode.Five] = "5",
        [Enum.KeyCode.Six] = "6",
        [Enum.KeyCode.Seven] = "7",
        [Enum.KeyCode.Eight] = "8",
        [Enum.KeyCode.Nine] = "9",
        [Enum.KeyCode.Zero] = "0",
        [Enum.KeyCode.KeypadOne] = "Num1",
        [Enum.KeyCode.KeypadTwo] = "Num2",
        [Enum.KeyCode.KeypadThree] = "Num3",
        [Enum.KeyCode.KeypadFour] = "Num4",
        [Enum.KeyCode.KeypadFive] = "Num5",
        [Enum.KeyCode.KeypadSix] = "Num6",
        [Enum.KeyCode.KeypadSeven] = "Num7",
        [Enum.KeyCode.KeypadEight] = "Num8",
        [Enum.KeyCode.KeypadNine] = "Num9",
        [Enum.KeyCode.KeypadZero] = "Num0",
        [Enum.KeyCode.Minus] = "-",
        [Enum.KeyCode.Equals] = "=",
        [Enum.KeyCode.Tilde] = "~",
        [Enum.KeyCode.LeftBracket] = "[",
        [Enum.KeyCode.RightBracket] = "]",
        [Enum.KeyCode.RightParenthesis] = ")",
        [Enum.KeyCode.LeftParenthesis] = "(",
        [Enum.KeyCode.Semicolon] = ",",
        [Enum.KeyCode.Quote] = "'",
        [Enum.KeyCode.BackSlash] = "\\",
        [Enum.KeyCode.Comma] = ",",
        [Enum.KeyCode.Period] = ".",
        [Enum.KeyCode.Slash] = "/",
        [Enum.KeyCode.Asterisk] = "*",
        [Enum.KeyCode.Plus] = "+",
        [Enum.KeyCode.Period] = ".",
        [Enum.KeyCode.Backquote] = "`",
        [Enum.UserInputType.MouseButton1] = "MB1",
        [Enum.UserInputType.MouseButton2] = "MB2",
        [Enum.UserInputType.MouseButton3] = "MB3",
        [Enum.KeyCode.Escape] = "ESC",
        [Enum.KeyCode.Space] = "SPC",
    }

    local Library = {
        Objects = {},
        ThemeMap = {},
        ThemeInstances = {},
        Images = {
            Saturation = "rbxassetid://13901004307",
            Checkers = "http://www.roblox.com/asset/?id=18274452449",
            Scroll = "rbxassetid://12776289446"
        },
        Theme = {
            ["Outline"] = Color3fromRGB(0, 0, 0),
            ["Background"] = Color3fromRGB(37, 37, 37),
            ["Accent"] = Color3fromRGB(0, 122, 204),
            ["Text"] = Color3fromRGB(255, 255, 255),
            ["Tab Enabled"] = Color3fromRGB(65, 65, 65),
            ["Tab Disabled"] = Color3fromRGB(45, 45, 45),
            ["Element Background"] = Color3fromRGB(45, 45, 45),
            ["Dark Text"] = Color3fromRGB(190, 190, 190)
        },
        OriginalTheme = {
            ["Outline"] = Color3fromRGB(0, 0, 0),
            ["Background"] = Color3fromRGB(37, 37, 37),
            ["Accent"] = Color3fromRGB(0, 122, 204),
            ["Text"] = Color3fromRGB(255, 255, 255),
            ["Tab Enabled"] = Color3fromRGB(65, 65, 65),
            ["Tab Disabled"] = Color3fromRGB(45, 45, 45),
            ["Element Background"] = Color3fromRGB(45, 45, 45),
            ["Dark Text"] = Color3fromRGB(190, 190, 190)
        },
        Folder = "Puppyware",
        ScreenGui = nil,
        TweenSpeed = 0.2,
        LerpSpeed = 0.02,
        TweenEasingStyle = Enum.EasingStyle.Quint,
        Flags = {},
        ConfigFlags = {},
        CopiedColor = {
            c = Color3fromRGB(255, 255, 255),
            a = 1,
        },
        Keybinds = {},
        Notifications = {},
        Fps = 0
    }

    local Utility = {
        Connections = {},
        Objects = {},
        Drawings = {},
        BindToRenderSteps = {},
        DrawingTypes = {
            "Quad",
            "Square",
            "Circle",
            "Text",
            "Line",
            "Triangle",
            "Font"
        },
        Errors = {},
    }

    local Desync = {
        Positions = {
            Old = nil,
            New = nil
        },
        Overwriten = nil,
        ClonedCharacter = nil,
        NewStatus = nil,
    }
    
    local Puppyware = {
        Libraries = {
            Controller = Controller,
            Misc = Misc,
            Visuals = Visuals,
            ESP = ESP,
            Aimbot = Aimbot,
            Library = Library,
            Utility = Utility,
            Desync = Desync
        },
        User = "developer",
        Players = {},
    }

    local Games = {
        [2788229376] = {Arg = "UpdateMousePosI", Remote = "MainEvent"},
        [16033173781] = {Arg = "UpdateMousePosI", Remote = "MainEvent"},
        [17344804827] = {Arg = "UpdateMousePos", Remote = "MainEvent"},
        [7213786345] = {Arg = "UpdateMousePosI", Remote = "MainEvent"},
        [9825515356] = {Arg = "MousePosUpdate", Remote = "MainEvent"},
        [5602055394] = {Arg = "MousePos", Remote = "Bullets"},
        [7951883376] = {Arg = "MousePos", Remote = "Bullets"},
        [9183932460] = {Arg = "UpdateMousePos", Remote = ".gg/untitledhood"},
        [17403265390] = {Arg = "MOUSE", Remote = "MAINEVENT"},
        [14412601883] = {Arg = "MOUSE", Remote = "MAINEVENT"},
        [18111448661] = {Arg = "MOUSE", Remote = "MAINEVENT"},
        [14487637618] = {Arg = "MOUSE", Remote = "MAINEVENT"},
        [11143225577] = {Arg = "UpdateMousePos", Remote = "MainEvent"},
        [14413712255] = {Arg = "MOUSE", Remote = "MAINEVENT"},
        [17714122625] = {Arg = "UpdateMousePos", Remote = "MainEvent"},
        [12867571492] = {Arg = "UpdateMousePos", Remote = "MainEvent"},
        [11867820563] = {Arg = "UpdateMousePos", Remote = "MainEvent"},
        [17109142105] = {Arg = "MoonUpdateMousePos", Remote = "MainEvent"},
        [15186202290] = {Arg = "MOUSE", Remote = "MAINEVENT"},
        [16469595315] = {Arg = "UpdateMousePos", Remote = "MainEvent"},
        [17319408836] = {Arg = "UpdateMousePos", Remote = "MainEvent"},
        [14975320521] = {Arg = "UpdateMousePos", Remote = "MainEvent"},
        [17200018150] = {Arg = "UpdateMousePos", Remote = "MainEvent"},
    }

    local Gravity = Vector3new(0, workspace.Gravity, 0)

    Env.Puppyware = Puppyware
--

-- Adonis Bypass
    do -- i do this, so these variables go nowhere else, i got this bypass from J.
        if getrenv and getrenv().debug and getrenv().debug.info and hookfunction and setthreadidentity then
            local Hooked = {}

            local Detected, Kill

            setthreadidentity(2)

            for _,v in getgc(true) do
                if type(v) == "table" then
                    local DetectFunc = rawget(v, "Detected")
                    local KillFunc = rawget(v, "Kill")
                
                    if type(DetectFunc) == "function" and not Detected then
                        Detected = DetectFunc
                        
                        local Old; Old = hookfunction(Detected, function(Action, Info, NoCrash)
                            return true
                        end)

                        table.insert(Hooked, Detected)
                    end

                    if rawget(v, "Variables") and rawget(v, "Process") and type(KillFunc) == "function" and not Kill then
                        Kill = KillFunc

                        table.insert(Hooked, Kill)
                    end
                end
            end

            local OldInfo; OldInfo = hookfunction(getrenv().debug.info, newcclosure(function(...)
                local LevelOrFunc, Info = ...

                if Detected and LevelOrFunc == Detected then
                    return coroutine.yield(coroutine.running())
                end
                
                return OldInfo(...)
            end))

            setthreadidentity(7)
        end
    end
--

-- Custom Fonts
    local fonts = {
        { ttf = "Proggy.ttf", json = "Proggy.json", url = "https://raw.githubusercontent.com/OxygenClub/Random-LUAS/main/Proggy.txt", name = "Proggy" },
        { ttf = "Minecraftia.ttf", json = "Minecraftia.json", url = "https://raw.githubusercontent.com/OxygenClub/Random-LUAS/main/Minecraftia.txt", name = "Minecraftia" },
        { ttf = "SmallestPixel7.ttf", json = "SmallestPixel7.json", url = "https://raw.githubusercontent.com/OxygenClub/Random-LUAS/main/Smallest%20Pixel.txt", name = "SmallestPixel7" },
        { ttf = "Verdana.ttf", json = "Verdana.json", url = "https://raw.githubusercontent.com/OxygenClub/Random-LUAS/main/Verdana.txt", name = "Verdana" },
        { ttf = "VerdanaBold.ttf", json = "VerdanaBold.json", url = "https://raw.githubusercontent.com/OxygenClub/Random-LUAS/main/Verdana%20Bold.txt", name = "VerdanaBold" },
        { ttf = "Tahoma.ttf", json = "Tahoma.json", url = "https://raw.githubusercontent.com/OxygenClub/Random-LUAS/main/Tahoma.txt", name = "Tahoma" },
        { ttf = "TahomaBold.ttf", json = "TahomaBold.json", url = "https://raw.githubusercontent.com/OxygenClub/Random-LUAS/main/Tahoma%20Bold.txt", name = "TahomaBold" }
    }

    for _, font in fonts do
        if not isfile(font.ttf) then
            writefile(font.ttf, base64_decode(game:HttpGet(font.url)))
        end

        if not isfile(font.json) then
            local fontConfig = {
                name = font.name,
                faces = {
                    {
                        name = "Regular",
                        weight = 200,
                        style = "normal",
                        assetId = getcustomasset(font.ttf)
                    }
                }
            }
            writefile(font.json, HttpService:JSONEncode(fontConfig))
        end


    end

    local DrawingFontsEnum = {
        [0] = Font.new(getcustomasset("Verdana.json"), Enum.FontWeight.Regular),
        [1] = Font.new(getcustomasset("SmallestPixel7.json"), Enum.FontWeight.Regular),
        [2] = Font.new(getcustomasset("Proggy.json"), Enum.FontWeight.Regular),
        [3] = Font.new(getcustomasset("Minecraftia.json"), Enum.FontWeight.Regular),
        [4] = Font.new(getcustomasset("VerdanaBold.json"), Enum.FontWeight.Regular),
        [5] = Font.new(getcustomasset("Tahoma.json"), Enum.FontWeight.Regular),
        [6] = Font.new(getcustomasset("TahomaBold.json"), Enum.FontWeight.Regular),
    }

    function GetFontFromIndex(fontIndex)
        return DrawingFontsEnum[fontIndex]
    end

    local Fonts = {
        ["Verdana"] = 0,
        ["Smallest Pixel-7"] = 1,
        ["Proggy"] = 2,
        ["Minecraftia"] = 3,
        ["Verdana Bold"] = 4,
        ["Tahoma"] = 5,
        ["Tahoma Bold"] = 6
    }
--

-- Utility
    -- define random utils 
    local BLRayParams = RaycastParams.new()
    BLRayParams.FilterDescendantsInstances = { Camera, workspace:FindFirstChild("Ignore"), workspace:FindFirstChild("Ignored"), workspace:FindFirstChild("ignored"), workspace:FindFirstChild("ignore"), workspace:FindFirstChild("Debris"), workspace:FindFirstChild("debris") }
    BLRayParams.FilterType = Enum.RaycastFilterType.Exclude
    BLRayParams.IgnoreWater = true

    Utility.Blacklist = BLRayParams 

    function Utility:New(type, props, secondarg)
        local IsDrawing = tablefind(Utility.DrawingTypes, type)

        local NewFunction = IsDrawing and Drawingnew or Instancenew
        
        local Object = NewFunction(type, secondarg)

        if props then
            for _,v in props do
                Object[_] = v
            end
        end

        if IsDrawing then
            Utility.Drawings[#Utility.Drawings + 1] = Object
        else
            Utility.Objects[#Utility.Objects + 1] = Object
        end

        return Object
    end

    function Utility:Connect(signal, func, name)
        name = name or "Undefined"

        local Connection; Connection = signal:Connect(function(...)
            local Args = {...}

            local Success, Message = pcall(function() coroutinewrap(func)(unpack(Args)) end)

            if not Success and not Utility.Errors[Message] then
                warn(('ERROR!!!\nAn error has occurred with the message:\n%s\nSignal Type: %s\nName: %s'):format(Message, tostring(signal), name))

                if Library.Notify then
                    Library:Notify({
                        Text =('<font color="rgb(255, 0, 0)">ERROR!!! </font>\nAn error has occurred with the message:\n%s\nSignal Type: %s\nName: %s'):format(Message, tostring(signal), name),
                        Time = 5000,
                        Type = "Warning",
                        Animation = "Bounce",
                    })
                end

                Utility.Errors[Message] = Message
                
                if Utility.Connections[Connection] then
                    Utility.Connections[Connection] = nil
                end

                return Connection:Disconnect()
            end
        end)

        if Connection then
            tableinsert(Utility.Connections, Connection)
        end
        
        return Connection
    end

    function Utility:BindToRenderStep(name, enum, callback)
        RunService:BindToRenderStep(name, enum, callback)

        Utility.BindToRenderSteps[name] = name
    end 

    function Utility:CFrameToVector3(cframe)
        return Vector3new(cframe.X, cframe.Y, cframe.Z)
    end

    function Utility:Lerp(a, b, c)
        c = c or 1 / 8
        
        local offset = mathabs(b - a)
        if (offset < c) then 
            return b 
        end 

        return a + (b - a) * c
    end

    function Utility:Round(number, float)
        local multiplier = 1 / (float or 1)
        return mathfloor(number * multiplier + 0.5) / multiplier
    end

    function Utility:CalculateVelocity(part)
        local OldPosition = part.Position
        local OldTime = tick()

        taskwait()

        local NewPosition = part.Position
        local NewTime = tick()

        local DistanceTraveled = NewPosition - OldPosition

        local TimeInterval = NewTime - OldTime

        local Velocity = DistanceTraveled / TimeInterval

        return Velocity
    end

    function Utility:ConvertToEnum(Value)
        local enumParts = {}
        for part in string.gmatch(Value, "[%w_]+") do
            tableinsert(enumParts, part)
        end

        local enumTable = Enum
        for i = 2, #enumParts do
            local enumItem = enumTable[enumParts[i]]

            enumTable = enumItem
        end

        return enumTable
    end

    function Utility:GetRotate(Vec, Rads)
        local vec = Vec.Unit
        local sin = mathsin(Rads)
        local cos = mathcos(Rads)
        local x = (cos * vec.x) - (sin * vec.y)
        local y = (sin * vec.x) + (cos * vec.y)

        return Vector2new(x, y).Unit * Vec.Magnitude
    end

    function Utility:MouseOver(object)
        local posX, posY = object.AbsolutePosition.X, object.AbsolutePosition.Y
        local size = object.AbsoluteSize
        local sizeX, sizeY = posX + size.X, posY + size.Y
        local position = UserInputService:GetMouseLocation() - Vector2new(0, 38)

        if position.X >= posX and position.Y >= posY and position.X <= sizeX and position.Y <= sizeY then
            return true
        end

        return false
    end

    function Utility:CreateBulletTracer(origin, endpos, color, trans, time, decal)
        local Decal = Visuals.BulletTracers[decal] or "rbxassetid://446111271"

        local OriginAttachment = Utility:New("Attachment", {
            Position = origin,
            Parent = workspace.Terrain
        })

        local EndAttachment = Utility:New("Attachment", {
            Position = endpos,
            Parent = workspace.Terrain
        })
        
        local Beam = Utility:New("Beam", {
            Texture = Decal,
            LightEmission = 1,
            LightInfluence = 0,
            TextureSpeed = 10,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, color),
                ColorSequenceKeypoint.new(1, color)
            }),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, trans),
                NumberSequenceKeypoint.new(1, trans),
            }),
            Width0 = 1.2,
            Width1 = 1.2,
            Attachment0 = OriginAttachment,
            Attachment1 = EndAttachment,
            Enabled = true,
            Parent = Workspace.Terrain
        })

        Debris:AddItem(OriginAttachment, time)
        Debris:AddItem(EndAttachment, time)
        Debris:AddItem(Beam, time)
    end

    function Utility:PlaySound(id, volume, pitch)	
		local Sound = Utility:New("Sound", {
			Parent = Camera,
			Volume = volume / 100,
			Pitch = pitch / 100,
			SoundId = id,
			PlayOnRemove = true
		}):Destroy()
	end

    function Utility:GetPrediction(ping, distance)
        local PingTable = distance <= 35 and Misc.Prediction.Close or distance <= 70 and Misc.Prediction.Mid or distance <= 9e9 and Misc.Prediction.Far
    
        if ping <= 30 then
            return PingTable[30]
        elseif ping <= 40 then
            return PingTable[40]
        elseif ping <= 50 then
            return PingTable[50]
        elseif ping <= 60 then
            return PingTable[60]
        elseif ping <= 80 then
            return PingTable[80]
        elseif ping <= 90 then
            return PingTable[90]
        elseif ping <= 120 then
            return PingTable[120]
        elseif ping <= 140 then
            return PingTable[140]
        elseif ping <= 200 then
            return PingTable[200]
        end
    end

    function Utility:Line(obj, from, to)
        local direction = (to - from)
        local center = (to + from) / 2
        local distance = direction.Magnitude
        local theta = math.deg(math.atan2(direction.Y, direction.X))

        obj.Position = UDim2new(0, math.floor(center.X), 0, math.floor(center.Y))
        obj.Rotation = theta
        obj.Size = UDim2new(0, math.floor(distance), 0, 1)
    end

    function Utility.GetFiles(folder, extensions)
        local LibraryFolder = `{Library.Folder}/{folder}/`

        if not isfolder(LibraryFolder) then
            makefolder(LibraryFolder)
        end

        local Files = isfolder(LibraryFolder) and listfiles(LibraryFolder) or {}
        local StoredFiles = {}
        local FileNames = {}

        for _,v in Files do
            for _,ext in extensions do
                if v:find(ext) then
                    StoredFiles[#StoredFiles + 1] = v
                    FileNames[#FileNames + 1] = v:gsub(LibraryFolder, ""):gsub(ext, "")
                end
            end
        end
    
        return StoredFiles, FileNames
    end

    -- Functions to change for multi-game support.
        function Utility:GetTeam(player)
            return IsA(player, "Player") and player.Team or nil
        end

        function Utility:GetCharacter(player)
            return player.Character or nil
        end

        function Utility:GetHumanoid(character)
            return FindFirstChildWhichIsA(character, "Humanoid")
        end

        function Utility:GetRootPart(character, humanoid)
            return FindFirstChild(character, "HumanoidRootPart") or humanoid and humanoid.RootPart or character.PrimaryPart or nil
        end

        function Utility:GetPlayers()
            return Players:GetPlayers()
        end

        function Utility:GetName(player)
            return player.Name
        end

        function Utility:GetStyleName(player)
            return player.Name
        end

        function Utility:GetHealth(plr, humanoid)
            return humanoid and humanoid.Health or 100, humanoid and humanoid.MaxHealth or 100
        end

        function Utility:GetBodyPart(character, name)
            return name == "HumanoidRootPart" and Utility:GetRootPart(character, nil) or FindFirstChild(character, name)
        end

        local RigParts = {
            ["Left Arm"] = "LeftLowerArm",
            ["Right Arm"] = "RightLowerArm",
            ["Left Leg"] = "LeftLowerLeg",
            ["Right Leg"] = "RightLowerLeg"
        }

        function Utility:GetPart(character, name)
            return FindFirstChild(character, name) or RigParts[name] and FindFirstChild(character, RigParts[name]) or nil
        end

        function Utility:GetLocalPlayerCharacter()
            return Utility:GetCharacter(LocalPlayer)
        end

        function Utility:GetToolName(player, character)
            local Tool = FindFirstChildWhichIsA(character, "Tool")

            return Tool and Tool.Name
        end

        function Utility:GetRootPart(character, humanoid)
            local BodyEffects = FindFirstChild(character, "BodyEffects")
            local Knocked = BodyEffects and FindFirstChild(BodyEffects, "K.O")
            local KnockedValue = Knocked and Knocked.Value or false

            return KnockedValue and FindFirstChild(character, "LowerTorso") or FindFirstChild(character, "HumanoidRootPart") or humanoid and humanoid.RootPart or character.PrimaryPart or nil
        end
    --
    
    function Visuals:CopyPlayerCharacter(player, time, color)
		local Character = Utility:GetCharacter(player)

		if Character then
			for _,v in next, Character:GetChildren() do
                if (IsA(v, "BasePart") or IsA(v, "Part") or IsA(v, "MeshPart")) and v.Name ~= "HumanoidRootPart" and v.Transparency ~= 1 then
                    local BodyPart = v:Clone()

                    BodyPart.Anchored = true
                    BodyPart.CanCollide = false

                    BodyPart:ClearAllChildren()

                    BodyPart.Parent = Workspace.Terrain

                    Visuals:ApplyChams(BodyPart, "ForceField", color.c, 1 - color.a, 0)

                    Debris:AddItem(BodyPart, time)
                end
			end
		end
	end

    -- generic unloading
    function Utility:Unload()
        for _,v in Utility.Connections do
            v:Disconnect()
        end

        for _,v in Utility.BindToRenderSteps do
            RunService:UnbindFromRenderStep(v)
        end

        for _,v in Utility.Objects do
            v:Destroy()
        end
        
        for _,v in Utility.Drawings do
            if v and v.Remove then
                v:Remove()
            end
        end
    end
--

-- Library
    Library.__index = Library

    if not isfolder(Library.Folder) then
        makefolder(Library.Folder)
    end

    if not isfolder(Library.Folder .. "/Configs") then
        makefolder(Library.Folder .. "/Configs")
    end

    if not isfolder(Library.Folder .. "/Images") then
        makefolder(Library.Folder .. "/Images")
    end

    if not isfile(Library.Folder .. "/Chat-Spam.txt") then
        writefile(Library.Folder .. "/Chat-Spam.txt", "Hey change your chatspam!\nWoah, this guy didn't change his chatspam >_<.\nJust change your chatspam.")
    end

    Library.Font = GetFontFromIndex(2)
    Library.FontSize = 12

    Library.ScreenGui = Utility:New("ScreenGui", {
        Name = "\0",
        Parent = CoreGui,
    })
    Library.Popups = Utility:New("ScreenGui",{
        Name = "\0",
        Parent = CoreGui
    })
    Library.ListsGui = Utility:New("ScreenGui", {
        Name = "\0",
        Parent = CoreGui
    })

    --[[
        Toggle - Done,
        Slider - Done,
        Button - Done,
        Dropdown - Done,
        Keybind - Done,
        Colorpicker - Not Done,
        List - Not Done,
        Textbox - Done
    ]]--

    function Library:CreateSelects(position)
        local Selectables = {}

        -- Keybind Mode
            local KeybindMode = {
                Flag = ""
            }
            
            local KeybindModeOutline = Library:New("Frame", {
                Name = "KeybindModeOutline",
                Visible = false,
                Parent = Library.Popups,
                BorderSizePixel = 0,
                Position = UDim2new(0, 500, 0, 500),
                Size = UDim2new(0, 200, 0, 46),
            })

            KeybindMode.Holder = KeybindModeOutline

            KeybindModeOutline.Active = true
            KeybindModeOutline.Draggable = true

            Library:AddTheme(KeybindModeOutline, {
                BackgroundColor3 = "Outline",
            })

            local KeybindModeBackground = Library:New("Frame", {
                Name = "KeybindModeBackground",
                Parent = KeybindModeOutline,
                BorderSizePixel = 0,
                Position = UDim2new(0, 1, 0, 1),
                Size = UDim2new(1, -2, 1, -2),
            })

            Library:AddTheme(KeybindModeBackground, {
                BackgroundColor3 = "Background",
            })

            local KeybindModeDropdownHolder = Library:New("Frame", {
                Name = "KeybindModeBackground",
                Parent = KeybindModeOutline,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2new(0, 5, 0, 5),
                Size = UDim2new(1, -10, 1, -10),
            })

            local KeybindModeDropdown; KeybindModeDropdown = Library.Dropdown({Holder = KeybindModeDropdownHolder, ContentHolder = Library.Popups}, {Name = "Keybind Mode", Values = {"Toggle", "Hold", "Always"}, Ignore = true, Callback = function(v)
                local ConfigFlag = Library.ConfigFlags[KeybindMode.Flag]

                if ConfigFlag then
                    KeybindModeDropdown.Show(false)

                    ConfigFlag.Set(v)

                    KeybindModeOutline.Visible = false

                    KeybindMode.Flag = ""
                end
            end})

            KeybindMode.Dropdown = KeybindModeDropdown

            Selectables.KeybindMode = KeybindMode
        --
        
        -- Colorpicker
            local Colorpicker = {
                Transparency = 0,
                Color = Color3fromRGB(255, 255, 255),
                HuePosition = 0,
                SlidingSaturation = false,
                SlidingHue = false,
                SlidingAlpha = false,
                Flag = ""
            }

            local ColorpickerWindow = Library:Window({
                Name = "Colorpicker Window",
                Size = Vector2new(230, 281),
                Selects = false,
                Holder = Library.Popups,
                Position = UDim2new(0, position.x - 235, 0, position.y)
            })

            --ColorpickerWindow.OutlineHolder.Visible = false

            Colorpicker.Window = ColorpickerWindow

            -- Picker Tab
                local PickerTab = ColorpickerWindow:Tab({
                    Name = "Picker"
                })
                local Hue, Sat, Val

                local ColorpickerHolder = Library:New("Frame", {
                    Name = "ColorpickerHolder",
                    Parent = PickerTab.Page,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Position = UDim2new(0, 0, 0, 0),
                    Size = UDim2new(1, 0, 1, 0),
                })

                -- Saturation
                    local ColorpickerSaturationOutline = Library:New("Frame", {
                        Name = "ColorpickerSaturationOutline",
                        Parent = ColorpickerHolder,
                        BackgroundColor3 = Color3fromRGB(0, 0, 0),
                        BorderColor3 = Color3fromRGB(0, 0, 0),
                        BorderSizePixel = 0,
                        Size = UDim2new(1, -24, 1, -24),
                    })

                    Library:AddTheme(ColorpickerSaturationOutline, {
                        BackgroundColor3 = "Outline",
                    })
                    
                    local ColorpickerSaturationBackground = Library:New("Frame", {
                        Name = "ColorpickerSaturationBackground",
                        Parent = ColorpickerSaturationOutline,
                        BackgroundColor3 = Color3fromRGB(255, 255, 255),
                        BorderSizePixel = 0,
                        Position = UDim2new(0, 1, 0, 1),
                        Size = UDim2new(1, -2, 1, -2),
                    })
                    
                    Library:New("ImageLabel", {
                        Name = "ColorpickerSaturationImage",
                        Parent = ColorpickerSaturationBackground,
                        BackgroundColor3 = Color3fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Size = UDim2new(1, 0, 1, 0),
                        Image = Library.Images.Saturation,
                    })

                    local ColorpickerSaturationPickerOutline = Library:New("Frame", {
                        Name = "ColorpickerSaturationPickerOutline",
                        Parent = ColorpickerSaturationBackground,
                        BorderSizePixel = 0,
                        Size = UDim2new(0, 4, 0, 4),
                    })
                    
                    Library:AddTheme(ColorpickerSaturationPickerOutline, {
                        BackgroundColor3 = "Outline",
                    })

                    Library:New("Frame", {
                        Name = "ColorpickerSaturationPickerBackground",
                        Parent = ColorpickerSaturationPickerOutline,
                        BackgroundColor3 = Color3fromRGB(255, 255, 255),
                        BorderSizePixel = 0,
                        Position = UDim2new(0, 1, 0, 1),
                        Size = UDim2new(1, -2, 1, -2),
                    })

                    local ColorpickerSaturationButton = Library:New("TextButton", {
                        Parent = ColorpickerSaturationBackground,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 1, 0),
                        Text = "",
                        TextColor3 = Color3.fromRGB(0, 0, 0),
                        TextSize = 1,
                    })
                --

                -- Alpha
                    local ColorpickerAlphaOutline = Library:New("Frame", {
                        Name = "ColorpickerAlphaOutline",
                        Parent = ColorpickerHolder,
                        BorderSizePixel = 0,
                        Position = UDim2new(0, 0, 1, -20),
                        Size = UDim2new(1, -24, 0, 20),
                    })

                    Library:AddTheme(ColorpickerAlphaOutline, {
                        BackgroundColor3 = "Outline",
                    })

                    local ColorpickerAlphaImage = Library:New("ImageLabel", {
                        Name = "ColorpickerAlphaImage",
                        Parent = ColorpickerAlphaOutline,
                        BackgroundColor3 = Color3fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Position = UDim2new(0, 1, 0, 1),
                        Size = UDim2new(1, -2, 1, -2),
                        Image = Library.Images.Checkers,
                        ScaleType = Enum.ScaleType.Tile,
                        TileSize = UDim2new(0, 6, 0, 6),
                    })

                    local ColorpickerAlphaBackground = Library:New("Frame", {
                        Name = "ColorpickerAlphaBackground",
                        Parent = ColorpickerAlphaImage,
                        BackgroundTransparency = 0,
                        BackgroundColor3 = Color3fromRGB(255, 255, 255),
                        BorderSizePixel = 0,
                        Position = UDim2new(0, 0, 0, 0),
                        Size = UDim2new(1, 0, 1, 0),
                    })

                    local ColorpickerAlphaGradient = Library:New("UIGradient", {
                        Parent = ColorpickerAlphaBackground,
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 1),
                            NumberSequenceKeypoint.new(1, 0),
                        })
                    })
                    
                    local ColorpickerAlphaPickerOutline = Library:New("Frame", {
                        Name = "ColorpickerAlphaPickerOutline",
                        Parent = ColorpickerAlphaBackground,
                        BorderSizePixel = 0,
                        Size = UDim2new(0, 3, 1, 0),
                    })

                    Library:AddTheme(ColorpickerAlphaPickerOutline, {
                        BackgroundColor3 = "Outline",
                    })
                    
                    Library:New("Frame", {
                        Name = "ColorpickerAlphaPickerBackground",
                        Parent = ColorpickerAlphaPickerOutline,
                        BackgroundColor3 = Color3fromRGB(255, 255, 255),
                        BorderSizePixel = 0,
                        Position = UDim2new(0, 1, 0, 0),
                        Size = UDim2new(1, -2, 1, 0),
                    })

                    local ColorpickerAlphaButton = Library:New("TextButton", {
                        Parent = ColorpickerAlphaBackground,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 1, 0),
                        Text = "",
                        TextColor3 = Color3.fromRGB(0, 0, 0),
                        TextSize = 1,
                    })
                --

                -- Hue
                    local ColorpickerHueOutline = Library:New("Frame", {
                        Name = "ColorpickerHueOutline",
                        Parent = ColorpickerHolder,
                        BorderSizePixel = 0,
                        Position = UDim2new(1, -20, 0, 0),
                        Size = UDim2new(0, 20, 1, -24),
                    })

                    Library:AddTheme(ColorpickerHueOutline, {
                        BackgroundColor3 = "Outline",
                    })
                    
                    local ColorpickerHueBackground = Library:New("Frame", {
                        Name = "ColorpickerHueBackground",
                        Parent = ColorpickerHueOutline,
                        BackgroundColor3 = Color3fromRGB(255, 255, 255),
                        BorderSizePixel = 0,
                        Position = UDim2new(0, 1, 0, 1),
                        Size = UDim2new(1, -2, 1, -2),
                    })
                    
                    Library:New("UIGradient", {
                        Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.17, Color3fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.33, Color3fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.50, Color3fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.67, Color3fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(0.83, Color3fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1.00, Color3fromRGB(255, 0, 0))},
                        Rotation = 90,
                        Parent = ColorpickerHueBackground,
                    })
                    
                    local ColorpickerHuePickerOutline = Library:New("Frame", {
                        Name = "ColorpickerHuePickerOutline",
                        Parent = ColorpickerHueBackground,
                        BorderSizePixel = 0,
                        Size = UDim2new(1, 0, 0, 3),
                    })

                    Library:AddTheme(ColorpickerHuePickerOutline, {
                        BackgroundColor3 = "Outline",
                    })
                    
                    Library:New("Frame", {
                        Name = "ColorpickerHuePickerBackground",
                        Parent = ColorpickerHuePickerOutline,
                        BackgroundColor3 = Color3fromRGB(255, 255, 255),
                        BorderSizePixel = 0,
                        Position = UDim2new(0, 0, 0, 1),
                        Size = UDim2new(1, 0, 1, -2),
                    })

                    local ColorpickerHueButton = Library:New("TextButton", {
                        Parent = ColorpickerHueBackground,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 1, 0),
                        Text = "",
                        TextColor3 = Color3.fromRGB(0, 0, 0),
                        TextSize = 1,
                    })
                --

                -- Color Value
                    local ColorpickerOutline = Library:New("Frame", {
                        Name = "ColorpickerOutline",
                        Parent = ColorpickerHolder,
                        BorderSizePixel = 0,
                        Position = UDim2new(1, -20, 1, -20),
                        Size = UDim2new(0, 20, 0, 20),
                    })
            
                    Library:AddTheme(ColorpickerOutline, {
                        BackgroundColor3 = "Outline"
                    })
                    
                    local ColorpickerBackground = Library:New("Frame", {
                        Name = "ColorpickerBackground",
                        Parent = ColorpickerOutline,
                        BorderSizePixel = 0,
                        Position = UDim2new(0, 1, 0, 1),
                        Size = UDim2new(1, -2, 1, -2),
                    })
                    
                    Library:New("UIGradient", {
                        Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3fromRGB(149, 149, 149))},
                        Rotation = 90,
                        Parent = ColorpickerBackground,
                    })
                --

                function Colorpicker.Set(color, transparency, ignore)
                    transparency = transparency or Colorpicker.Transparency
                    
                    if type(color) == "table" then
                        transparency = color.a
                        color = color.c
                    end

                    Hue, Sat, Val = color:ToHSV()

                    Colorpicker.Color = color
                    Colorpicker.Transparency = transparency

                    if not ignore then
                        ColorpickerSaturationPickerOutline.Position = UDim2new(
                            mathclamp(Sat, 0, 1),
                            Sat < 1 and -1 or -3,
                            mathclamp(1 - Val, 0, 1),
                            1 - Val < 1 and -1 or -3
                        )               

                        Colorpicker.HuePosition = Hue

                        ColorpickerHuePickerOutline.Position = UDim2new(
                            0,
                            0,
                            mathclamp(1 - Hue, 0, 1),
                            1 - Hue < 1 and -1 or -2
                        )    

                        ColorpickerAlphaPickerOutline.Position = UDim2new(
                            mathclamp(transparency, 0, 1),
                            transparency < 1 and -1 or -2,
                            0,
                            0
                        )     
                    end

                    if Library.ConfigFlags[Colorpicker.Flag] then
                        Library.ConfigFlags[Colorpicker.Flag].Set({
                            c = color,
                            a = transparency
                        })
                    end

                    ColorpickerAlphaBackground.BackgroundColor3 = color
                    ColorpickerSaturationBackground.BackgroundColor3 = Color3fromHSV(Colorpicker.HuePosition, 1, 1)
                    ColorpickerBackground.BackgroundColor3 = color
                end

                function Colorpicker.SlideSaturation(input)
                    local SizeX = mathclamp((input.Position.X - ColorpickerSaturationOutline.AbsolutePosition.X) / ColorpickerSaturationOutline.AbsoluteSize.X, 0, 1)
                    local SizeY = 1 - mathclamp((input.Position.Y - ColorpickerSaturationOutline.AbsolutePosition.Y) / ColorpickerSaturationOutline.AbsoluteSize.Y, 0, 1)
                    
                    ColorpickerSaturationPickerOutline.Position = UDim2new(SizeX, SizeX < 1 and -1 or -3, 1 - SizeY, 1 - SizeY < 1 and -1 or -3)
                    Colorpicker.Set(Color3fromHSV(Colorpicker.HuePosition, SizeX, SizeY), Colorpicker.Transparency, true)
                end

                Utility:Connect(ColorpickerSaturationButton.MouseButton1Down, function()
                    Colorpicker.SlidingSaturation = true
                    Colorpicker.SlideSaturation({ Position = UserInputService:GetMouseLocation() - Vector2new(0, 38) })
                end)
    
                function Colorpicker.SlideHue(input)
                    local SizeY = 1 - mathclamp((input.Position.Y - ColorpickerHueOutline.AbsolutePosition.Y) / ColorpickerHueOutline.AbsoluteSize.Y, 0, 1)
                    
                    ColorpickerHuePickerOutline.Position = UDim2new(0, 0, 1 - SizeY, 1 - SizeY < 1 and -1 or -2)
                    Colorpicker.HuePosition = SizeY
                
                    Colorpicker.Set(Color3fromHSV(SizeY, Sat, Val), Colorpicker.Transparency, true)
                end
    
                Utility:Connect(ColorpickerHueButton.MouseButton1Down, function()
                    Colorpicker.SlidingHue = true
                    Colorpicker.SlideHue({ Position = UserInputService:GetMouseLocation() - Vector2new(0, 38) })
                end)

                function Colorpicker.SlideAlpha(input)
                    local SizeX = mathclamp((input.Position.X - ColorpickerAlphaOutline.AbsolutePosition.X) / ColorpickerAlphaOutline.AbsoluteSize.X, 0, 1)
                    
                    ColorpickerAlphaPickerOutline.Position = UDim2new(SizeX, SizeX < 1 and -1 or -2, 0, 0)
                    Colorpicker.Set(Color3fromHSV(Colorpicker.HuePosition, Sat, Val), SizeX, true)
                end
            
                Utility:Connect(ColorpickerAlphaButton.MouseButton1Down, function()
                    Colorpicker.SlidingAlpha = true
                    Colorpicker.SlideAlpha({ Position = UserInputService:GetMouseLocation() - Vector2new(0, 38) })
                end)
    
                Utility:Connect(UserInputService.InputEnded, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        Colorpicker.SlidingSaturation, Colorpicker.SlidingHue, Colorpicker.SlidingAlpha = false, false, false
                    end
                end)
    
                Utility:Connect(UserInputService.InputChanged, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement then
                        if Colorpicker.SlidingSaturation then
                            Colorpicker.SlideSaturation({ Position = UserInputService:GetMouseLocation() - Vector2new(0, 38) })
                        elseif Colorpicker.SlidingHue then
                            Colorpicker.SlideHue({ Position = UserInputService:GetMouseLocation() - Vector2new(0, 38) })
                        elseif Colorpicker.SlidingAlpha then
                            Colorpicker.SlideAlpha({ Position = UserInputService:GetMouseLocation() - Vector2new(0, 38) })
                        end
                    end
                end)

                Colorpicker.Set(Colorpicker.Color, Colorpicker.Transparency)
            --

            -- Animation Tab
                -- local AnimationsTab = ColorpickerWindow:Tab({
                --     Name = "Animations"
                -- })
            --

            -- Copying
                local CopyingTab = ColorpickerWindow:Tab({
                    Name = "Copying"
                })

                local CopyingHolder = Library:New("Frame", {
                    Name = "CopyingHolder",
                    Parent = CopyingTab.Page,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Position = UDim2new(0, 0, 0, 0),
                    Size = UDim2new(1, 0, 1, 0),
                })

                Library:New("UIListLayout", {
                    Parent = CopyingHolder,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDimnew(0, 4),
                })

                
                local ColorBackground
                local ColorAlphaBackground

                local ColorLine = Library:New("Frame", {
                    Name = "ColorLine",
                    Parent = CopyingHolder,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Position = UDim2new(0, 0, 0, 0),
                    Size = UDim2new(1, 0, 0, 103),
                })

                Library:AddTheme(ColorLine, {
                    BackgroundColor3 = "Outline",
                })

                ColorBackground = Library:New("Frame", {
                    Name = "ColorBackground",
                    Parent = ColorLine,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Position = UDim2new(0, 1, 0, 1),
                    Size = UDim2new(0.5, -2, 1, -2),
                })

                local ColorBackgroundImage = Library:New("ImageLabel", {
                    Name = "ColorBackgroundImage",
                    Parent = ColorLine,
                    BackgroundColor3 = Color3fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Position = UDim2new(0.5, 1, 0, 1),
                    Size = UDim2new(0.5, -2, 1, -2),
                    Image = Library.Images.Checkers,
                    ScaleType = Enum.ScaleType.Tile,
                    TileSize = UDim2new(0, 6, 0, 6),
                })

                ColorAlphaBackground = Library:New("Frame", {
                    Name = "ColorBackground",
                    Parent = ColorBackgroundImage,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Position = UDim2new(0, 0, 0, 0),
                    Size = UDim2new(1, 0, 1, 0),
                })

                local RGBValue
                local HSVValue
                local AlphaValue

                function Colorpicker.UpdateValues()
                    local Color = Library.CopiedColor.c

                    if RGBValue then
                        RGBValue.ChangeText(("RGB: %s, %s, %s"):format(mathfloor(Color.r * 255), mathfloor(Color.g * 255), mathfloor(Color.b * 255)))
                    end

                    Hue, Sat, Val = Color:ToHSV()
                    if HSVValue then
                        HSVValue.ChangeText(("HSV: %s, %s, %s"):format(tostring(Hue):sub(0, 3), tostring(Sat):sub(0, 3), tostring(Val):sub(0, 3)))
                    end

                    if AlphaValue then
                        AlphaValue.ChangeText(("Alpha: %s"):format(tostring(Library.CopiedColor.a):sub(0, 3)))
                    end

                    if ColorBackground then
                        ColorBackground.BackgroundColor3 = Color
                    end

                    if ColorAlphaBackground then
                        ColorAlphaBackground.BackgroundColor3 = Color
                        ColorAlphaBackground.BackgroundTransparency = 1 - Library.CopiedColor.a
                    end
                end

                Library.Button({Holder = CopyingHolder}, {Name = "Copy", Callback = function()
                    Library.CopiedColor = {
                        c = Colorpicker.Color,
                        a = Colorpicker.Transparency
                    }

                    Colorpicker.UpdateValues()
                end})

                Library.Button({Holder = CopyingHolder}, {Name = "Paste", Callback = function()
                    Colorpicker.Set(Library.CopiedColor)
                end})

                RGBValue = Library.Label({Holder = CopyingHolder}, {Name = "RGB: "})
                HSVValue = Library.Label({Holder = CopyingHolder}, {Name = "HSV: "})
                AlphaValue = Library.Label({Holder = CopyingHolder}, {Name = "Alpha: "})

                Colorpicker.UpdateValues()
            --

            PickerTab.Select(true)

            Selectables.Colorpicker = Colorpicker
        --

        return Selectables
    end

    function Library:MakeResizable(Holder, Drag)
        local start, startSize, resizing
        local CurrentSize = Holder.Size
        local OriginalSize = Holder.Size

        Drag.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                resizing = true
                start = input.Position
                startSize = Holder.Size
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement and resizing then
                local viewportWidth = Camera.ViewportSize.X
                local viewportHeight = Camera.ViewportSize.Y
                CurrentSize = UDim2.new(
                    startSize.X.Scale,
                    mathclamp(
                        startSize.X.Offset + (input.Position.X - start.X),
                        OriginalSize.X.Offset,
                        viewportWidth
                    ),
                    startSize.Y.Scale,
                    mathclamp(
                        startSize.Y.Offset + (input.Position.Y - start.Y),
                        OriginalSize.Y.Offset,
                        viewportHeight
                    )
                )
                Holder.Size = CurrentSize
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 and resizing then
                resizing = false
            end
        end)
    end

    function Library:New(type, props, ignore)
        ignore = ignore or false

        local Object = Utility:New(type, props)

        if not ignore then
            Library.Objects[#Library.Objects + 1] = Object
        end

        return Object
    end

    function Library:AddTheme(obj, props)
        local Data = {
            Instance = obj,
            Properties = props,
            Index = #Library.ThemeInstances + 1
        }

        for _,v in Data.Properties do
            if type(v) == "string" then
                Data.Instance[_] = Library.Theme[v]
            else
                Data.Instance[_] = v()
            end
        end

        table.insert(Library.ThemeInstances, Data)
        Library.ThemeMap[obj] = Data
    end

    function Library:Tween(obj, info, props)
        info = not info and TweenInfo.new(Library.TweenSpeed, Library.TweenEasingStyle) or info

        local Tween = TweenService:Create(obj, info, props)

        Tween:Play()

        return Tween
    end

    function Library:ChangeObjectTheme(obj, props, tween)
        if Library.ThemeMap[obj] then
            local Data = Library.ThemeMap[obj]
            Data.Properties = props
            
            for i,v in props do
                if type(v) == "string" then
                    if tween then
                        Data.Tween = Library:Tween(Data.Instance, nil, {
                            [i] = Library.Theme[v],
                        })
                    else
                        Data.Instance[i] = Library.Theme[v]
                    end
                else
                    Data.Instance[i] = v()
                end
            end

            Library.ThemeMap[obj] = Data
        end
    end

    function Library:ChangeTheme(theme, color)
        Library.Theme[theme] = color

        for obj,v in Library.ThemeMap do
            local Properties = v.Properties

            for propName, propTheme in Properties do
                if propTheme == theme then
                    if v.Tween then
                        v.Tween:Cancel()
                    end

                    obj[propName] = color
                end
            end
        end
    end

    function Library:Notify(cfg)
        cfg = {
            Time = cfg.Time or 5,
            Text = cfg.Text or "this is a test notification.",
            Prefix = cfg.Prefix or "[Puppyware] ",
            Type = cfg.Type or "Normal",
            Animation = cfg.Animation or "None"
        }
    
        local Notification = {
            Text = cfg.Text,
            Time = cfg.Time,
            ClockTime = osclock() + cfg.Time,
            Prefix = cfg.Prefix,
            Type = cfg.Type,
            Animation = cfg.Animation,
            Direction = 1,
            Lerps = {
                Offset = 1,
                Main = 1,
                Once = 1,
                OffsetOnce = 1,          
                SizeX = 1,
                SizeY = 1,
            }
        }
    
        local NotificationBackground = Library:New("Frame", {
            Parent = Library.ListsGui,
            BackgroundTransparency = 1,
            Size = UDim2new(0, 0, 0, 0),
            ClipsDescendants = true,
        }, true)
    
        Library:AddTheme(NotificationBackground, {
            BorderColor3 = "Outline",
            BackgroundColor3 = "Element Background",
        })

        Library:New("UIGradient", {
            Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3fromRGB(124, 124, 124))},
            Rotation = 90,
            Parent = NotificationBackground,
        })
    
        Notification.Background = NotificationBackground
    
        local NotificationText = Library:New("TextLabel", {
            BackgroundTransparency = 1,
            TextTransparency = 1,
            AutomaticSize = Enum.AutomaticSize.XY,
            Size = UDim2new(0, 0, 0, 0),
            Position = UDim2new(0, 5, 0, 2),
            FontFace = Library.Font,
            Text = cfg.Prefix .. cfg.Text,
            TextSize = Library.FontSize,
            Parent = NotificationBackground,
            TextStrokeTransparency = 0,
            RichText = true,
            TextXAlignment = Enum.TextXAlignment.Left,
        }, true)
    
        Library:AddTheme(NotificationText, {
            TextColor3 = "Text",
        })
    
        Notification.Lerps.SizeY = NotificationText.TextBounds.Y + 5
        Notification.Lerps.SizeX = NotificationText.TextBounds.X + 8
    
        Notification.TextObj = NotificationText
    
        local NotificationAccent = Library:New("Frame", {
            Name = "NotificationAccent",
            Parent = NotificationBackground,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2new(0, 0, 0, 0),
            Size = UDim2new(0, 1, 1, 0),
        }, true)
    
        Notification.Accent = NotificationAccent
    
        local NotificationLine = Library:New("Frame", {
            Name = "NotificationLine",
            Parent = NotificationBackground,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2new(0, 0, 1, -1),
            Size = UDim2new(0, 0, 0, 1),
        }, true)

        Notification.Line = NotificationLine
    
        Library.Notifications[#Library.Notifications + 1] = Notification
    
        return Notification
    end

    local NotificationPosition = Vector2new(10, 32)

    local function Sine(delta)
        return mathsin(halfpi * delta - halfpi) + 1
    end
        
    Utility:Connect(RunService.Heartbeat, function(step)
        Library.Fps = mathfloor(1 / step)
    
        local YOffset = 0
    
        local AccentColor = Library.Theme.Accent
        local ClockPulse = osclock()
    
        for _,v in Library.Notifications do
            if not v.ClockTime then
                continue
            end
    
            -- Random Variables
            local Time = v.Time
            local ClockTime = v.ClockTime
    
            -- Lerps
            local Lerps = v.Lerps
    
            if ClockPulse >= ClockTime then
                Lerps.Main = Utility:Lerp(Lerps.Main, 0, Library.LerpSpeed)
            else
                Lerps.Main = Utility:Lerp(Lerps.Main, 255, Library.LerpSpeed)
                Lerps.Once = Utility:Lerp(Lerps.Once, 255, Library.LerpSpeed)
                Lerps.OffsetOnce = Utility:Lerp(Lerps.OffsetOnce, 255, Library.LerpSpeed)
            end
    
            local MainLerp = Lerps.Main
            local MainLerpSine = MainLerp / 255
            local OnceLerpSine = Lerps.Once / 255
    
            -- Objects
            local Background = v.Background
            local Text = v.TextObj
            local Accent = v.Accent
            local Line = v.Line
    
            local WarningColor = Color3new(0, mathabs(mathsin(ClockPulse * 3)), 0)
    
            local PrefixColor = v.Type == "Warning" and WarningColor or AccentColor
            local Prefix = v.Prefix
    
            Text.Text = (Prefix ~= "" and ('<font color="rgb(%s, %s, %s)">%s</font>'):format(
                mathfloor(PrefixColor.r * 255), 
                mathfloor(PrefixColor.g * 255), 
                mathfloor(PrefixColor.b * 255), 
                v.Prefix
            ) or "") .. v.Text
    
            local TextBounds = Text.TextBounds
    
            Lerps.SizeX = Utility:Lerp(Lerps.SizeX, TextBounds.X + 8, Library.LerpSpeed)
            Lerps.SizeY = Utility:Lerp(Lerps.SizeY, TextBounds.Y + 5, Library.LerpSpeed)
    
            local SizeX = Lerps.SizeX
            local SizeY = Lerps.SizeY
    
            Background.Size = UDim2new(0, SizeX, 0, SizeY)
            Background.Position = UDim2new(0, NotificationPosition.x, 0, NotificationPosition.y + YOffset) - UDim2new(0, 45 * (1 - OnceLerpSine))
    
            local Animation = v.Animation
    
            if Animation == "Bounce" then
                local ClockPulseSine = ClockPulse / 2
            
                local SineValue = 0
        
                if ClockPulseSine <= 0.5 then
                    SineValue = 0.5 * Sine(2 * ClockPulseSine)
                else
                    SineValue = 0.5 * (1 - Sine(-2 * ClockPulseSine + 2)) + 0.5
                end

                local LineSize = (SizeX / 3) * mathmax(0, 1 - mathabs(SineValue - 0.5) * 2)
    
                Line.Size = UDim2new(0, LineSize, 0, 1)
    
                Line.Position = UDim2new(SineValue, 0, 1, -1)
            elseif Animation == "Time" then
                Line.Size = UDim2new(1 - ((ClockTime - ClockPulse) / Time), 0, 0, 1)
            end
    
            if v.Type == "Warning" then
                Accent.BackgroundColor3 = WarningColor
    
                if Line then
                    Line.BackgroundColor3 = WarningColor
                end
            else
                Accent.BackgroundColor3 = AccentColor
    
                if Line then
                    Line.BackgroundColor3 = AccentColor
                end
            end
    
            Background.BackgroundTransparency = 1 - MainLerpSine
            Text.TextTransparency = 1 - MainLerpSine
            Accent.BackgroundTransparency = 1 - MainLerpSine
    
            if Line then
                Line.BackgroundTransparency = 1 - MainLerpSine
            end
    
            Lerps.Offset = Utility:Lerp(Lerps.Offset, (SizeY + 5) * (Lerps.OffsetOnce / 255), Library.LerpSpeed)
    
            YOffset += Lerps.Offset
    
            if MainLerp <= 80 then
                Lerps.OffsetOnce = Utility:Lerp(Lerps.OffsetOnce, 0, Library.LerpSpeed)
            end

            if Lerps.OffsetOnce <= 0 then
                Background:Destroy()
    
                --tableremove(Library.Notifications, _)
    
                Library.Notifications[_] = {}
    
                continue
            end
        end
    end, "Main UI Loop")

    local LoadingNotification = Library:Notify({
        Text = "Loading cheat, might take a bit...",
        Time = 9e9,
        Animation = "Bounce"
    })

    function Library:Window(cfg)
        cfg = {
            Name = cfg.Name or "New Window",
            Size = cfg.Size or Vector2new(498, 398),
            Selects = cfg.Selects == nil and true or cfg.Selects,
            Holder = cfg.Holder or Library.ScreenGui,
            Position = cfg.Position or nil,
            Watermark = cfg.Watermark == nil and false or cfg.Watermark,
            Keybinds = cfg.Keybinds == nil and false or cfg.Keybinds,
            Fading = cfg.Fading == nil and true or cfg.Fading,
            Tabs = cfg.Tabs == nil and true or cfg.Tabs,
            Resizing = cfg.Resizing == nil and true or cfg.Resizing,
        }

        local Watermark
        if cfg.Watermark then
            Watermark = Library:Watermark({
                Visible = true
            })
        end

        local WindowOutline = Library:New("Frame", {
            Name = "WindowOutline",
            Parent = cfg.Holder,
            BorderSizePixel = 0,
            Position = cfg.Position or UDim2new(0.5, -(cfg.Size.x / 2), 0.5, -(cfg.Size.y / 2)),
            Size = UDim2new(0, cfg.Size.x, 0, cfg.Size.y),
        })

        if cfg.Selects then
            Library.Selectables = Library:CreateSelects(WindowOutline.AbsolutePosition)
        end

        WindowOutline.Active = true
        WindowOutline.Draggable = true

        Library:AddTheme(WindowOutline, {
            BackgroundColor3 = "Outline",
        })

        local WindowBackground = Library:New("Frame", {
            Name = "WindowBackground",
            Parent = WindowOutline,
            BorderSizePixel = 0,
            Position = UDim2new(0, 1, 0, 1),
            Size = UDim2new(1, -2, 1, -2),
        })

        Library:AddTheme(WindowBackground, {
            BackgroundColor3 = "Background",
        })

        if cfg.Resizing then
            local ResizeBox = Library:New("TextButton", {
                Name = "ResizeBox",
                Parent = WindowBackground,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Text = "",
                Position = UDim2new(1, -10, 1, -10),
                Size = UDim2new(0, 10, 0, 10),
            })

            Library:MakeResizable(WindowOutline, ResizeBox)
        end

        local TitleBackground = Library:New("Frame", {
            Name = "TitleBackground",
            Parent = WindowBackground,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 0, 24),
        })

        Library:AddTheme(TitleBackground, {
            BackgroundColor3 = "Accent",
        })
        
        Library:New("UIPadding", {
            Parent = TitleBackground,
            PaddingBottom = UDimnew(0, 5),
            PaddingLeft = UDimnew(0, 5),
            PaddingRight = UDimnew(0, 5),
            PaddingTop = UDimnew(0, 5),
        })

        Library:New("UIGradient", {
            Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3fromRGB(149, 149, 149))},
            Rotation = 90,
            Parent = TitleBackground,
        })

        local TitleLabel = Library:New("TextLabel", {
            Name = "TitleLabel",
            Parent = TitleBackground,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 1, 0),
            FontFace = Library.Font,
            Text = cfg.Name,
            TextSize = Library.FontSize,
            TextStrokeTransparency = 0,
            TextXAlignment = Enum.TextXAlignment.Left,
        })

        Library:AddTheme(TitleLabel, {
            TextColor3 = "Text",
        })

        local TabHolderBackground 
        if cfg.Tabs then
            local TabHolderOutline = Library:New("Frame", {
                Name = "TabHolderOutline",
                Parent = WindowBackground,
                BorderSizePixel = 0,
                Position = UDim2new(0, 0, 0, 24),
                Size = UDim2new(1, 0, 0, 27),
            })
            
            Library:AddTheme(TabHolderOutline, {
                BackgroundColor3 = "Outline",
            })

            TabHolderBackground = Library:New("Frame", {
                Name = "TabHolderBackground",
                Parent = TabHolderOutline,
                BackgroundColor3 = Color3fromRGB(65, 65, 65),
                BorderColor3 = Color3fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2new(0, 0, 0, 1),
                Size = UDim2new(1, 0, 1, -2),
            })

            Library:AddTheme(TabHolderBackground, {
                BackgroundColor3 = "Tab Enabled",
            })
            
            Library:New("UIGradient", {
                Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3fromRGB(111, 111, 111))},
                Rotation = 90,
                Parent = TabHolderBackground,
            })

            Library:New("UITableLayout", {
                Parent = TabHolderBackground,
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillEmptySpaceColumns = true,
                FillEmptySpaceRows = true,
                Padding = UDim2new(0, 1, 0, 0),
            })
        end

        local WindowPageHolder = Library:New("Frame", {
            Visible = false,
            Name = "WindowPageHolder",
            Parent = WindowBackground,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2new(0, 9, 0, 60),
            Size = UDim2new(1, -18, 1, -69),
        })

        local KeybindList
        if cfg.Keybinds then
            KeybindList = Library:InitList({Name = "Keybinds List", Position = UDim2new(0, 10, 0.5, 0)})

            KeybindList.GetItems = function()
                return Library.Keybinds
            end
        end 

        if cfg.Keybinds or cfg.Watermark then
            Utility:Connect(RunService.Heartbeat, function(step)            
                if Watermark then
                    Watermark.Think()
                end
            
                if KeybindList then
                    KeybindList.Think()
                end
            end, "UI Window Loop")
        end
    
        local Items = {}

        return setmetatable({
            OutlineHolder = WindowOutline,
            Holder = WindowBackground,
            TabHolder = TabHolderBackground,
            Items = Items,
            Title = TitleLabel,
            Watermark = Watermark,
            KeybindList = KeybindList,
            SelectedTab = nil,
            OldTab = nil,
            Fading = cfg.Fading,
            PageHolder = WindowPageHolder,
        }, Library)
    end

    function Library:Tab(cfg)
        local Parent = self

        cfg = {
            Name = cfg.Name or "New Tab"
        }

        local TabHolder = Parent.TabHolder
        local Holder = Parent.Holder
        local Items = Parent.Items

        local TabOutline = Library:New("Frame", {
            Name = "TabOutline",
            Parent = TabHolder,
            Size = UDim2new(1, 0, 1, 0),
        })

        Library:AddTheme(TabOutline, {
            BorderColor3 = "Outline",
            BackgroundColor3 = "Tab Disabled"
        })
        
        Library:New("UIGradient", {
            Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3fromRGB(124, 124, 124))},
            Rotation = 90,
            Parent = TabOutline,
        })

        local TabLabel = Library:New("TextLabel", {
            Name = "TabLabel",
            Parent = TabOutline,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 1, 0),
            Text = cfg.Name,
            FontFace = Library.Font,
            TextSize = Library.FontSize,
            TextStrokeTransparency = 0,
        })

        Library:AddTheme(TabLabel, {
            TextColor3 = "Text",
        })

        local PageHolder = Library:New("Frame", {
            Visible = false,
            Name = "PageHolder",
            Parent = Holder,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2new(0, 9, 0, 60),
            Size = UDim2new(1, -18, 1, -69),
        })

        local LeftSide = Library:New("Frame", {
            Name = "LeftSide",
            Parent = PageHolder,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2new(0.5, -5, 1, 0),
        })
        
        Library:New("UIListLayout", {
            Parent = LeftSide,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDimnew(0, 10),
        })
        
        local RightSide = Library:New("Frame", {
            Name = "RightSide",
            Parent = PageHolder,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2new(0.5, 5, 0, 0),
            Size = UDim2new(0.5, -5, 1, 0),
        })
        
        Library:New("UIListLayout", {
            Parent = RightSide,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDimnew(0, 10),
        })

        local MiddleSide = Library:New("Frame", {
            Name = "MiddleSide",
            Parent = PageHolder,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2new(0, 0, 0, 0),
            Size = UDim2new(1, 0, 1, 0),
        })
        
        Library:New("UIListLayout", {
            Parent = RightSide,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDimnew(0, 10),
        })

        local PageFade = Library:New("Frame", {
            Name = "PageFade",
            Parent = Holder,
            BackgroundTransparency = 1,
            Visible = false,
            BorderSizePixel = 0,
            Position = UDim2new(0, 0, 0, 55),
            Size = UDim2new(1, 0, 1, -64),
        })

        Library:AddTheme(PageFade, {
            BackgroundColor3 = "Background",
        })

        local Tab = {
            Name = cfg.Name,
            Selected = false,
            TabOutline = TabOutline,
            Page = PageHolder,
            Left = LeftSide,
            Right = RightSide,
            Middle = MiddleSide,
            PageFade = PageFade,
            CurrentTween = nil
        }

        tableinsert(Items, Tab)

        function Tab.Select(status, looped, oldpage)
            Tab.Selected = status

            Library:Tween(TabOutline, nil, {
                Transparency = status and 1 or 0
            })

            if not looped then
                for _,v in Items do
                    if v == Tab then
                        continue
                    end

                    if Parent.SelectedTab == v then
                        Parent.OldTab = v
                        v.Select(false, true, Parent.SelectedTab)
                    else
                        v.Select(false, true)
                    end
                end

                Parent.SelectedTab = Tab
            end

            if Parent.Fading then
                if not looped then
                    taskspawn(function()
                        local OldTab = Parent.OldTab

                        if OldTab then
                            OldTab.PageFade.Visible = true

                            Tab.CurrentTween = Library:Tween(OldTab.PageFade, nil, {
                                BackgroundTransparency = 0
                            })
        
                            taskwait(Library.TweenSpeed)
            
                            OldTab.Page.Visible = false

                            OldTab.PageFade.Visible  = false

                            PageFade.Visible = true

                            PageFade.BackgroundTransparency = 0

                            PageHolder.Visible = true

                            Tab.CurrentTween = Library:Tween(PageFade, nil, {
                                BackgroundTransparency = 1
                            })
        
                            taskwait(Library.TweenSpeed)
        
                            PageFade.Visible = false
                        else
                            PageFade.Visible = true

                            PageFade.BackgroundTransparency = 0
            
                            PageHolder.Visible = true

                            Tab.CurrentTween = Library:Tween(PageFade, nil, {
                                BackgroundTransparency = 1
                            })

                            taskwait(Library.TweenSpeed)

                            PageFade.Visible = false
                        end                
                    end)
                elseif not oldpage then
                    PageHolder.Visible = false
                end
            else
                PageHolder.Visible = status
            end
        end

        Utility:Connect(TabOutline.InputBegan, function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                Tab.Select(true, false)
            end
        end)

        if #Items == 1 then
            Tab.Select(true)
        end

        return setmetatable(Tab, Library)
    end

    function Library:Section(cfg)
        local Parent = self

        cfg = {
            Size = cfg.Size or UDim2new(1, 0, 1, 0),
            Name = cfg.Name or "New Section",
            Side = cfg.Side or "Left",
            Visible = cfg.Visible == nil and true or cfg.Visible,
        }

        local Section = {}

        local Left = Parent.Left
        local Right = Parent.Right
        local Middle = Parent.Middle

        local Side = cfg.Side == "Left" and Left or cfg.Side == "Middle" and Middle or Right

        local FMiddleSide, SMiddleSide
        if cfg.Side == "Middle" then
            FMiddleSide = Library:New("Frame", {
                Name = "FMiddleSide",
                Parent = Left,
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Size = cfg.Size,
                Visible = cfg.Visible,
            })

            SMiddleSide = Library:New("Frame", {
                Name = "SMiddleSide",
                Parent = Right,
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Size = cfg.Size,
                Visible = cfg.Visible,
            })
        end

        local SectionOutline = Library:New("Frame", {
            Name = "SectionOutline",
            Parent = Side,
            BorderSizePixel = 0,
            Size = cfg.Size,
            Visible = cfg.Visible,
        })
        
        Library:AddTheme(SectionOutline, {
            BackgroundColor3 = "Outline"
        })

        local SectionAccent = Library:New("Frame", {
            Name = "SectionAccent",
            Parent = SectionOutline,
            BorderSizePixel = 0,
            Position = UDim2new(0, 1, 0, 1),
            Size = UDim2new(1, -2, 1, -2),
        })

        Library:AddTheme(SectionAccent, {
            BackgroundColor3 = "Accent"
        })
        
        local SectionInline = Library:New("Frame", {
            Name = "SectionInline",
            Parent = SectionAccent,
            BorderSizePixel = 0,
            Position = UDim2new(0, 1, 0, 1),
            Size = UDim2new(1, -2, 1, -2),
        })

        Library:AddTheme(SectionInline, {
            BackgroundColor3 = "Outline"
        })
        
        local SectionBackground = Library:New("Frame", {
            Name = "SectionBackground",
            Parent = SectionInline,
            BackgroundColor3 = Color3fromRGB(37, 37, 37),
            BorderColor3 = Color3fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Position = UDim2new(0, 1, 0, 1),
            Size = UDim2new(1, -2, 1, -2),
        })

        Library:AddTheme(SectionBackground, {
            BackgroundColor3 = "Background"
        })

        local SectionLabel = Library:New("TextLabel", {
            Name = "SectionLabel",
            Parent = SectionBackground,
            BorderSizePixel = 0,
            Position = UDim2new(0, 5, 0, -8),
            AutomaticSize = Enum.AutomaticSize.X,
            Size = UDim2new(0, 0, 0, 12),
            FontFace = Library.Font,
            Text = cfg.Name,
            TextSize = Library.FontSize,
            TextStrokeTransparency = 0,
            TextXAlignment = Enum.TextXAlignment.Left,
        })

        Library:AddTheme(SectionLabel, {
            BackgroundColor3 = "Background",
            TextColor3 = "Text"
        })

        local SectionScrollingHolder = Library:New("ScrollingFrame", {
            Name = "SectionScrollingHolder",
            Parent = SectionBackground,
            Active = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            Position = UDim2new(0, 5, 0, 10),
            Size = UDim2new(1, -10, 1, -15),
            BottomImage = Library.Images.Scroll,
            CanvasSize = UDim2new(0, 0, 0, 0),
            MidImage = Library.Images.Scroll,
            ScrollBarThickness = 3,
            TopImage = Library.Images.Scroll,
        })

        Library:AddTheme(SectionScrollingHolder, {
            ScrollBarImageColor3 = "Accent",
        })

        local SectionHolder = Library:New("TextButton", {
            Name = "SectionHolder",
            Parent = SectionScrollingHolder,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2new(1, 0, 0, 0),
            Text = "",
            TextSize = 0,
        })

        Library:New("UIListLayout", {
            Parent = SectionHolder,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDimnew(0, 4),
        })

        Utility:Connect(SectionScrollingHolder:GetPropertyChangedSignal("AbsoluteSize"), function()
            if SectionScrollingHolder.AbsoluteCanvasSize.Y > SectionScrollingHolder.AbsoluteSize.Y then
                SectionHolder.Size = UDim2new(1, -8, 0, 0)
            else
                SectionHolder.Size = UDim2new(1, 0, 0, 0)
            end
        end)
        
        Utility:Connect(SectionScrollingHolder:GetPropertyChangedSignal("AbsoluteCanvasSize"), function()
            if SectionScrollingHolder.AbsoluteCanvasSize.Y > SectionScrollingHolder.AbsoluteSize.Y then
                SectionHolder.Size = UDim2new(1, -8, 0, 0)
            else
                SectionHolder.Size = UDim2new(1, 0, 0, 0)
            end
        end)

        Section.Holder = SectionHolder

        function Section.SetVisibility(status)
            SectionOutline.Visible = status

            if FMiddleSide then
                FMiddleSide.Visible = status
            end

            if SMiddleSide then
                SMiddleSide.Visible = status
            end
        end

        return setmetatable(Section, Library)
    end

    function Library:Toggle(cfg)
        local Parent = self

        cfg = {
            Name = cfg.Name or "New Toggle",
            Status = cfg.Status == nil and false or cfg.Status,
            Visible = cfg.Visible == nil and true or cfg.Visible,
            Flag = cfg.Flag or math.random(5^12),
            Callback = cfg.Callback or function() end
        }

        local Holder = Parent.Holder
        local ChildHolder = Parent.ChildHolder

        local Toggle = {
            Status = false,
        }

        local ToggleHolder = Library:New("Frame", {
            Name = "ToggleHolder",
            Parent = ChildHolder or Holder,
            Visible = cfg.Visible,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 0, 13),
            AutomaticSize = Enum.AutomaticSize.Y,
        })

        --if not ChildHolder then
            Library:New("UIListLayout", {
                Parent = ToggleHolder,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDimnew(0, 3),
            })
        --end

        local ToggleLine = Library:New("Frame", {
            Name = "ToggleLine",
            Parent = ToggleHolder,
            Visible = not ChildHolder and cfg.Visible or true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 0, 13),
        })
        
        local ToggleLabel = Library:New("TextLabel", {
            Name = "ToggleLabel",
            Parent = ToggleLine,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2new(0, 18, 0, 0),
            Size = UDim2new(1, -18, 1, 0),
            FontFace = Library.Font,
            Text = cfg.Name,
            TextSize = Library.FontSize,
            TextStrokeTransparency = 0,
            TextXAlignment = Enum.TextXAlignment.Left,
        })

        Library:AddTheme(ToggleLabel, {
            TextColor3 = "Text"
        })

        Library:New("UIListLayout", {
            Parent = ToggleLabel,
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDimnew(0, 3),
        })

        local ToggleOutline = Library:New("Frame", {
            Name = "ToggleOutline",
            Parent = ToggleLine,
            BorderSizePixel = 0,
            Size = UDim2new(0, 13, 0, 13),
        })

        Library:AddTheme(ToggleOutline, {
            BackgroundColor3 = "Outline"
        })

        local ToggleBackground = Library:New("Frame", {
            Name = "ToggleBackground",
            Parent = ToggleOutline,
            BorderSizePixel = 0,
            Position = UDim2new(0, 1, 0, 1),
            Size = UDim2new(1, -2, 1, -2),
        })

        Library:AddTheme(ToggleBackground, {
            BackgroundColor3 = "Element Background"
        })

        Library:New("UIGradient", {
            Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3fromRGB(124, 124, 124))},
            Rotation = 90,
            Parent = ToggleBackground,
        })

        function Toggle.Set(status)
            Toggle.Status = status

            Library:ChangeObjectTheme(ToggleBackground, {
                BackgroundColor3 = status and "Accent" or "Element Background"
            }, true)

            Library.Flags[cfg.Flag] = status

            cfg.Callback(status)
        end

        function Toggle.SetVisibility(status)
            ToggleHolder.Visible = status
        end

        Utility:Connect(ToggleLine.InputBegan, function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                Toggle.Set(not Toggle.Status)
            end
        end)

        Toggle.Set(cfg.Status)

        Library.ConfigFlags[cfg.Flag] = Toggle

        Toggle.ChildHolder = ToggleHolder
        Toggle.TextLabel = ToggleLabel

        return setmetatable(Toggle, Library)
    end

    function Library:Slider(cfg)
        local Parent = self

        cfg = {
            Name = cfg.Name or "New Slider",
            Value = cfg.Value or 0,
            Min = cfg.Min or -50,
            Max = cfg.Max or 50,
            Float = cfg.Float or 0.1,
            Suffix = cfg.Suffix or "",
            Flag = cfg.Flag or math.random(5^12),
            Visible = cfg.Visible == nil and true or cfg.Visible,
            Callback = cfg.Callback or function() end
        }

        local Holder = Parent.Holder
        local ChildHolder = Parent.ChildHolder

        local Slider = {
            Value = 0,
            Sliding = false
        }

        local SliderHolder = Library:New("Frame", {
            Name = "SliderHolder",
            Parent = ChildHolder or Holder,
            BackgroundTransparency = 1,
            Visible = cfg.Visible,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
        })

        Library:New("UIListLayout", {
            Parent = SliderHolder,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDimnew(0, 3),
        })

        if not ChildHolder then
            Library:New("UIListLayout", {
                Parent = SliderHolder,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDimnew(0, 3),
            })
        end

        local SliderLine = Library:New("Frame", {
            Name = "SliderLine",
            Parent = SliderHolder,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
        })

        local SliderLabel = Library:New("TextLabel", {
            Name = "SliderLabel",
            Parent = SliderLine,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 0, 13),
            FontFace = Library.Font,
            Text = cfg.Name,
            TextSize = Library.FontSize,
            TextStrokeTransparency = 0,
            TextXAlignment = Enum.TextXAlignment.Left,
        })

        Library:New("UIListLayout", {
            Parent = SliderLabel,
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDimnew(0, 3),
        })

        Library:AddTheme(SliderLabel, {
            TextColor3 = "Text"
        })

        local SliderOutline = Library:New("Frame", {
            Name = "SliderOutline",
            Parent = SliderLine,
            BorderSizePixel = 0,
            Position = UDim2new(0, 0, 0, 15),
            Size = UDim2new(1, 0, 0, 15),
        })

        Library:AddTheme(SliderOutline, {
            BackgroundColor3 = "Outline"
        })

        local SliderBackground = Library:New("Frame", {
            Name = "SliderBackground",
            Parent = SliderOutline,
            BorderSizePixel = 0,
            Position = UDim2new(0, 1, 0, 1),
            Size = UDim2new(1, -2, 1, -2),
        })

        Library:AddTheme(SliderBackground, {
            BackgroundColor3 = "Element Background"
        })
        
        Library:New("UIGradient", {
            Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3fromRGB(124, 124, 124))},
            Rotation = 90,
            Parent = SliderBackground,
        })

        local SliderAccent = Library:New("Frame", {
            Name = "SliderAccent",
            Parent = SliderBackground,
            BorderSizePixel = 0,
            Size = UDim2new(0, 0, 1, 0),
        })

        Library:AddTheme(SliderAccent, {
            BackgroundColor3 = "Accent"
        })
        
        Library:New("UIGradient", {
            Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3fromRGB(124, 124, 124))},
            Rotation = 90,
            Parent = SliderAccent,
        })

        local SliderValue = Library:New("TextLabel", {
            Name = "SliderValue",
            Parent = SliderOutline,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 1, 0),
            FontFace = Library.Font,
            TextSize = Library.FontSize,
            TextStrokeTransparency = 0,
        })

        Library:AddTheme(SliderValue, {
            TextColor3 = "Text"
        })

        function Slider.Set(value)
            Slider.Value = mathclamp(Utility:Round(value, cfg.Float), cfg.Min, cfg.Max)

            SliderValue.Text = stringformat("%s%s", tostring(Slider.Value), cfg.Suffix)

            Library:Tween(SliderAccent, nil, {
                Size = UDim2new((Slider.Value - cfg.Min) / (cfg.Max - cfg.Min), 0, 1, 0)
            })

            Library.Flags[cfg.Flag] = Slider.Value

            cfg.Callback(Slider.Value)
        end

        function Slider.SetVisibility(status)
            SliderHolder.Visible = status
        end

        Utility:Connect(SliderLine.InputBegan, function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                Slider.Sliding = true
                local sizeX = (input.Position.X - SliderLine.AbsolutePosition.X) / SliderLine.AbsoluteSize.X
                local value = ((cfg.Max - cfg.Min) * sizeX) + cfg.Min
                Slider.Set(value)
            end
        end)

        Utility:Connect(SliderLine.InputEnded, function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                Slider.Sliding = false
            end
        end)

        Utility:Connect(UserInputService.InputChanged, function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                if Slider.Sliding then
                    local sizeX = (input.Position.X - SliderLine.AbsolutePosition.X)
                        / SliderLine.AbsoluteSize.X
                    local value = ((cfg.Max - cfg.Min) * sizeX) + cfg.Min
                    Slider.Set(value)
                end
            end
        end)

        Slider.Set(cfg.Value)

        Library.ConfigFlags[cfg.Flag] = Slider

        Slider.ChildHolder = SliderHolder
        Slider.TextLabel = SliderLabel

        return setmetatable(Slider, Library)
    end

    function Library:Button(cfg)
        local Parent = self

        cfg = {
            Name = cfg.Name or "New Button",
            Confirm = cfg.Confirm or false,
            Callback = cfg.Callback or function() end,
            Visible = cfg.Visible == nil and true or cfg.Visible,
        }

        local Button = {
            Clicked = false,
            ConfirmCountdown = 0,
            ConfirmationWrap = nil
        }

        local Holder = Parent.Holder
        local ChildHolder = Parent.ChildHolder

        local ButtonHolder = Library:New("Frame", {
            Name = "ButtonHolder",
            Parent = ChildHolder or Holder,
            BorderSizePixel = 0,
            Visible = cfg.Visible,
            Size = UDim2new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
        })

        Library:New("UIListLayout", {
            Parent = ButtonHolder,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDimnew(0, 3),
        })
        
        local ButtonLine = Library:New("Frame", {
            Name = "ButtonLine",
            Parent = ButtonHolder,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 0, 20),
        })
        
        local ButtonOutline = Library:New("Frame", {
            Name = "ButtonOutline",
            Parent = ButtonLine,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 1, 0),
        })

        Library:AddTheme(ButtonOutline, {
            BackgroundColor3 = "Outline"
        })

        local ButtonBackground = Library:New("Frame", {
            Name = "ButtonBackground",
            Parent = ButtonOutline,
            BorderSizePixel = 0,
            Position = UDim2new(0, 1, 0, 1),
            Size = UDim2new(1, -2, 1, -2),
        })

        Library:AddTheme(ButtonBackground, {
            BackgroundColor3 = "Element Background"
        })
        
        Library:New("UIGradient", {
            Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3fromRGB(124, 124, 124))},
            Rotation = 90,
            Parent = ButtonBackground,
        })
        
        local ButtonLabel = Library:New("TextLabel", {
            Name = "ButtonLabel",
            Parent = ButtonBackground,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2new(0, 5, 0, 0),
            Size = UDim2new(1, -5, 1, 0),
            FontFace = Library.Font,
            Text = cfg.Name,
            TextSize = Library.FontSize,
            TextStrokeTransparency = 0,
        })

        Library:AddTheme(ButtonLabel, {
            TextColor3 = "Text"
        })

        function Button.StartConfirmation()
            Button.Clicked = true
            Button.ConfirmCountdown = 5
            ButtonLabel.Text = "Confirm: " .. cfg.Name .. " (" .. Button.ConfirmCountdown .. "s)?"
            Button.ConfirmationWrap = coroutine.create(function()
                for _ = 1, 5 do 
                    taskwait(1)
                    Button.ConfirmCountdown = Button.ConfirmCountdown - 1
                    if Button.ConfirmCountdown > 0 then
                        ButtonLabel.Text = "Confirm: " .. cfg.Name .. " (" .. Button.ConfirmCountdown .. "s)?"           
                    else
                        ButtonLabel.Text = cfg.Name
                        if Button.Clicked then 
                            Library:ChangeObjectTheme(ButtonLabel, {
                                TextColor3 = "Text"
                            }, true)

                            Button.Clicked = false
                        end
                        break
                    end
                end
            end)
            coroutine.resume(Button.ConfirmationWrap)
        end

        function Button.SetVisibility(status)
            ButtonHolder.Visible = status
        end

        Utility:Connect(ButtonLine.InputBegan, function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                if not cfg.Confirm then
                    Library:ChangeObjectTheme(ButtonLabel, {
                        TextColor3 = "Accent"
                    }, true)

                    taskwait(Library.TweenSpeed)

                    Library:ChangeObjectTheme(ButtonLabel, {
                        TextColor3 = "Text"
                    }, true)

                    cfg.Callback(true)
                else
                    if not Button.Clicked then
                        Library:ChangeObjectTheme(ButtonLabel, {
                            TextColor3 = "Accent"
                        }, true)

                        Button.StartConfirmation()
                    elseif Button.Clicked then
                        Library:ChangeObjectTheme(ButtonLabel, {
                            TextColor3 = "Text"
                        }, true)

                        coroutine.close(Button.ConfirmationWrap)

                        ButtonLabel.Text = cfg.Name

                        Button.Clicked = false

                        cfg.Callback(true)
                    end
                end
            end
        end)

        Button.ChildHolder = ButtonHolder

        return setmetatable(Button, Library)
    end

    function Library:Dropdown(cfg)
        local Parent = self

        cfg = {
            Name = cfg.Name or "New Dropdown",
            Value = cfg.Value or "Value 1",
            Values = cfg.Values or {"Value 1", "Value 2", "Value 3", "Value 4"},
            Multi = cfg.Multi or false,
            Flag = cfg.Flag or math.random(5^12),
            Ignore = cfg.Ignore or false,
            Callback = cfg.Callback or function() end,
            Visible = cfg.Visible == nil and true or cfg.Visible,
            Close = cfg.Close or false,
        }

        local Holder = Parent.Holder
        local ChildHolder = Parent.ChildHolder
        local ContentHolder = Parent.ContentHolder

        local Dropdown = {
            Items = {},
            Selected = cfg.Multi and {} or ""
        }

        local DropdownHolder = Library:New("Frame", {
            Name = "DropdownHolder",
            Parent = ChildHolder or Holder,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            Visible = cfg.Visible,
        })
        
        Library:New("UIListLayout", {
            Parent = DropdownHolder,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDimnew(0, 3),
        })
        
        local DropdownLine = Library:New("Frame", {
            Name = "DropdownLine",
            Parent = DropdownHolder,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
        })
        
        local DropdownOutline = Library:New("Frame", {
            Name = "DropdownOutline",
            Parent = DropdownLine,
            BorderSizePixel = 0,
            Position = UDim2new(0, 0, 0, 15),
            Size = UDim2new(1, 0, 0, 20),
        })

        Library:AddTheme(DropdownOutline, {
            BackgroundColor3 = "Outline"
        })
        
        local DropdownBackground = Library:New("Frame", {
            Name = "DropdownBackground",
            Parent = DropdownOutline,
            BackgroundColor3 = Color3fromRGB(45, 45, 45),
            BorderColor3 = Color3fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Position = UDim2new(0, 1, 0, 1),
            Size = UDim2new(1, -2, 1, -2),
        })
        
        Library:AddTheme(DropdownBackground, {
            BackgroundColor3 = "Element Background"
        })

        Library:New("UIGradient", {
            Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3fromRGB(124, 124, 124))},
            Rotation = 90,
            Parent = DropdownBackground,
        })
        
        local DropdownValue = Library:New("TextLabel", {
            Name = "DropdownValue",
            Parent = DropdownOutline,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2new(0, 5, 0, 0),
            Size = UDim2new(1, -5, 1, 0),
            FontFace = Library.Font,
            Text = "-",
            TextSize = Library.FontSize,
            TextStrokeTransparency = 0,
            TextXAlignment = Enum.TextXAlignment.Left,
        })

        Library:AddTheme(DropdownValue, {
            TextColor3 = "Text"
        })

        local DropdownStatusOutline = Library:New("Frame", {
            Name = "DropdownStatusOutline",
            Parent = DropdownOutline,
            BorderSizePixel = 0,
            Position = UDim2new(1, -20, 0, 0),
            Size = UDim2new(0, 20, 0, 20),
        })

        Library:AddTheme(DropdownStatusOutline, {
            BackgroundColor3 = "Outline"
        })

        local DropdownStatusBackground = Library:New("Frame", {
            Name = "DropdownStatusBackground",
            Parent = DropdownStatusOutline,
            BorderSizePixel = 0,
            Position = UDim2new(0, 1, 0, 1),
            Size = UDim2new(1, -2, 1, -2),
        })

        Library:AddTheme(DropdownStatusBackground, {
            BackgroundColor3 = "Accent"
        })

        Library:New("UIGradient", {
            Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3fromRGB(149, 149, 149))},
            Rotation = 90,
            Parent = DropdownStatusBackground,
        })

        local DropdownStatusLabel = Library:New("TextLabel", {
            Name = "DropdownStatusLabel",
            Parent = DropdownStatusBackground,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 1, 0),
            FontFace = Library.Font,
            Text = "↓",
            TextScaled = true,
            TextSize = Library.FontSize,
            TextStrokeTransparency = 0,
            TextWrapped = true,
        })

        Library:AddTheme(DropdownStatusLabel, {
            TextColor3 = "Text"
        })

        local DropdownLabel = Library:New("TextLabel", {
            Name = "DropdownLabel",
            Parent = DropdownLine,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 0, 13),
            FontFace = Library.Font,
            Text = cfg.Name,
            TextSize = Library.FontSize,
            TextStrokeTransparency = 0,
            TextXAlignment = Enum.TextXAlignment.Left,
        })

        Library:AddTheme(DropdownLabel, {
            TextColor3 = "Text"
        })
        
        Library:New("UIListLayout", {
            Parent = DropdownLabel,
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDimnew(0, 3),
        })

        local DropdownContentOutline = Library:New("Frame", {
            Name = "DropdownContentOutline",
            Parent = ContentHolder or Library.ScreenGui,
            Visible = false,
            BorderSizePixel = 0,
            Position = UDim2new(0, 0, 0, 0),
            Size = UDim2new(0, 0, 0, 0),
        })

        Library:New("TextButton", {
            Name = "IgnoreButton",
            Parent = DropdownContentOutline,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 1, 0),
            Text = "",
            TextSize = 0,
        })

        Library:AddTheme(DropdownContentOutline, {
            BackgroundColor3 = "Outline"
        })
        
        local DropdownContentBackground = Library:New("Frame", {
            Name = "DropdownContentBackground",
            Parent = DropdownContentOutline,
            BackgroundColor3 = Color3fromRGB(37, 37, 37),
            BorderColor3 = Color3fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Position = UDim2new(0, 1, 0, 1),
            Size = UDim2new(1, -2, 1, -2),
        })

        Library:AddTheme(DropdownContentBackground, {
            BackgroundColor3 = "Background"
        })

        Library:New("UIPadding", {
            Parent = DropdownContentBackground,
            PaddingBottom = UDimnew(0, 5),
            PaddingTop = UDimnew(0, 5),
            PaddingRight = UDimnew(0, 5)
        })

        local DropdownScrollingHolder = Library:New("ScrollingFrame", {
            Name = "DropdownScrollingHolder",
            Parent = DropdownContentBackground,
            Active = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            Size = UDim2new(1, 0, 1, 0),
            BottomImage = Library.Images.Scroll,
            CanvasSize = UDim2new(0, 0, 0, 0),
            MidImage = Library.Images.Scroll,
            ScrollBarThickness = 3,
            TopImage = Library.Images.Scroll,
        })
        
        Library:AddTheme(DropdownScrollingHolder, {
            ScrollBarImageColor3 = "Accent",
        })

        Library:New("UIListLayout", {
            Parent = DropdownScrollingHolder,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDimnew(0, 2),
        })
        
        Library:New("UIPadding", {
            Parent = DropdownScrollingHolder,
            PaddingLeft = UDimnew(0, 5),
        })

        function Dropdown.UpdateAbsolute()
            DropdownContentOutline.Size = UDim2new(0, DropdownOutline.AbsoluteSize.x, 0, DropdownContentOutline.AbsoluteSize.y)
            DropdownContentOutline.Position = UDim2new(0, DropdownOutline.AbsolutePosition.x, 0, DropdownOutline.AbsolutePosition.y + DropdownOutline.AbsoluteSize.y - 1)
        end

        function Dropdown.SetVisibility(status)
            DropdownHolder.Visible = status

            if not status then
                Dropdown.Show(status)
            end
        end

        function Dropdown.Show(status)
            DropdownContentOutline.Visible = status

            Library:Tween(DropdownStatusLabel, nil, {
                Rotation = status and 180 or 0,
                Position = UDim2new(0, status and 1 or 0, 0, status and 2 or 0)
            })
            
            Dropdown.UpdateAbsolute()
        end

        function Dropdown.Display()
            if cfg.Multi then
                local CurrentText = {}

                if #Dropdown.Selected > 0 then
                    for _, option in Dropdown.Selected do
                        tableinsert(CurrentText, option)
    
                        local Text = tableconcat(CurrentText, ", ")
                        DropdownValue.Text = Text
                    end
                else
                    DropdownValue.Text = "-"
                end

            else
                local Selected = Dropdown.Selected

                DropdownValue.Text = Selected == "" or Selected == nil and "-" or Selected
            end
        end

        function Dropdown.Set(item)
            if cfg.Multi then
                if type(item) == "table" then
                    -- too lazy to implement a for loop for a table, just set it for every item ig.
                    for _,v in item do
                        if not tablefind(Dropdown.Selected, v) then
                            Dropdown.Set(v)
                        end
                    end
                else
                    local Index = tablefind(Dropdown.Selected, item)
                    local Item = Dropdown.Items[item]
    
                    if Item then
                        if Index then    
                            Item.Selected = false
    
                            Library:ChangeObjectTheme(Item.Text, {
                                TextColor3 = "Text"
                            }, true)
    
                            tableremove(Dropdown.Selected, Index)

                            Dropdown.Display()
    
                            if not cfg.Ignore then
                                Library.Flags[cfg.Flag] = Dropdown.Selected
                            end
    
                            cfg.Callback(Dropdown.Selected)
                        else    
                            Item.Selected = true
    
                            Library:ChangeObjectTheme(Item.Text, {
                                TextColor3 = "Accent"
                            }, true)
    
                            tableinsert(Dropdown.Selected, item)
    
                            Dropdown.Display()
    
                            if not cfg.Ignore then
                                Library.Flags[cfg.Flag] = Dropdown.Selected
                            end
    
                            cfg.Callback(Dropdown.Selected)
                        end
                    end
                end
            else
                for _,v in Dropdown.Items do
                    Library:ChangeObjectTheme(v.Text, {
                        TextColor3 = _ == item and "Accent" or "Text"
                    }, true)

                    v.Selected = _ == item
                end

                Dropdown.Selected = item

                Dropdown.Display()

                if not cfg.Ignore then
                    Library.Flags[cfg.Flag] = item
                end

                cfg.Callback(item)
            end

            if cfg.Close then
                Dropdown.Show(false)
            end
        end

        local function GetTblSize(tbl)
            local Count = 0

            for _,v in tbl do
                Count += 1
            end

            return Count
        end

        function Dropdown.NewItem(item)
            if Dropdown.Items[item] then
                return
            end
            
            local Item = {
                Name = item,
                Selected = false
            }

            local DropdownContentLabel = Library:New("TextLabel", {
                Name = "DropdownContentLabel",
                Parent = DropdownScrollingHolder,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2new(1, 0, 0, 15),
                FontFace = Library.Font,
                Text = item,
                TextSize = Library.FontSize,
                TextStrokeTransparency = 0,
                TextXAlignment = Enum.TextXAlignment.Left,
            })

            Library:AddTheme(DropdownContentLabel, {
                TextColor3 = "Text"
            })

            Item.Text = DropdownContentLabel

            Utility:Connect(DropdownContentLabel.InputBegan, function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Dropdown.Set(item)
                end
            end)

            Dropdown.Items[item] = Item

            -- SOME GAY SIZE MATH
                local Size = 0
                for _,v in DropdownScrollingHolder:GetChildren() do
                    if IsA(v, "TextLabel") then
                        Size += v.AbsoluteSize.y + 2
                    end
                end

                Size += 10 -- uipadding shiz.
            --
            
            if GetTblSize(Dropdown.Items) <= 6 then
                DropdownContentOutline.Size = UDim2new(0, DropdownContentOutline.AbsoluteSize.x, 0, Size)
            end
        end

        function Dropdown.Refresh(tbl)
            for _,v in Dropdown.Items do
                v.Text:Destroy()

                Dropdown.Items[_] = nil
            end

            for _,v in tbl do
                Dropdown.NewItem(v)
            end
        end
        
        for _,v in cfg.Values do
            Dropdown.NewItem(v)
        end

        Dropdown.Set(cfg.Value)

        Library.Flags[cfg.Flag] = Dropdown.Selected

        Library.ConfigFlags[cfg.Flag] = Dropdown

        Utility:Connect(DropdownLine.InputBegan, function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                Dropdown.Show(not DropdownContentOutline.Visible)
            end
        end)

        Utility:Connect(DropdownOutline:GetPropertyChangedSignal("AbsolutePosition"), function()
            Dropdown.UpdateAbsolute()
        end)

        Utility:Connect(DropdownOutline:GetPropertyChangedSignal("AbsoluteSize"), function()
            Dropdown.UpdateAbsolute()
        end)

        Dropdown.ChildHolder = DropdownHolder
        Dropdown.TextLabel = DropdownLabel

        return setmetatable(Dropdown, Library)
    end

    function Library:List(cfg)
        local Parent = self

        cfg = {
            Size = cfg.Size or 150,
            Name = cfg.Name or "New List",
            Value = cfg.Value or "Value 1",
            Values = cfg.Values or {"Value 1", "Value 2", "Value 3", "Value 4"},
            Multi = cfg.Multi or false,
            Flag = cfg.Flag or math.random(5^12),
            Ignore = cfg.Ignore or false,
            Callback = cfg.Callback or function() end,
            Visible = cfg.Visible == nil and true or cfg.Visible,
        }

        local Holder = Parent.Holder
        local ChildHolder = Parent.ChildHolder

        local List = {
            Items = {},
            Selected = cfg.Multi and {} or ""
        }

        local ListHolder = Library:New("Frame", {
            Name = "ListHolder",
            Parent = ChildHolder or Holder,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            Visible = cfg.Visible,
        })

        Library:New("UIListLayout", {
            Parent = ListHolder,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDimnew(0, 3),
        })
        
        local ListLine = Library:New("Frame", {
            Name = "ListLine",
            Parent = ListHolder,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
        })

        local ListOutline = Library:New("Frame", {
            Name = "ListOutline",
            Parent = ListLine,
            BorderSizePixel = 0,
            Position = UDim2new(0, 0, 0, 15),
            Size = UDim2new(1, 0, 0, cfg.Size),
        })

        Library:AddTheme(ListOutline, {
            BackgroundColor3 = "Outline"
        })
        
        local ListBackground = Library:New("Frame", {
            Name = "ListBackground",
            Parent = ListOutline,
            BackgroundColor3 = Color3fromRGB(45, 45, 45),
            BorderColor3 = Color3fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Position = UDim2new(0, 1, 0, 1),
            Size = UDim2new(1, -2, 1, -2),
        })

        Library:AddTheme(ListBackground, {
            BackgroundColor3 = "Element Background"
        })

        Library:New("UIPadding", {
            Parent = ListBackground,
            PaddingBottom = UDimnew(0, 5),
            PaddingTop = UDimnew(0, 5),
            PaddingRight = UDimnew(0, 5)
        })
        
        Library:New("UIGradient", {
            Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3fromRGB(124, 124, 124))},
            Rotation = 90,
            Parent = ListBackground,
        })

        local ListScrollingHolder = Library:New("ScrollingFrame", {
            Name = "ListScrollingHolder",
            Parent = ListBackground,
            Active = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            Size = UDim2new(1, 0, 1, 0),
            BottomImage = Library.Images.Scroll,
            CanvasSize = UDim2new(0, 0, 0, 0),
            MidImage = Library.Images.Scroll,
            ScrollBarThickness = 3,
            TopImage = Library.Images.Scroll,
        })
        
        Library:AddTheme(ListScrollingHolder, {
            ScrollBarImageColor3 = "Accent",
        })

        Library:New("UIListLayout", {
            Parent = ListScrollingHolder,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDimnew(0, 2),
        })
        
        Library:New("UIPadding", {
            Parent = ListScrollingHolder,
            PaddingLeft = UDimnew(0, 5),
        })

        local ListLabel = Library:New("TextLabel", {
            Name = "ListLabel",
            Parent = ListLine,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 0, 13),
            FontFace = Library.Font,
            Text = cfg.Name,
            TextColor3 = Color3fromRGB(255, 255, 255),
            TextSize = Library.FontSize,
            TextStrokeTransparency = 0,
            TextXAlignment = Enum.TextXAlignment.Left,
        })

        Library:AddTheme(ListLabel, {
            TextColor3 = "Text"
        })
        
        Library:New("UIListLayout", {
            Parent = ListLabel,
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDimnew(0, 3),
        })

        function List.SetVisibility(status)
            ListHolder.Visible = status
        end

        function List.Set(item)
            if cfg.Multi then
                if type(item) == "table" then
                    for _,v in item do
                        if not tablefind(List.Selected, v) then
                            List.Set(v)
                        end
                    end

                    return
                end

                local Index = tablefind(List.Selected, item)
                local Item = List.Items[item]

                if Item then
                    if Index then
                        tableremove(List.Selected, Index)

                        Item.Selected = false

                        Library:ChangeObjectTheme(Item.Text, {
                            TextColor3 = "Text"
                        }, true)

                        if not cfg.Ignore then
                            Library.Flags[cfg.Flag] = List.Selected
                        end

                        cfg.Callback(List.Selected)
                    else
                        tableinsert(List.Selected, item)

                        Item.Selected = true

                        Library:ChangeObjectTheme(Item.Text, {
                            TextColor3 = "Accent"
                        }, true)

                        if not cfg.Ignore then
                            Library.Flags[cfg.Flag] = List.Selected
                        end

                        cfg.Callback(List.Selected)
                    end
                end
            else
                for _,v in List.Items do
                    Library:ChangeObjectTheme(v.Text, {
                        TextColor3 = _ == item and "Accent" or "Text"
                    }, true)

                    v.Selected = _ == item
                end

                List.Selected = item

                if not cfg.Ignore then
                    Library.Flags[cfg.Flag] = item
                end

                cfg.Callback(item)
            end
        end

        function List.NewItem(item)
            local ImageId = nil
            if type(item) == "table" then
                ImageId = item.ImageId
                item = item.Name
            end

            if List.Items[item] then
                return
            end

            local Item = {
                Name = item,
                Selected = false
            }

            local ListContentBackground = Library:New("Frame", {
                Name = "ListContentBackground",
                BackgroundTransparency = 1,
                Parent = ListScrollingHolder,
                BorderSizePixel = 0,
                Size = UDim2new(1, 0, 0, 15),            
            })

            local ListContentLabel = Library:New("TextLabel", {
                Name = "ListContentLabel",
                Parent = ListContentBackground,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2new(0, ImageId and 18 or 0, 0, 0),
                Size = UDim2new(1, ImageId and -18 or 0, 1, 0),
                FontFace = Library.Font,
                Text = item,
                TextSize = Library.FontSize,
                TextStrokeTransparency = 0,
                TextXAlignment = Enum.TextXAlignment.Left,
            })

            if ImageId then
                local ListContentImage = Library:New("ImageLabel", {
                    Name = "ListContentImage",
                    Parent = ListContentBackground,
                    BackgroundColor3 = Color3fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Position = UDim2new(0, 0, 0, 0),
                    Size = UDim2new(0, 15, 0, 15),
                    Image = ImageId,
                })
            end
            
            Library:AddTheme(ListContentLabel, {
                TextColor3 = "Text"
            })

            Item.Holder = ListContentBackground
            Item.Text = ListContentLabel

            Utility:Connect(ListContentBackground.InputBegan, function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    List.Set(item)
                end
            end)

            List.Items[item] = Item
        end

        function List.Refresh(tbl)
            for _,v in List.Items do
                v.Holder:Destroy()

                List.Items[_] = nil
            end

            for _,v in tbl do
                List.NewItem(v)
            end
        end
        
        for _,v in cfg.Values do
            List.NewItem(v)
        end

        List.Set(cfg.Value)

        Library.Flags[cfg.Flag] = List.Selected

        Library.ConfigFlags[cfg.Flag] = List

        List.ChildHolder = ListHolder
        List.TextLabel = ListLabel

        return setmetatable(List, Library)
    end

    function Library:Keybind(cfg)
        local Parent = self

        cfg = {
            Name = cfg.Name or "New Keybind",
            Key = cfg.Key or "-",
            Mode = cfg.Mode or "Toggle",
            Modes = cfg.Modes or true,
            Value = cfg.Value or false,
            Flag = cfg.Flag or math.random(5^12),
            Ignore = cfg.Ignore or false,
            Callback = cfg.Callback or function() end,
            Child = cfg.Child == nil and true or cfg.Child,
            Visible = cfg.Visible == nil and true or cfg.Visible,
        }

        local Holder = Parent.Holder
        local ChildHolder = Parent.ChildHolder
        local TextLabelHolder = Parent.TextLabel

        local Keybind = {
            Listening = false,
            Key = "",
            Value = cfg.Value,
            Mode = ""
        }

        local KeybindMode = Library.Selectables.KeybindMode

        local KeybindHolder = cfg.Child and TextLabelHolder or Library:New("Frame", {
            Name = "KeybindHolder",
            Parent = ChildHolder or Holder,
            BackgroundTransparency = 1,
            Visible = not TextLabelHolder and cfg.Visible or true,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 0, 13),
            AutomaticSize = Enum.AutomaticSize.Y,
        })
        
        local KeybindLabel
        if not (TextLabelHolder and cfg.Child) then
            local KeybindLine = Library:New("Frame", {
                Name = "KeybindLine",
                Parent = KeybindHolder,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2new(1, 0, 0, 13),
            })    

            KeybindLabel = Library:New("TextLabel", {
                Name = "KeybindLabel",
                Parent = KeybindLine,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2new(1, 0, 1, 0),
                FontFace = Library.Font,
                Text = cfg.Name,
                TextSize = Library.FontSize,
                TextStrokeTransparency = 0,
                TextXAlignment = Enum.TextXAlignment.Left,
            })

            Library:AddTheme(KeybindLabel, {
                TextColor3 = "Text"
            })
            
            Library:New("UIListLayout", {
                Parent = KeybindLabel,
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDimnew(0, 3),
            })
        end

        local KeybindValue = Library:New("TextButton", {
            Name = "KeybindHolder",
            Parent = cfg.Child and TextLabelHolder or KeybindLabel,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Visible = TextLabelHolder and cfg.Visible or true,
            AutomaticSize = Enum.AutomaticSize.X,
            Size = UDim2new(0, 0, 1, 0),
            FontFace = Library.Font,
            Text = "[E]",
            TextSize = Library.FontSize,
            TextStrokeTransparency = 0,
        })

        Library:AddTheme(KeybindValue, {
            TextColor3 = "Text"
        })

        function Keybind.ChangeMode(mode)
            Keybind.Mode = mode 
            if mode == "Always" then
                Keybind.Set(true)
            elseif mode == "Hold" then
                Keybind.Set(false)
            end
        end

        function Keybind.Set(input)
            if type(input) == "boolean" then
                local Value = input

                if Keybind.Mode == "Always" then
                    Value = true
                end

                Keybind.Value = Value

                cfg.Callback(Keybind.Value or false)
            elseif tostring(input):find("Enum") then 
                input = input.Name == "Escape" and "-" or input

                Keybind.Key = input or "-"

                local Text = (ConvertKeys[Keybind.Key] or tostring(Keybind.Key):gsub("Enum.", ""))
                local Text2 = (tostring(Text):gsub("KeyCode.", ""):gsub("UserInputType.", "")) or "-"
                KeybindValue.Text = "[" .. Text2 .. "]"

                cfg.Callback(Keybind.Value or false)
            elseif tablefind({"Toggle", "Hold", "Always"}, input) then 
                Keybind.ChangeMode(input)

                cfg.Callback(Keybind.Value or false)
            elseif type(input) == "table" then
                input.Key = type(input.Key) == "string" and input.Key ~= "-" and Utility:ConvertToEnum(input.Key) or input.Key

                input.Key = input.Key == Enum.KeyCode.Escape and "-" or input.Key

                Keybind.Key = input.Key or "-"

                Keybind.Mode = input.Mode or "Toggle"

                if input.Value then
                    Keybind.Value = input.Value
                end

                local Text = tostring(Keybind.Key) ~= "Enums" and (ConvertKeys[Keybind.Key] or tostring(Keybind.Key):gsub("Enum.", "")) or nil
                local Text2 = Text and (tostring(Text):gsub("KeyCode.", ""):gsub("UserInputType.", ""))
                KeybindValue.Text = "[" .. Text2 .. "]" or "[-]"

                cfg.Callback(Keybind.Value or false)
            end

            if not cfg.Ignore then
                Library.Keybinds[cfg.Flag] = {
                    Flag = cfg.Flag,
                    Status = Keybind.Value,
                    Text = ("[%s]: %s"):format(tostring(Keybind.Key):gsub("Enum.KeyCode.", ""):gsub("Enum.UserInputType.", ""), cfg.Name)
                }
            end

            Library.Flags[cfg.Flag] = Keybind.Value

            Library.Flags[cfg.Flag .. "_data"] = {
                Key = Keybind.Key,
                Mode = Keybind.Mode,
                Value = Keybind.Value,
            }
        end

        function Keybind.SetVisibility(status)
            if not TextLabelHolder then
                KeybindHolder.Visible = status
            end

            if TextLabelHolder then
                KeybindValue.Visible = status
            end
        end

        Utility:Connect(KeybindValue.InputBegan, function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 and not Keybind.Listening then
                Library:ChangeObjectTheme(KeybindValue, {
                    TextColor3 = "Accent"
                }, true)

                taskwait()

                Keybind.Listening = true
            end

            if input.UserInputType == Enum.UserInputType.MouseButton2 then
                KeybindMode.Holder.Position = UDim2new(0, KeybindValue.AbsolutePosition.x, 0, KeybindValue.AbsolutePosition.y + KeybindValue.AbsoluteSize.y + 2)

                if KeybindMode.Flag ~= cfg.Flag then
                    KeybindMode.Holder.Visible = true

                    KeybindMode.Dropdown.Set(Keybind.Mode ~= "" and Keybind.Mode or "Toggle")

                    KeybindMode.Flag = cfg.Flag
                else
                    KeybindMode.Holder.Visible = false

                    KeybindMode.Flag = ""
                end
            end
        end)

        Utility:Connect(UserInputService.InputBegan, function(input)
            if Keybind.Listening then
                Keybind.Set(input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode or input.UserInputType)
                Keybind.Listening = false

                Library:ChangeObjectTheme(KeybindValue, {
                    TextColor3 = "Text"
                }, true)
            elseif input.KeyCode == Keybind.Key or input.UserInputType == Keybind.Key then
                Keybind.Set(not Keybind.Value)
            end
        end)

        Utility:Connect(UserInputService.InputEnded, function(input)
            if Keybind.Mode == "Hold" and (input.KeyCode == Keybind.Key or input.UserInputType == Keybind.Key) and not Keybind.Listening then
                Keybind.Set(false)
            end
        end)

        Keybind.Set({
            Key = cfg.Key,
            Mode = cfg.Mode
        })

        Library.ConfigFlags[cfg.Flag] = Keybind

        Library.ConfigFlags[cfg.Flag .. "_data"] = Keybind

        Keybind.ChildHolder = KeybindHolder
        Keybind.TextLabel = cfg.Child and TextLabelHolder or KeybindLabel

        return setmetatable(Keybind, Library)
    end

    function Library:Textbox(cfg)
        local Parent = self

        cfg = {
            Name = cfg.Name or "New Textbox",
            Value = cfg.Value or "",
            Flag = cfg.Flag or  math.random(5^12),
            Callback = cfg.Callback or function() end,
            Visible = cfg.Visible == nil and true or cfg.Visible,
        }

        local Textbox = {}

        local Holder = Parent.Holder
        local ChildHolder = Parent.ChildHolder

        local TextboxHolder = Library:New("Frame", {
            Name = "TextboxHolder",
            Parent = ChildHolder or Holder,
            BorderSizePixel = 0,
            Visible = cfg.Visible,
            Size = UDim2new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
        })

        Library:New("UIListLayout", {
            Parent = TextboxHolder,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDimnew(0, 3),
        })
        
        local TextboxLine = Library:New("Frame", {
            Name = "TextboxLine",
            Parent = TextboxHolder,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 0, 20),
        })
        
        local TextboxOutline = Library:New("Frame", {
            Name = "TextboxOutline",
            Parent = TextboxLine,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 1, 0),
        })

        Library:AddTheme(TextboxOutline, {
            BackgroundColor3 = "Outline"
        })

        local TextboxBackground = Library:New("Frame", {
            Name = "TextboxBackground",
            Parent = TextboxOutline,
            BorderSizePixel = 0,
            Position = UDim2new(0, 1, 0, 1),
            Size = UDim2new(1, -2, 1, -2),
        })

        Library:AddTheme(TextboxBackground, {
            BackgroundColor3 = "Element Background"
        })
        
        -- Library:New("UIGradient", {
        --     Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3fromRGB(124, 124, 124))},
        --     Rotation = 90,
        --     Parent = TextboxBackground,
        -- })
        
        local TextboxLabel = Library:New("TextBox", {
            Name = "TextboxLabel",
            Parent = TextboxBackground,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2new(0, 5, 0, 0),
            Size = UDim2new(1, -5, 1, 0),
            FontFace = Library.Font,
            Text = cfg.Value,
            PlaceholderText = cfg.Name,
            TextSize = Library.FontSize,
            ClearTextOnFocus = false,
            TextStrokeTransparency = 0,
        })

        Library:AddTheme(TextboxLabel, {
            TextColor3 = "Text",
            PlaceholderColor3 = "Dark Text"
        })

        function Textbox.SetVisibility(status)
            TextboxHolder.Visible = status
        end

        function Textbox.Set(value)
            TextboxLabel.Text = value

            Library.Flags[cfg.Flag] = value

            cfg.Callback(value)
        end

        Utility:Connect(TextboxLabel.FocusLost, function()
            Textbox.Set(TextboxLabel.Text)
        end)

        Utility:Connect(TextboxLabel:GetPropertyChangedSignal("Text"), function()
            Textbox.Set(TextboxLabel.Text)
        end)

        Textbox.ChildHolder = TextboxHolder

        Library.ConfigFlags[cfg.Flag] = Textbox

        return setmetatable(Textbox, Library)
    end

    function Library:Label(cfg)
        local Parent = self

        cfg = {
            Name = cfg.Name or "New Label",
        }

        local Label = {}

        local Holder = Parent.Holder
        local ChildHolder = Parent.ChildHolder

        local LabelHolder = Library:New("Frame", {
            Name = "LabelHolder",
            Parent = ChildHolder or Holder,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Visible = cfg.Visible,
            Size = UDim2new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
        })

        Library:New("UIListLayout", {
            Parent = LabelHolder,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDimnew(0, 3),
        })
        
        local LabelLine = Library:New("Frame", {
            Name = "LabelLine",
            Parent = LabelHolder,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 0, 13),
        })

        local LabelLabel = Library:New("TextLabel", {
            Name = "LabelLabel",
            Parent = LabelLine,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2new(0, 0, 0, 0),
            Size = UDim2new(1, 0, 1, 0),
            FontFace = Library.Font,
            Text = cfg.Name,
            TextSize = Library.FontSize,
            TextStrokeTransparency = 0,
            TextXAlignment = Enum.TextXAlignment.Left,
            RichText = true,
        })

        Library:AddTheme(LabelLabel, {
            TextColor3 = "Text"
        })

        Library:New("UIListLayout", {
            Parent = LabelLabel,
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDimnew(0, 3),
        })

        function Label.SetVisibility(status)
            LabelHolder.Visible = status
        end

        function Label.ChangeText(text)
            LabelLabel.Text = text
        end

        Label.ChildHolder = LabelHolder
        Label.TextLabel = LabelLabel

        return setmetatable(Label, Library)
    end

    function Library:Colorpicker(cfg)
        local Parent = self

        cfg = {
            Name = cfg.Name or "New Colorpicker",
            Color = cfg.Color or Color3fromRGB(255, 255, 255),
            Transparency = cfg.Transparency or 1,
            Flag = cfg.Flag or math.random(5^12),
            Callback = cfg.Callback or function() end,
            Child = cfg.Child == nil and true or cfg.Child,
            Visible = cfg.Visible == nil and true or cfg.Visible,
        }

        local Holder = Parent.Holder
        local ChildHolder = Parent.ChildHolder
        local TextLabelHolder = Parent.TextLabel

        local Colorpicker = {
            Color = cfg.Color,
            Transparency = cfg.Transparency
        }

        local ColorpickerHolder = cfg.Child and TextLabelHolder or Library:New("Frame", {
            Name = "ColorpickerHolder",
            Parent = ChildHolder or Holder,
            BackgroundTransparency = 1,
            Visible = not TextLabelHolder and cfg.Visible or true,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 0, 13),
            AutomaticSize = Enum.AutomaticSize.Y,
        })

        local ColorpickerLabel
        if not (TextLabelHolder and cfg.Child) then
            local ColorpickerLine = Library:New("Frame", {
                Name = "ColorpickerLine",
                Parent = ColorpickerHolder,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2new(1, 0, 0, 13),
            })
            
            ColorpickerLabel = Library:New("TextLabel", {
                Name = "ColorpickerLabel",
                Parent = ColorpickerLine,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2new(1, 0, 1, 0),
                FontFace = Library.Font,
                Text = cfg.Name,
                TextSize = Library.FontSize,
                TextStrokeTransparency = 0,
                TextXAlignment = Enum.TextXAlignment.Left,
            })

            Library:AddTheme(ColorpickerLabel, {
                TextColor3 = "Text"
            })

            Library:New("UIListLayout", {
                Parent = ColorpickerLabel,
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDimnew(0, 3),
            })
        end
        
        local ColorpickerOutline = Library:New("Frame", {
            Name = "ColorpickerOutline",
            Parent = cfg.Child and TextLabelHolder or ColorpickerLabel,
            Visible = TextLabelHolder and cfg.Visible == nil and true or cfg.Visible,
            BorderSizePixel = 0,
            Size = UDim2new(0, 27, 1, 0),
        })

        Library:AddTheme(ColorpickerOutline, {
            BackgroundColor3 = "Outline"
        })
        
        local ColorpickerImage = Library:New("ImageLabel", {
            Name = "ColorpickerImage",
            Parent = ColorpickerOutline,
            BackgroundColor3 = Color3fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2new(0, 1, 0, 1),
            Size = UDim2new(1, -2, 1, -2),
            Image = Library.Images.Checkers,
            ScaleType = Enum.ScaleType.Tile,
            TileSize = UDim2new(0, 6, 0, 6),
        })

        local ColorpickerBackground = Library:New("Frame", {
            Name = "ColorpickerBackground",
            Parent = ColorpickerImage,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 1, 0),
        })
        
        Library:New("UIGradient", {
            Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3fromRGB(149, 149, 149))},
            Rotation = 90,
            Parent = ColorpickerBackground,
        })

        local ColorpickerButton = Library:New("TextButton", {
            Name = "ColorpickerButton",
            BackgroundTransparency = 1,
            Parent = ColorpickerBackground,
            BorderSizePixel = 0,
            Text = "",
            Size = UDim2new(1, 0, 1, 0),
            ZIndex = 10,
        })

        function Colorpicker.Set(color, transparency)
            transparency = transparency or Colorpicker.Transparency

            if type(color) == "table" then
                transparency = color.a
                color = color.c
            end

            Colorpicker.Color = color
            Colorpicker.Transparency = transparency

            ColorpickerBackground.BackgroundColor3 = color
            ColorpickerBackground.BackgroundTransparency = 1 - transparency

            Library.Flags[cfg.Flag] = {
                a = transparency,
                c = color
            }

            cfg.Callback({
                a = transparency,
                c = color
            })
        end

        function Colorpicker.SetVisibility(status)
            if not TextLabelHolder then
                ColorpickerHolder.Visible = status
            end

            if TextLabelHolder then
                ColorpickerOutline.Visible = status
            end
        end

        Colorpicker.Set({
            c = Colorpicker.Color,
            a = Colorpicker.Transparency
        })

        Utility:Connect(ColorpickerButton.MouseButton1Down, function()
            local ColorpickerSelect = Library.Selectables.Colorpicker

            ColorpickerSelect.Window.Title.Text = cfg.Name

            -- if ColorpickerSelect.Window.OutlineHolder.Visible then
            --     ColorpickerSelect.Flag = ""

            --     --ColorpickerSelect.Window.OutlineHolder.Visible = false
            -- else
                ColorpickerSelect.Flag = cfg.Flag

                ColorpickerSelect.Set({
                    c = Colorpicker.Color,
                    a = Colorpicker.Transparency
                })

                --ColorpickerSelect.Window.OutlineHolder.Visible = true
            -- end
        end)

        Library.ConfigFlags[cfg.Flag] = Colorpicker

        Colorpicker.ChildHolder = ColorpickerHolder
        Colorpicker.TextLabel = cfg.Child and TextLabelHolder or ColorpickerLabel

        return setmetatable(Colorpicker, Library)
    end

    function Library:Show(value)
        Library.ScreenGui.Enabled = value
        Library.Popups.Enabled = value
    end

    function Library:GetConfig()
        local Config = {}

        for _,v in Library.ConfigFlags do
            local Value = Library.Flags[_]

            if type(Value) == "table" and Value["Key"] then
                Config[_] = {Value = Value.Value, Mode = Value.Mode, Key = tostring(Value.Key)}
            elseif type(Value) == "table" and Value["a"] and Value["c"] then
                Config[_] = {a = Value.a, c = Value.c:ToHex()}
            else
                Config[_] = Value
            end
        end

        return HttpService:JSONEncode(Config)
    end

    function Library:LoadConfig(config)
        local Config = HttpService:JSONDecode(config)

        for _,v in Config do
            local ConfigTable = Library.ConfigFlags[_]

            if ConfigTable then
                local Func = ConfigTable.Set
                if Func then
                    if type(v) == "table" and v["a"] and v["c"] then
                        Func({
                            a = v.a,
                            c = type(v.c) == "string" and Color3fromHex(v.c) or v.c
                        })
                    else
                        Func(v)
                    end
                end
            end
        end
    end

    function Library:InitList(cfg)
        cfg = {
            Name = cfg.Name or "New List",
            Position = cfg.Position or UDim2new(0, 300, 0, 300)
        }

        local WindowOutline = Library:New("Frame", {
            Name = "WindowOutline",
            Parent = Library.ListsGui,
            BorderSizePixel = 0,
            Position = cfg.Position,
            Size = UDim2new(0, 100, 0, 0),
            --AutomaticSize = Enum.AutomaticSize.Y,
        }, true)

        WindowOutline.Active = true
        WindowOutline.Draggable = true

        Library:AddTheme(WindowOutline, {
            BackgroundColor3 = "Outline",
        })

        local WindowBackground = Library:New("Frame", {
            Name = "WindowBackground",
            Parent = WindowOutline,
            BorderSizePixel = 0,
            Position = UDim2new(0, 1, 0, 1),
            Size = UDim2new(1, -2, 1, -2),
        }, true)

        Library:AddTheme(WindowBackground, {
            BackgroundColor3 = "Background",
        })

        local ItemsHolder = Library:New("Frame", {
            Name = "WindowBackground",
            Parent = WindowBackground,
            BorderSizePixel = 0,
            Position = UDim2new(0, 0, 0, 0),
            Size = UDim2new(1, 0, 0, 0),
        }, true)

        Library:New("UIPadding", {
            Parent = ItemsHolder,
            PaddingLeft = UDimnew(0, 5),
            PaddingRight = UDimnew(0, 5),
        }, true)

        local TitleBackground = Library:New("Frame", {
            Name = "TitleBackground",
            Parent = WindowBackground,
            BorderSizePixel = 0,
            Size = UDim2new(1, 0, 0, 24),
        }, true)

        Library:AddTheme(TitleBackground, {
            BackgroundColor3 = "Accent",
        })
        
        Library:New("UIPadding", {
            Parent = TitleBackground,
            PaddingBottom = UDimnew(0, 5),
            PaddingLeft = UDimnew(0, 5),
            PaddingRight = UDimnew(0, 5),
            PaddingTop = UDimnew(0, 5),
        }, true)

        Library:New("UIGradient", {
            Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3fromRGB(149, 149, 149))},
            Rotation = 90,
            Parent = TitleBackground,
        }, true)

        local TitleLabel = Library:New("TextLabel", {
            Name = "TitleLabel",
            Parent = TitleBackground,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.X,
            Size = UDim2new(0, 0, 1, 0),
            FontFace = Library.Font,
            Text = cfg.Name,
            TextSize = Library.FontSize,
            TextStrokeTransparency = 0,
            TextXAlignment = Enum.TextXAlignment.Left,
        }, true)

        Library:AddTheme(TitleLabel, {
            TextColor3 = "Text",
        })

        local TitleOutline = Library:New("Frame", {
            Name = "TitleOutline",
            Parent = WindowBackground,
            BorderSizePixel = 0,
            Position = UDim2new(0, 0, 0, 24),
            Size = UDim2new(1, 0, 0, 1),
        }, true)

        Library:AddTheme(TitleOutline, {
            BackgroundColor3 = "Outline",
        })

        local List = {
            Items = {},
        }

        local YOffset = 0
        local BiggestX = TitleLabel.TextBounds.X
        local LerpedSize = TitleLabel.TextBounds.X

        function List.RenderItem(flag, text, status)
            if not List.Items[flag] then
                List.Items[flag] = {
                    Object = Library:New("TextLabel", {
                        Name = "ItemLabel",
                        Parent = ItemsHolder,
                        BackgroundTransparency = 1,
                        TextTransparency = 1,
                        Position = UDim2new(0, 0, 0, 0),
                        AutomaticSize = Enum.AutomaticSize.XY,
                        Size = UDim2new(0, 0, 0, 0),
                        FontFace = Library.Font,
                        Text = text,
                        TextSize = Library.FontSize,
                        TextStrokeTransparency = 0,
                    }, true),
                    Text = text,
                    Status = status,
                    Fade = 2,
                }

                Library:AddTheme(List.Items[flag].Object, {
                    TextColor3 = "Text"
                })        

                return
            end

            local Item = List.Items[flag]
            local Object = Item.Object

            Item.Fade = Utility:Lerp(Item.Fade, status and 255 or 0, Library.LerpSpeed)

            Item.Text = text
            Item.Status = status
            
            Object.Text = Item.Text
            Object.Position = UDim2new(0, -(Object.TextBounds.X - (Object.TextBounds.X * (Item.Fade / 255))), 0, 30 + YOffset)
            Object.TextTransparency = 1 - (1 * (Item.Fade / 255))

            if status and BiggestX < Object.TextBounds.X then
                BiggestX = mathmax(BiggestX, Object.TextBounds.X)
            end

            YOffset += (Object.TextBounds.Y + 3) * (Item.Fade / 255)
        end

        function List.GetItems()
            return {
                {
                    Text = "Test22222222",
                    Flag = "flag1",
                    Status = true,
                },
                {
                    Text = "Test2",
                    Flag = "flag2",
                    Status = true,
                },
                {
                    Text = "Test3",
                    Flag = "flag3",
                    Status = true,
                },
                {
                    Text = "Test4",
                    Flag = "flag4",
                    Status = true,
                },
                {
                    Text = "Test5",
                    Flag = "flag5",
                    Status = true,
                },
            }
        end

        function List.SetVisibility(status)
            WindowOutline.Visible = status
        end

        function List.Think()
            if not WindowOutline.Visible then
                return
            end

            YOffset = 0
            BiggestX = TitleLabel.TextBounds.X

            for _,v in List.GetItems() do
                List.RenderItem(v.Flag, v.Text, v.Status)
            end

            LerpedSize = Utility:Lerp(LerpedSize, BiggestX + 15, Library.LerpSpeed)

            WindowOutline.Size = UDim2new(0, LerpedSize, 0, 35 + YOffset)
        end

        return List
    end

    function Library:TextTriggers(text)
        local AccentTheme = Library.Theme.Accent

        local Triggers = {
            ['{user}'] = Puppyware.User,
            ['{name}'] = ('<font color="rgb(%s, %s, %s)">Puppyware</font>'):format(mathfloor(AccentTheme.r * 255), mathfloor(AccentTheme.g * 255), mathfloor(AccentTheme.b * 255)),
            ['{hour}'] = os.date("%H"),
            ['{minute}'] = os.date("%M"),
            ['{second}'] = os.date("%S"),
            ['{ap}'] = os.date("%p"),
            ['{month}'] = os.date("%b"),
            ['{day}'] = os.date("%d"),
            ['{year}'] = os.date("%Y"),
            ['{fps}'] = Library.Fps,
            ['{ping}'] = mathfloor(Stats.PerformanceStats.Ping:GetValue() or 0),
            ['{time}'] = os.date("%H:%M:%S"),
            ['{date}'] = os.date("%b. %d, %Y")
        }

        for _,v in Triggers do
            text = string.gsub(text, _, v)
        end

        return text
    end

    function Library:Watermark(cfg)
        cfg = {
            Text = cfg.Text or "{name} | {user} | rtt: {ping}ms | {time}",
            Visible = cfg.Visible or true,
            TickRate = cfg.TickRate or 0.2
        }

        local Watermark = {
            Visible = cfg.Visible,
            Text = cfg.Text,
            TickRate = cfg.TickRate,
            Time = osclock() - 1000
        }

        local WatermarkBackground = Library:New("Frame", {
            Name = "WatermarkBackground",
            Parent = Library.ListsGui,
            AutomaticSize = Enum.AutomaticSize.XY,
            Position = UDim2new(0, 10, 0, 5),
            Size = UDim2new(0, 0, 0, 0),
            Visible = cfg.Visible,
        }, true)

        local WatermarkLabel = Library:New("TextLabel", {
            Name = "WatermarkLabel",
            Parent = WatermarkBackground,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.XY,
            Position = UDim2new(0, 0, 0, 0),
            FontFace = Library.Font,
            TextSize = Library.FontSize,
            TextTransparency = 0,
            TextStrokeTransparency = 0,
            TextXAlignment = Enum.TextXAlignment.Left,
            RichText = true,
        }, true)

        local WatermarkAccent = Library:New("Frame", {
            Name = "WatermarkAccent",
            Parent = WatermarkBackground,
            BorderSizePixel = 0,
            Position = UDim2new(0, -3, 0, -5),
            Size = UDim2new(1, 6, 0, 1),
        }, true)

        -- Utility:New("UIGradient", {
        --     Enabled = true,
        --     Rotation = 0,
        --     Parent = WatermarkBackground,
        --     Transparency = NumberSequence.new({
        --         NumberSequenceKeypoint.new(0, 0),
        --         NumberSequenceKeypoint.new(1, 1),
        --     })
        -- })

        Library:New("UIPadding", {
            Parent = WatermarkBackground,
            PaddingBottom = UDimnew(0, 3),
            PaddingLeft = UDimnew(0, 3),
            PaddingRight = UDimnew(0, 3),
            PaddingTop = UDimnew(0, 5),
        })

        Library:AddTheme(WatermarkAccent, {
            BackgroundColor3 = "Accent",
        })

        Library:AddTheme(WatermarkBackground, {
            BorderColor3 = "Outline",
            BackgroundColor3 = "Element Background",
        })

        -- Library:AddTheme(ToggleBackground, {
        --     BackgroundColor3 = "Element Background"
        -- })

        Library:New("UIGradient", {
            Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3fromRGB(124, 124, 124))},
            Rotation = 90,
            Parent = WatermarkBackground,
        })

        Library:AddTheme(WatermarkLabel, {
            TextColor3 = "Text",
        })

        function Watermark.Think()
            local ClockPulse = osclock()

            if ClockPulse - Watermark.Time < Watermark.TickRate then
                return
            end

            Watermark.Time = ClockPulse

            if WatermarkBackground.Visible ~= Watermark.Visible then
                WatermarkBackground.Visible = Watermark.Visible
            end

            if Watermark.Visible then
                local Text = Library:TextTriggers(Watermark.Text)

                WatermarkLabel.Text = Text
            end
        end

        function Watermark.SetText(text)
            Watermark.Text = text
        end

        function Watermark.SetTickRate(rate)
            Watermark.TickRate = rate
        end

        function Watermark.SetVisibility(status)
            Watermark.Visible = status
        end

        return Watermark
    end 

    local Flags = Library.Flags
-- 

-- Controller
    Controller.Alive = false
    Controller.RootPart = nil
    Controller.Humanoid = nil
    Controller.Character = nil

    function Controller.Spawning(Character, Humanoid, RootPart)
        Controller.Character = Character
        Controller.Humanoid = Humanoid
        Controller.RootPart = RootPart
        Controller.Alive = true 

        if not (Controller.Character and Controller.Humanoid and Controller.RootPart) then 
            return Controller.Despawning()
        end 
    end 

    function Controller.Despawning(Value)
        if Value then return end 
        Controller.Alive = false
        Controller.Character = nil
        Controller.RootPart = nil
        Controller.Humanoid = nil
    end     

    Utility:Connect(RunService.Heartbeat, function()
        local Character = Utility:GetLocalPlayerCharacter()

        if not Character then
            if Controller.Alive then
                Controller.Despawning(false)
            end
            return
        end

        local Humanoid = Utility:GetHumanoid(Character)

        local RootPart = Utility:GetRootPart(Character, Humanoid)

        if not RootPart then
            if Controller.Alive then
                Controller.Despawning(false)
            end
            return
        end

        Controller.Spawning(Character, Humanoid, RootPart)
    end, "Controller Heartbeat")
--

-- Aimbot
    function Aimbot:SelectTarget()
        Aimbot.Targets = {}
        Aimbot.Target = nil
    
        local LocalRoot = Controller.RootPart
        
        if not Aimbot.Position then
            Aimbot.Position = Flags["aimbot_position"] == "Screen" and Camera.ViewportSize / 2 or MouseLocation
        end

        local CameraPosition = Camera.CFrame.p

        for _,v in Utility:GetPlayers() do
            if v == LocalPlayer then
                continue
            end

            local PlayerTbl = Puppyware.Players[v.Name]
            local Status = PlayerTbl and PlayerTbl.Status or "None"
            if Flags["ignore_friends"] and Status and Status == "Friend" then
                continue
            end

            if Flags["priority_only"] and Status and Status ~= "Priority" then
                continue
            end

            local Character = Utility:GetCharacter(v)
    
            if not Character then
                continue
            end

            if tablefind(Flags["aimbot_checks"], "Force-Field") and typeof(Character) == "Instance" and FindFirstChildWhichIsA(Character, "ForceField") then
                continue
            end
    
            local Humanoid = Utility:GetHumanoid(Character)
            local Health = Utility:GetHealth(v, Humanoid)
    
            if tablefind(Flags["aimbot_checks"], "Health") and Health and Health <= 0 then
                continue
            end

            local Hitbox = Utility:GetBodyPart(Character, Flags["aimbot_hitbox"])
    
            if not Hitbox then
                continue
            end
            
            local Distance = ((LocalRoot and LocalRoot.Position or Camera.CFrame.p) - Hitbox.Position).Magnitude
    
            if Flags["aimbot_limit_distance"] and Distance > Flags["aimbot_limit_distance_amount"] then
                continue
            end

            local Position, OnScreen = WorldToViewportPoint(Camera, Hitbox.Position)
    
            if Flags["aimbot_use_fov"] and not OnScreen or not Position then
                continue
            end

            --local Result = Raycast(Workspace, CameraPosition, (Hitbox.Position - CameraPosition).Unit * 1000, Utility.Blacklist)
    
            local AimbotMagnitude = (Vector2.new(Position.x, Position.y) - Aimbot.Position).Magnitude
    
            if Flags["aimbot_use_fov"] and Flags["aimbot_fov_amount"] < AimbotMagnitude then
                continue
            end
    
            table.insert(Aimbot.Targets, {
                Player = v,
                Hitbox = Hitbox,
                ScreenHitbox = Position,
                Magnitude = AimbotMagnitude,
                Character = Character,
            })
        end
    
        tablesort(Aimbot.Targets, function(a, b) 
            return a.Magnitude < b.Magnitude
        end)

        return Aimbot.Targets[1]
    end

    function Aimbot:Think(dt)
        local LocalRoot = Controller.RootPart

        if not (Flags["aimbot"] and Flags["aimbot_key"]) then
            Aimbot.Target = nil

            return
        end

        local MouseLocation = UserInputService:GetMouseLocation()

        Aimbot.Position = Flags["aimbot_position"] == "Screen" and Camera.ViewportSize / 2 or MouseLocation

        if Flags["aimbot_sticky_aim"] and not Aimbot.Target then
            Aimbot.Target = Aimbot:SelectTarget()
        end

        if not Flags["aimbot_sticky_aim"] then
            Aimbot.Target = Aimbot:SelectTarget()
        end

        if not Aimbot.Target then
            return
        end

        local SelectedTarget = Aimbot.Target

        if SelectedTarget then
            local Hitbox = SelectedTarget.Hitbox
            
            local Distance = (Hitbox.Position - (LocalRoot and LocalRoot.Position or Vector3.zero)).Magnitude

            if Hitbox then
                local PartVelocity = Utility:CalculateVelocity(Hitbox)

                local Velocity = Flags["aimbot_velocity"] and PartVelocity * (Flags["aimbot_pred"] and Stats.PerformanceStats.Ping:GetValue() / (Flags["aimbot_pred_amount"] * 10) or tonumber(Flags["aimbot_pred_box"])) or Vector3.zero

                local Position = Hitbox.Position + Velocity
                
                if Flags["aimbot_mouse"] then
                    local ScreenPosition = WorldToViewportPoint(Camera, Position)

                    mousemoverel(
                        (ScreenPosition.x - MouseLocation.x) / Flags["aimbot_smoothing"],
                        (ScreenPosition.y - MouseLocation.y) / Flags["aimbot_smoothing"]
                    )
                else
                    local EndPoint = CFramenew(Camera.CFrame.p, Position)
                    Camera.CFrame = Camera.CFrame:Lerp(EndPoint, (100 - Flags["aimbot_smoothing"]) / 100)
                end
            end
        end
    end
--

-- Silent Aim
    function SilentAim:SelectTarget()
        SilentAim.Targets = {}

        local LocalRoot = Controller.RootPart

        for _,v in Utility:GetPlayers() do
            if v == LocalPlayer then
                continue
            end

            local PlayerTbl = Puppyware.Players[v.Name]
            local Status = PlayerTbl and PlayerTbl.Status or "None"
            if Flags["ignore_friends"] and Status and Status == "Friend" then
                continue
            end

            if Flags["priority_only"] and Status and Status ~= "Priority" then
                continue
            end

            local Character = Utility:GetCharacter(v)

            if not Character then
                continue
            end

            if tablefind(Flags["silent_checks"], "Force-Field") and typeof(Character) == "Instance" and FindFirstChildWhichIsA(Character, "ForceField") then
                continue
            end

            local Humanoid = Utility:GetHumanoid(Character)
            local Health = Utility:GetHealth(v, Humanoid)

            if tablefind(Flags["silent_checks"], "Health") and Health and Health <= 0 then
                continue
            end

            local Root = Utility:GetRootPart(Character, Humanoid)

            if not Root then
                continue
            end
            
            local Distance = ((LocalRoot and LocalRoot.Position or Camera.CFrame.p) - Root.Position).Magnitude

            if Flags["silent_limit_distance"] and Distance > Flags["silent_limit_distance_amount"] then
                continue
            end

            local Hitbox = Utility:GetBodyPart(Character, Flags["silent_hitbox"])

            if not Hitbox then
                continue
            end

            local Position, OnScreen = WorldToViewportPoint(Camera, Hitbox.Position)

            if Flags["silent_use_fov"] and not OnScreen or not Position then
                continue
            end

            local SilentAimMagnitude = (Vector2.new(Position.x, Position.y) - SilentAim.Position).Magnitude

            if Flags["silent_use_fov"] and Flags["silent_fov_amount"] < SilentAimMagnitude then
                continue
            end

            table.insert(SilentAim.Targets, {
                Player = v,
                Hitbox = Hitbox,
                ScreenHitbox = Position,
                Magnitude = SilentAimMagnitude,
                Character = Character
            })
        end

        tablesort(SilentAim.Targets, function(a, b) 
            return a.Magnitude < b.Magnitude
        end)

        return SilentAim.Targets[1]
    end

    function SilentAim:Think(dt)
        SilentAim.Targets = {}

        if not (Flags["silent"] and Flags["silent_key"]) then
            SilentAim.Target = nil

            return
        end

        local MouseLocation = UserInputService:GetMouseLocation()

        SilentAim.Position = Flags["aimbot_position"] == "Screen" and Camera.ViewportSize / 2 or MouseLocation

        if Flags["silent_sticky_aim"] and not SilentAim.Target then
            SilentAim.Target = SilentAim:SelectTarget()
        end

        if not Flags["silent_sticky_aim"] then
            SilentAim.Target = SilentAim:SelectTarget()
        end

        if not SilentAim.Target then
            return
        end

        local SelectedTarget = SilentAim.Target
        
        if SelectedTarget then
            local Hitbox = SelectedTarget.Hitbox
            
            --local _, NewDesyncPos = Desync:GetPositions()

            local Origin = NewDesyncPos and NewDesyncPos.p or LocalRoot and LocalRoot.Position or Vector3.zero

            local Distance = (Hitbox.Position - Origin).Magnitude

            if Hitbox then
                local PredNum = Flags["silent_pred_table"] and Utility:GetPrediction(Stats.PerformanceStats.Ping:GetValue(), Distance) or Stats.PerformanceStats.Ping:GetValue() / (Flags["silent_pred_amount"] * 10)
                
                local PartVelocity = Utility:CalculateVelocity(Hitbox)

                local Velocity = Flags["silent_velocity"] and PartVelocity * (Flags["silent_pred"] and PredNum or tonumber(Flags["silent_pred_box"])) or Vector3.zero
            
                local Position = Hitbox.Position + Velocity
            
                SilentAim.Target = {
                    Player = SelectedTarget.Player,
                    Position = Position,
                    Hitbox = Hitbox,
                    Size = Hitbox.Size,
                    Character = SelectedTarget.Character
                }
            end
        end
    end

    function SilentAim:AutoShoot()
        if not (Flags["silent_auto_shoot"] and SilentAim.Target) then
            return
        end

        local Character = Controller.Character

        if not Character then
            return
        end

        local Tool = FindFirstChildWhichIsA(Character, "Tool")

        if not Tool then
            return
        end

        Tool:Activate()
    end
    
    Utility:Connect(RunService.RenderStepped, function(dt)
        SilentAim:Think()

        SilentAim:AutoShoot()
    end, "Silent Aim Heartbeat")
--

-- ESP
    local SkeletonLayout = {
        "Head",
        "Left Arm",
        "Right Arm",
        "Left Leg",
        "Right Leg"
    }
    local Huge = math.huge
    local extents = { Vector3new(1, 1, 1), Vector3new(1, 1, -1), Vector3new(1, -1, 1), Vector3new(1, -1, -1),
        Vector3new(-1, 1, 1), Vector3new(-1, 1, -1), Vector3new(-1, -1, 1), Vector3new(-1, -1, -1) }

    function ESP.GetBoundingBox(object)
        local cf, size = object:GetBoundingBox()
        
        local minX, minY, maxX, maxY = Huge, Huge, -Huge, -Huge
        
        local newsize = size * 0.5
        
        for exindx = 1, 6 do
            local extent = extents[exindx]
            local corner = cf * (newsize * extent)
            local screenPoint, isOnScreen = WorldToViewportPoint(Camera, corner)
            if isOnScreen then
                minX = mathmin(minX, screenPoint.X)
                minY = mathmin(minY, screenPoint.Y)
                maxX = mathmax(maxX, screenPoint.X)
                maxY = mathmax(maxY, screenPoint.Y)
            end
        end
                
        local BoxPosition = Vector2new(minX, minY)
        local BoxSize = Vector2new(maxX - minX, maxY - minY)

        return BoxPosition, BoxSize
    end

    function ESP.GetRootBounding(root)
        local upVector = Camera.CFrame.UpVector

        local topPosition = root.Position + root.CFrame:VectorToWorldSpace(Vector3new(0, 1.8, 0)) + upVector
        local bottomPosition = root.Position + root.CFrame:VectorToWorldSpace(Vector3new(0, -2.5, 0)) - upVector

        local topViewport, _ = WorldToViewportPoint(Camera, topPosition)
        local bottomViewport, _ = WorldToViewportPoint(Camera, bottomPosition)
        
        local width = mathmax(mathabs(topViewport.X - bottomViewport.X), 3)
        local height = mathmax(mathabs(bottomViewport.Y - topViewport.Y), width / 2, 3)

        local boxSize = Vector2new(mathfloor(height / 1.5), mathfloor(height))
        local boxPos = Vector2new(
            mathfloor((topViewport.X + bottomViewport.X) / 2 - boxSize.X / 2),
            mathfloor(math.min(topViewport.Y, bottomViewport.Y))
        )
        
        return boxPos, boxSize
    end

    function ESP.GetCase(text, casetype)
        casetype = casetype or Flags["esp_text_case"]

        if casetype == "UPPERCASE" then
            return text:upper()
        elseif casetype == "lowercase" then
            return text:lower()
        else
            return text
        end
    end

    function ESP.GetOverwritenColor(player)
        local PlayerTbl = Puppyware.Players[player.Name]
        local Status = PlayerTbl and PlayerTbl.Status or "None"

        local SilentTarget = SilentAim.Target
        local SilentPlayer = SilentTarget and SilentTarget.Player
        
        local AimbotTarget = Aimbot.Target 
        local AimbotPlayer = AimbotTarget and AimbotTarget.Player

        return 
            Flags["esp_highlight_targets"] and (AimbotPlayer and AimbotPlayer == player or SilentTarget and SilentTarget == player) and Flags["esp_highlight_targets_color"].c 
                or 
            Flags["esp_highlight_friends"] and Status == "Friend" and Flags["esp_highlight_friends_color"].c 
                or 
            Flags["esp_highlight_priority"] and Status == "Priority" and Flags["esp_highlight_priority_color"].c 
                or 
            nil
    end

    ESP.Holder = Utility:New("ScreenGui", {
        Name = "\0",
        Parent = CoreGui,
        DisplayOrder = -1,
        IgnoreGuiInset = true,
    })

    function ESP:AddPlayer(player)
        if ESP.Players[player] then 
            return
        end
        
        local PlayerTable = {
            Connects = {},
            Drawings = {},
            Health = 0,
            Offsets = {},
            StaticOffsets = {
                Right = 0,
                Bottom = 0
            },
            Sides = {
                Right = Vector2zero,
                Bottom = Vector2zero
            },
        }

        PlayerTable.Drawings = {}

        local Holder = Utility:New("ScreenGui", {
            Name = "\0",
            Parent = ESP.Holder,
            DisplayOrder = -1,
            IgnoreGuiInset = true,
        })

        local Drawings = PlayerTable.Drawings
        local StaticOffsets = PlayerTable.StaticOffsets
        local Sides = PlayerTable.Sides
        local Offsets = PlayerTable.Offsets

        function PlayerTable:CreateDrawings()
            Drawings.Box = Utility:New("Frame", {
                Parent = Holder,
                Visible = false,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
            })
            Drawings.BoxFill = Utility:New("Frame", {
                Parent = Drawings.Box,
                Visible = true,
                BackgroundTransparency = 1,
                Position = UDim2new(0, -1, 0, -1),
                Size = UDim2new(1, 2, 1, 2),
                BorderSizePixel = 0,
            })
            Drawings.BoxOutline = Utility:New("UIStroke", {
                Parent = Drawings.Box,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                LineJoinMode = Enum.LineJoinMode.Miter,
                Thickness = 3,
                Color = Color3fromRGB()   
            })
            Drawings.BoxInline = Utility:New("UIStroke", {
                Parent = Drawings.BoxFill,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                LineJoinMode = Enum.LineJoinMode.Miter,
                Thickness = 1,  
            })
            Drawings.BoxGradient = Utility:New("UIGradient", {
                Enabled = false,
                Rotation = 270,
                Parent = Drawings.BoxInline
            })
            Drawings.BoxFillGradient = Utility:New("UIGradient", {
                Enabled = false,
                Rotation = 270,
                Parent = Drawings.BoxFill
            })
            Drawings.Name = Utility:New("TextLabel", {
                Parent = Holder,
                Visible = false,
                AutomaticSize = Enum.AutomaticSize.XY,
                Size = UDim2new(0, 0, 0, 0),
                Position = UDim2new(0, 0, 0, 0),
                TextYAlignment = Enum.TextYAlignment.Top,
                TextStrokeTransparency = 0,
                BackgroundTransparency = 1,
                ZIndex = 2,
                RichText = true,
            })
            Drawings.HealthBarOutline = Utility:New("Frame", {
                Visible = false,
                BorderSizePixel = 0,
                Parent = Holder,
            })
            Drawings.HealthBar = Utility:New("Frame", {
                Visible = true,
                BorderSizePixel = 0,
                Parent = Drawings.HealthBarOutline,
            })
            Drawings.HealthBarGradient = Utility:New("UIGradient", {
                Enabled = false,
                Rotation = 270,
                Parent = Drawings.HealthBar
            })
            Drawings.HealthNumber = Utility:New("TextLabel", {
                Parent = Holder,
                Visible = false,
                AutomaticSize = Enum.AutomaticSize.XY,
                Size = UDim2new(0, 0, 0, 0),
                Position = UDim2new(0, 0, 0, 0),
                TextYAlignment = Enum.TextYAlignment.Top,
                TextStrokeTransparency = 0,
                BackgroundTransparency = 1,
                ZIndex = 2,
            })
            Drawings.ImageLabel = Utility:New("ImageLabel", {
                Parent = Holder,
                Visible = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 2,
            })

            -- for _,v in SkeletonLayout do
            --     Drawings[v] = Utility:New("Frame", {
            --         Visible = false,
            --         BorderSizePixel = 0,
            --         Parent = Holder,
            --         ZIndex = 1,
            --         AnchorPoint = (Vector2.one * 0.5),
            --     })
            -- end
        end

        function PlayerTable:ClearDrawings()
            Holder:Destroy()

            PlayerTable.Drawings = {}
        end

        function PlayerTable.CreateFlag(flag, text, colortbl, font, size, status, side, overwrite)
            local Position = Sides[side]

            local object = Drawings[flag]

            if not object then
                Drawings[flag] = Utility:New("TextLabel", {
                    Parent = Holder,
                    Visible = false,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    Size = UDim2new(0, 0, 0, 0),
                    Position = UDim2new(0, 0, 0, 0),
                    TextYAlignment = Enum.TextYAlignment.Top,
                    TextStrokeTransparency = 0,
                    BackgroundTransparency = 1,
                    ZIndex = 2,
                })

                object = Drawings[flag]
            end

            local OffsetFlag = flag .. side

            if not Offsets[OffsetFlag] then
                Offsets[OffsetFlag] = 1
            end

            local EndVal = status and 255 or 0

            if Offsets[OffsetFlag] ~= EndVal then
                Offsets[OffsetFlag] = Utility:Lerp(Offsets[OffsetFlag], EndVal, 0.1)
            end

            if Offsets[OffsetFlag] == 0 then
                object.Visible = false

                return
            end

            object.Visible = true

            object.Text = text

            local LerpVal = Offsets[OffsetFlag] / 255

            object.TextTransparency = 1 - (colortbl.a * LerpVal)
            object.TextColor3 = overwrite or colortbl.c
            object.FontFace = GetFontFromIndex(Fonts[font])
            object.TextSize = size
            object.Position = side == "Right" and UDim2new(0, Position.x, 0, Position.y + StaticOffsets[side]) or UDim2new(0, Position.x - object.TextBounds.x / 2, 0, Position.y + StaticOffsets[side])

            StaticOffsets[side] += (object.TextBounds.y + 2) * LerpVal
        end
        
        PlayerTable:CreateDrawings()

        tableinsert(PlayerTable.Connects, Utility:Connect(RunService.Heartbeat, function(DT)          
            if Holder.Enabled then Holder.Enabled = false end
       
            local Team = Utility:GetTeam(player)
            local LocalTeam = Utility:GetTeam(LocalPlayer)

            local TeamFlag = "_enemy"

            if player == LocalPlayer then
                TeamFlag = "_local"
            end

            if not Flags["esp_players_enabled" .. TeamFlag] then
                return
            end 

            local Character = Utility:GetCharacter(player)

            if not Character then
                PlayerTable.Health = 0

                return
            end

            local Humanoid = Utility:GetHumanoid(Character)

            local Root = Utility:GetRootPart(Character, Humanoid)

            if not Root then
                PlayerTable.Health = 0

                return
            end

            local Distance = ((Controller.Alive and Controller.RootPart.CFrame.p or Camera.CFrame.p) - Root.Position).Magnitude

            if Flags["esp_players_limit"] and Distance > Flags["esp_players_limit_amount"] then
                return
            end

            local Position, OnScreen = WorldToViewportPoint(Camera, Root.Position)

            if not (Position and OnScreen) then
                return
            end

            Holder.Enabled = true

            local Health, MaxHealth = Utility:GetHealth(player, Humanoid)

            if MaxHealth == math.huge then
                MaxHealth = 100
            end

            if Health > MaxHealth then
                MaxHealth = Health -- ????
            end

            Health = mathclamp(Health, 0, MaxHealth)

            if PlayerTable.Health ~= Health then
                PlayerTable.Health = Utility:Lerp(PlayerTable.Health, Health, Flags["esp_health_fade_speed"] / 1000)
            end

            local HealthScale = PlayerTable.Health / MaxHealth

            local AutoSizing = (Flags["esp_auto_sizing"] ~= "Simple" and IsA(Character, "Model"))

            local SizeFunction = AutoSizing and ESP.GetBoundingBox or ESP.GetRootBounding

            local BoxPosition, BoxSize = SizeFunction(AutoSizing and Character or Root)

            StaticOffsets = {
                Right = 0,
                Bottom = 0
            }

            Sides = {
                Right = BoxPosition + Vector2new(BoxSize.x + 4, -4),
                Bottom = BoxPosition + Vector2new(BoxSize.x / 2, BoxSize.y + 4)
            }

            local OverwritenColor = ESP.GetOverwritenColor(player)

            local Box = Drawings.Box
            local BoxOutline = Drawings.BoxOutline
            local BoxInline = Drawings.BoxInline
            local BoxGradient = Drawings.BoxGradient

            local BoxStatus = Flags["esp_players_box" .. TeamFlag]

            Box.Visible = BoxStatus
            if BoxStatus then
                Box.Size = UDim2offset(BoxSize.X - 2, BoxSize.Y - 2)
                Box.Position = UDim2offset(BoxPosition.X + 1, BoxPosition.Y + 1)

                BoxOutline.Transparency = 1 - Flags["esp_players_box_outline" .. TeamFlag].a
                BoxOutline.Color = Flags["esp_players_box_outline" .. TeamFlag].c

                local BoxGradientStatus = Flags["esp_players_box_gradient" .. TeamFlag]

                BoxGradient.Enabled = BoxGradientStatus

                if BoxGradientStatus then 
                    BoxInline.Color = Color3fromRGB(255, 255, 255)
                    BoxInline.Transparency = 0
                    local Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Flags["esp_players_box_gradient_from_color" .. TeamFlag].c), 
                        ColorSequenceKeypoint.new(1, Flags["esp_players_box_gradient_to_color" .. TeamFlag].c)
                    })

                    local Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1 - Flags["esp_players_box_gradient_from_color" .. TeamFlag].a),
                        NumberSequenceKeypoint.new(1, 1 - Flags["esp_players_box_gradient_to_color" .. TeamFlag].a),
                    })

                    if Flags["esp_players_box_gradient_rainbow" .. TeamFlag] then 
                        local Time = tick()
                        local HueStart = (Time / 5) % 1
                        local HueEnd = (HueStart + (Flags["esp_players_box_gradient_rainbow_speed" .. TeamFlag] / 100)) % 1 
                    
                        local ColorStart = Color3fromHSV(HueStart, 1, 1)
                        local ColorEnd = Color3fromHSV(HueEnd, 1, 1)
                    
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, ColorStart),
                            ColorSequenceKeypoint.new(1, ColorEnd)
                        })
                    end

                    BoxGradient.Color = Color 
                    BoxGradient.Transparency = Transparency 
                else
                    BoxInline.Color = OverwritenColor or Flags["esp_players_box_color" .. TeamFlag].c
                    BoxInline.Transparency = 1 - Flags["esp_players_box_color" .. TeamFlag].a
                end
            end

            local BoxFill = Drawings.BoxFill
            local BoxFillGradient = Drawings.BoxFillGradient

            if Flags["esp_players_box_fill" .. TeamFlag] then
                local BoxFillGradientStatus = Flags["esp_players_box_fill_gradient" .. TeamFlag]

                BoxFillGradient.Enabled = BoxFillGradientStatus

                if BoxFillGradientStatus then 
                    BoxFill.BackgroundColor3 = Color3fromRGB(255, 255, 255)
                    BoxFill.BackgroundTransparency = 0

                    local Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Flags["esp_players_box_fill_gradient_from_color" .. TeamFlag].c), 
                        ColorSequenceKeypoint.new(1, Flags["esp_players_box_fill_gradient_to_color" .. TeamFlag].c)
                    })

                    local Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1 - Flags["esp_players_box_fill_gradient_from_color" .. TeamFlag].a),
                        NumberSequenceKeypoint.new(1, 1 - Flags["esp_players_box_fill_gradient_to_color" .. TeamFlag].a),
                    })

                    if Flags["esp_players_box_fill_gradient_rainbow" .. TeamFlag] then 
                        local Time = tick()
                        local HueStart = (Time / 5) % 1
                        local HueEnd = (HueStart + (Flags["esp_players_box_fill_gradient_rainbow_speed" .. TeamFlag] / 100)) % 1 
                    
                        local ColorStart = Color3fromHSV(HueStart, 1, 1)
                        local ColorEnd = Color3fromHSV(HueEnd, 1, 1)
                    
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, ColorStart),
                            ColorSequenceKeypoint.new(1, ColorEnd)
                        })
                    end

                    BoxFillGradient.Color = Color 
                    BoxFillGradient.Transparency = Transparency 
                else
                    BoxFill.BackgroundColor3 = OverwritenColor or Flags["esp_players_box_fill_color" .. TeamFlag].c
                    BoxFill.BackgroundTransparency = 1 - Flags["esp_players_box_fill_color" .. TeamFlag].a
                end 
            end

            local ImageLabel = Drawings.ImageLabel

            local ImageId = TeamFlag == "_enemy" and ESP.EnemyImage or TeamFlag == "_team" and ESP.TeamImage or ESP.Image
            local FileType = TeamFlag == "_enemy" and ESP.EnemyFileType or TeamFlag == "_team" and ESP.TeamFileType or ESP.FileType
            local ImageStatus = Flags["esp_players_image" .. TeamFlag] and ImageId

            ImageLabel.Visible = ImageStatus and FileType

            if ImageStatus then
                ImageLabel.Size = UDim2offset(BoxSize.x, BoxSize.y)
                ImageLabel.Position = UDim2offset(BoxPosition.x, BoxPosition.y)

                if ImageLabel.Image ~= ImageId then
                    ImageLabel.Image = ImageId
                end
            end

            local Name = Drawings.Name
            
            local NameStatus = Flags["esp_players_name" .. TeamFlag]

            Name.Visible = NameStatus
            if NameStatus then
                Name.Position = UDim2offset(BoxPosition.x + BoxSize.x / 2 - Name.TextBounds.x / 2, BoxPosition.y - Name.TextBounds.y - 4)
                Name.TextColor3 = OverwritenColor or Flags["esp_players_name_color" .. TeamFlag].c
                Name.TextTransparency = 1 - Flags["esp_players_name_color" .. TeamFlag].a
                Name.Text = ESP.GetCase(Utility:GetStyleName(player):sub(0, Flags["esp_players_name_max" .. TeamFlag]), Flags["esp_players_name_case" .. TeamFlag])
                Name.FontFace = GetFontFromIndex(Fonts[Flags["esp_players_name_font" .. TeamFlag]])
                Name.TextSize = Flags["esp_players_name_size" .. TeamFlag]
            end

            local FoundTool = Utility:GetToolName(player, Character)

            local ToolStatus = Flags["esp_players_tool" .. TeamFlag] and FoundTool

            PlayerTable.CreateFlag(
                "Tool", 
                ESP.GetCase(FoundTool or "", Flags["esp_players_tool_case" .. TeamFlag]):sub(0, Flags["esp_players_tool_max" .. TeamFlag]), 
                Flags["esp_players_tool_color" .. TeamFlag], 
                Flags["esp_players_tool_font" .. TeamFlag], 
                Flags["esp_players_tool_size" .. TeamFlag], 
                ToolStatus, 
                "Bottom",
                OverwritenColor
            )

            local DistanceStatus = Flags["esp_players_distance" .. TeamFlag]

            PlayerTable.CreateFlag(
                "Distance", 
                ESP.GetCase(tostring(mathfloor(Distance)) .. " ST", Flags["esp_players_distance_case" .. TeamFlag]), 
                Flags["esp_players_distance_color" .. TeamFlag], 
                Flags["esp_players_distance_font" .. TeamFlag], 
                Flags["esp_players_distance_size" .. TeamFlag], 
                DistanceStatus, 
                "Bottom",
                OverwritenColor
            )

            local HealthNumber = Drawings.HealthNumber
            local HealthBarOutline = Drawings.HealthBarOutline
            local HealthBar = Drawings.HealthBar
            local HealthBarGradient = Drawings.HealthBarGradient

            local HealthBarStatus = Flags["esp_players_health_bar" .. TeamFlag]
            local HealthBarSize = Flags["esp_players_health_bar_size" .. TeamFlag] + 2

            HealthBarOutline.Visible = HealthBarStatus

            if HealthBarStatus then
                HealthBarOutline.Size = UDim2offset(HealthBarSize, BoxSize.y + 4)
                HealthBarOutline.Position = UDim2offset(BoxPosition.x - 4 - HealthBarSize, BoxPosition.y - 2)
                HealthBarOutline.BackgroundColor3 = Flags["esp_players_health_bar_outline" .. TeamFlag].c
                HealthBarOutline.BackgroundTransparency = 1 - Flags["esp_players_health_bar_outline" .. TeamFlag].a

                local HealthScaleSize = (HealthBarOutline.AbsoluteSize.y - 2) * HealthScale

                HealthBar.Size = UDim2new(1, -2, 0, HealthScaleSize)
                HealthBar.Position = UDim2new(0, 1, 1, -(HealthScaleSize + 1))

                local HealthBarGradientStatus = Flags["esp_players_health_bar_gradient" .. TeamFlag]

                HealthBarGradient.Enabled = HealthBarGradientStatus

                if HealthBarGradientStatus then 
                    HealthBar.BackgroundColor3 = Color3fromRGB(255, 255, 255)
                    HealthBar.BackgroundTransparency = 0

                    local Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Flags["esp_players_health_bar_gradient_from_color" .. TeamFlag].c), 
                        ColorSequenceKeypoint.new(1, Flags["esp_players_health_bar_gradient_to_color" .. TeamFlag].c)
                    })

                    local Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1 - Flags["esp_players_health_bar_gradient_from_color" .. TeamFlag].a),
                        NumberSequenceKeypoint.new(1, 1 - Flags["esp_players_health_bar_gradient_to_color" .. TeamFlag].a),
                    })

                    if Flags["esp_players_health_bar_gradient_rainbow" .. TeamFlag] then 
                        local Time = tick()
                        local HueStart = (Time / 5) % 1
                        local HueEnd = (HueStart + (Flags["esp_players_health_bar_gradient_rainbow_speed" .. TeamFlag] / 100)) % 1 
                    
                        local ColorStart = Color3fromHSV(HueStart, 1, 1)
                        local ColorEnd = Color3fromHSV(HueEnd, 1, 1)
                    
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, ColorStart),
                            ColorSequenceKeypoint.new(1, ColorEnd)
                        })
                    end

                    HealthBarGradient.Color = Color 
                    HealthBarGradient.Transparency = Transparency 
                else
                    HealthBar.BackgroundColor3 = OverwritenColor or Flags["esp_players_health_bar_color" .. TeamFlag].c
                    HealthBar.BackgroundTransparency = 1 - Flags["esp_players_health_bar_color" .. TeamFlag].a
                end 
            end

            local HealthNumberStatus = Flags["esp_players_health_number" .. TeamFlag] and PlayerTable.Health <= MaxHealth - 10

            HealthNumber.Visible = HealthNumberStatus

            if HealthNumberStatus then
                local HealthScaleSize = (HealthBarOutline.AbsoluteSize.y - 2) * HealthScale

                local FollowHealthBar = Flags["esp_players_health_number_follow" .. TeamFlag]

                local HealthPosition = UDim2offset(BoxPosition.x - (HealthBarStatus and not FollowHealthBar and HealthBarOutline.Size.X.Offset + 4 or 4) - HealthNumber.TextBounds.x, BoxPosition.y - 6)

                if FollowHealthBar and HealthBarStatus then
                    HealthPosition = UDim2offset(BoxPosition.x - 4 - HealthBarSize / 2 - HealthNumber.TextBounds.x / 2, (BoxPosition.y + BoxSize.y) - HealthScaleSize - HealthNumber.TextBounds.y / 2)
                end

                HealthNumber.Position = HealthPosition
                HealthNumber.TextColor3 = OverwritenColor or Flags["esp_players_health_number_color" .. TeamFlag].c
                HealthNumber.TextTransparency = 1 - Flags["esp_players_health_number_color" .. TeamFlag].a
                HealthNumber.Text = tostring(mathfloor(PlayerTable.Health))
                HealthNumber.FontFace = GetFontFromIndex(Fonts[Flags["esp_players_health_number_font" .. TeamFlag]])
                HealthNumber.TextSize = Flags["esp_players_health_number_size" .. TeamFlag]
            end

            local ForceFieldStatus = Flags["esp_players_force" .. TeamFlag] and typeof(Character) == "Instance" and FindFirstChildWhichIsA(Character, "ForceField")

            PlayerTable.CreateFlag(
                "Force Field", 
                ESP.GetCase("Force-Field", Flags["esp_players_force_case" .. TeamFlag]), 
                Flags["esp_players_force_color" .. TeamFlag], 
                Flags["esp_players_force_font" .. TeamFlag], 
                Flags["esp_players_force_size" .. TeamFlag], 
                ForceFieldStatus, 
                "Right",
                OverwritenColor
            )

            local TargetStatus = Flags["esp_players_target" .. TeamFlag] and (SilentAim.Target and SilentAim.Target.Player and SilentAim.Target.Player == player or Aimbot.Target and Aimbot.Target.Player and Aimbot.Target.Player == player)

            PlayerTable.CreateFlag(
                "Target", 
                ESP.GetCase("Target", Flags["esp_players_target_case" .. TeamFlag]), 
                Flags["esp_players_target_color" .. TeamFlag], 
                Flags["esp_players_target_font" .. TeamFlag], 
                Flags["esp_players_target_size" .. TeamFlag], 
                TargetStatus, 
                "Right",
                OverwritenColor
            )

            -- local BonesStatus = Flags["esp_players_bones" .. TeamFlag]

            -- for _,v in SkeletonLayout do
            --     local Object = Drawings[v]
                
            --     if Object then
            --         Object.Visible = BonesStatus
            --     end
            -- end

            -- if BonesStatus then
            --     for _,v in SkeletonLayout do
            --         local Part = Utility:GetPart(Character, v)
                    
            --         local Object = Drawings[v]

            --         if not Part then
            --             if Object then
            --                 Object.Visible = false
            --             end

            --             continue
            --         end

            --         local BonePosition, BoneOnScreen = WorldToViewportPoint(Camera, Part.Position)

            --         if not (BonePosition and BoneOnScreen) then
            --             if Object then
            --                 Object.Visible = false
            --             end

            --             continue
            --         end

            --         if not Object then
            --             continue
            --         end

            --         local From = Vector2new(Position.x, Position.y)
            --         local To = Vector2new(BonePosition.x, BonePosition.y)
            --         local Direction = (To - From)
            --         local Center = (To + From) / 2
            --         local Distance = Direction.Magnitude
            --         local Theta = mathdeg(mathatan2(Direction.Y, Direction.X))

            --         Object.Visible = true
            --         Object.Position = UDim2offset(Center.X, Center.Y)
            --         Object.Rotation = Theta
            --         Object.Size = UDim2offset(Distance, 1)
            --         Object.BackgroundColor3 = OverwritenColor or Flags["esp_players_bones_color" .. TeamFlag].c
            --         Object.BackgroundTransparency = 1 - Flags["esp_players_bones_color" .. TeamFlag].a
            --     end                
            -- end
        end, "ESP Player Heartbeat"))

        ESP.Players[player] = PlayerTable
    end

    function ESP:RemovePlayer(player)
        if not ESP.Players[player] then
            return
        end

        local Player = ESP.Players[player]

        Player:ClearDrawings()

        for _,v in Player.Connects do
            v:Disconnect()
        end

        ESP.Players[player] = nil
    end

    Utility:Connect(Players.PlayerRemoving, function(player)
        ESP:RemovePlayer(player)
    end, "ESP Player Removing")

    Utility:Connect(RunService.Heartbeat, function()
        for _,v in Utility:GetPlayers() do
            if not ESP.Players[v] then 
                ESP:AddPlayer(v)
            end
        end
    end, "ESP Extra Heartbeat") 
--

-- Visuals
    local Sky = FindFirstChildWhichIsA(Lighting, "Sky")
    if not Sky then
        Sky = Utility:New("Sky", {
            Parent = Lighting
        })
    end

    function Visuals:UpdateWorldVisuals()
        -- Clock Time
            if Flags["world_clock_time"] then
                Lighting.ClockTime = Flags["world_clock_time_amount"]
            end
        --

        -- Ambience Changer
            if Flags["world_ambience"] then
                Lighting.OutdoorAmbient = Flags["world_ambience_outside"].c
                Lighting.Ambient = Flags["world_ambience_inside"].c
            end
        --

        -- Brightness Changer
            if Flags["world_brightness"] then
                Lighting.Brightness = Flags["world_brightness_amount"] / 100
            end
        --

        -- Fog Changer
            if Flags["world_fog"] then
                Lighting.FogColor = Flags["world_fog_color"].c
                Lighting.FogStart = Flags["world_fog_start"]
                Lighting.FogEnd = Flags["world_fog_end"]
            end
        --

        -- Skybox Changer
            local SkyboxType = Flags["world_skybox_changer"]
            local Skyboxes = Visuals.Skyboxes
            local Sky = FindFirstChildWhichIsA(Lighting, "Sky")

            if Sky and Flags["world_stars_count"] then
                Sky.StarCount = Flags["world_stars_count_amount"]
            end

            if SkyboxType ~= "Off" and Skyboxes and Skyboxes[SkyboxType] then
                if Sky then
                    for _,v in Skyboxes[SkyboxType] do
                        if Sky[_] ~= v then
                            Sky[_] = v
                        end
                    end
                else
                    Utility:New("Sky", {
                        Parent = Lighting
                    })
                end                
            end
        --
    end

    local Faces = {"Front", "Back", "Bottom", "Top", "Right", "Left"}
    local Cache = {}
    function Visuals:CreateTexture(part, id)
        local Objects = {}

        for _,v in Faces do
            Objects[v] = Utility:New("Texture", {
                ZIndex = 9e9,
                Name = "\0",
                Face = Enum.NormalId[v],
                Color3 = part.Color,
                Transparency = part.Transparency,
                Texture = id
            })
        end

        return Objects
    end

    function Visuals:TextureChange()
        for _,v in workspace:GetDescendants() do
            if IsA(v, "BasePart") or IsA(v, "Part") or IsA(v, "MeshPart") then
                local PartMaterial = v.Material.Name
                local FoundId = Visuals.PartMaterials.Minecraft[PartMaterial]
                
                if FoundId then
                    Cache[v] = PartMaterial 

                    Visuals:CreateTexture(v, FoundId)

                    v.Material = "SmoothPlastic"
                end
            end
        end
    end

    function Visuals:LinePosition(index, position, size, gap)
        local FromVector2, ToVector2 = Vector2zero, Vector2zero
        if index == 1 then
            FromVector2 = Vector2new(position.x - size - gap, position.y - size - gap)
            ToVector2 = Vector2new(position.x - gap, position.y - gap)
        elseif index == 2 then
            FromVector2 = Vector2new(position.x - size - gap, position.y + size + gap)
            ToVector2 = Vector2new(position.x - gap, position.y + gap)
        elseif index == 3 then
            FromVector2 = Vector2new(position.x + size + gap, position.y + size + gap)
            ToVector2 = Vector2new(position.x + gap, position.y + gap)
        elseif index == 4 then
            FromVector2 = Vector2new(position.x + size + gap, position.y - size - gap)
            ToVector2 = Vector2new(position.x + gap, position.y - gap)
        end
    
        return FromVector2, ToVector2
    end

    function Visuals:NewHitmarker(Cfg)
        Cfg = {
            Position = Cfg.Position or Vector3new(1, 1, 1),
            Time = Cfg.Time or 3,
        }
    
        local Hitmarker = {
            ["Objects"] = {},
            ["StartTick"] = osclock(),
        }
    
        for i = 1, 4 do
            Hitmarker.Objects[#Hitmarker.Objects + 1] = Utility:New("Frame", {
                Visible = false,
                BorderSizePixel = 1,
                Parent = ESP.Holder,
                ZIndex = 1,
                AnchorPoint = (Vector2.one * 0.5),
            })
    
        end
    
        local Objects = Hitmarker.Objects
    
        local Connection = Utility:Connect(RunService.Heartbeat, function()
            local Position, OnScreen = Camera:WorldToViewportPoint(Cfg.Position)
            local Vector2Position = Vector2new(Position.x, Position.y)
    
            local HitmarkerSize = Flags["hitmarker_size"]
            local HitmarkerGap = Flags["hitmarker_gap"]
            local HitmarkerColor = Flags["hitmarker_color"]
            local HitmarkerOutlineColor = Flags["hitmarker_outline"]

            for idx, Object in Objects do
                Object.Visible = Position and OnScreen

                if Object.Visible then
                    local FromPosition, ToPosition = Visuals:LinePosition(idx, Position, HitmarkerSize, HitmarkerGap)
    
                    Object.BackgroundColor3 = HitmarkerColor.c
                    Object.BorderColor3 = HitmarkerOutlineColor.c
                    Object.BackgroundTransparency = 1 - HitmarkerColor.a

                    Utility:Line(Object, FromPosition, ToPosition)
                end
            end
    
            if osclock() - Hitmarker.StartTick > Cfg.Time then
                Hitmarker:Remove()
                table.remove(Visuals.Hits, _)
            end
        end)

        Hitmarker.Connection = Connection
    
        function Hitmarker:Remove()
            for _,v in next, Hitmarker.Objects do
                v:Destroy()
            end
    
            Hitmarker.Connection:Disconnect()
        end
    
        Visuals.Hits[#Visuals.Hits + 1] = Hitmarker
    end

    local FovAmount = 0
    function Visuals:UpdateCameraVisuals()
        -- Third Person
            -- if Flags["camera_tp"] and Flags["camera_tp_key"] then
            --     Camera.CFrame *= CFramenew(Vector3new(Flags["camera_tp_x"], Flags["camera_tp_y"], Flags["camera_tp_z"]))
            -- end
        --

        -- Camera FOV Changer
            if Flags["camera_fov_zoom"] and Flags["camera_fov_zoom_key"] or Flags["camera_fov"] then
                FovAmount = Utility:Lerp(FovAmount, Flags["camera_fov_zoom"] and Flags["camera_fov_zoom_key"] and Flags["camera_fov_zoom_amount"] or Flags["camera_fov_amount"])

                Camera.FieldOfView = FovAmount
            end
        --

        -- Aspect Ratio
            if Flags["camera_as"] then
                local X, Y, Z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = Camera.CFrame:GetComponents()
                Camera.CFrame = CFramenew(X, Y, Z, R00 * Library.Flags["camera_as_hor"] / 100, R01 * Library.Flags["camera_as_ver"] / 100, R02, R10, R11 * Library.Flags["camera_as_ver"] / 100, R12, R20 * Library.Flags["camera_as_hor"] / 100, R21 * Library.Flags["camera_as_ver"] / 100, R22)
            end
        -- 

        -- Desync Offset Removed
            if not Flags["desync_hook"] then
                Desync:RemoveOffset()
            end
        --
    end

    function Visuals:ApplyChams(part, material, color, transparency, reflectance)
        material = Visuals.Materials[material]

        local SpecialMesh = FindFirstChildWhichIsA(part, "SpecialMesh")

        if SpecialMesh then
            SpecialMesh.TextureId = "rbxassetid://0"
            SpecialMesh.VertexColor = Vector3.new(color.R, color.G, color.B)
        end

        local MeshPart = FindFirstChildWhichIsA(part, "MeshPart")
        if MeshPart then
            MeshPart.TextureId = "rbxassetid://0"
            MeshPart.VertexColor = Vector3.new(color.R, color.G, color.B)
        end

        if part.ClassName == "UnionOperation" then
            part.UsePartColor = true
        end

        local SurfaceAppearance = FindFirstChildWhichIsA(part, "SurfaceAppearance")
        if SurfaceAppearance then
            SurfaceAppearance:Destroy()
        end

        local Decal = FindFirstChildWhichIsA(part, "Decal")
        if Decal then
            Decal:Destroy()
        end

        if IsA(part, "MeshPart") then
            part.TextureID = "rbxassetid://0"
        end

        part.Color = color
        part.Material = material
        part.Transparency = transparency - 0.01
        part.Reflectance = reflectance / 50
	end

    Utility:Connect(Lighting.Changed, function()
        Visuals:UpdateWorldVisuals()
    end, "Lighting Changed")

    Utility:BindToRenderStep("Camera Visuals", Enum.RenderPriority.Camera.Value + 1, function(dt)
        Visuals:UpdateCameraVisuals()
    end)
--

-- Misc
    local SpeedDirection = Vector3zero
    local StrafeAngle = -0.1
    local CFramePart = Utility:New("Part", {
        CanCollide = false,
        Anchored = true,
        CFrame = CFramenew(-9e9, -9e9, -9e9),
        Parent = workspace,
        Material = Enum.Material.ForceField,
        Color = Color3fromRGB(0, 179, 255)
    })

    local CFrameLine = Utility:New("Frame", {
        Visible = false,
        BorderSizePixel = 0,
        Parent = ESP.Holder,
        ZIndex = 1,
        AnchorPoint = (Vector2.one * 0.5),
    })

    function Misc:MovementFeatures(dt)
        local Character = Controller.Character
        local Humanoid =  Controller.Humanoid
        local Root = Controller.RootPart

        if not (Character and Root) then
            return
        end

        local OldCFrame, NewCFrame = Desync:GetPositions()
        local DesyncPositions = Desync.Positions

        local Looking = Camera.CFrame.lookVector

        if Flags["movement_speed_hack"] and Flags["movement_speed_hack_key"] then
            local Travel = Vector3zero

            if Flags["movement_circle_strafe"] and Flags["movement_circle_strafe_key"] then
                if SpeedDirection.x ~= SpeedDirection.x then 
                    SpeedDirection = Vector3new(Looking.x, 0, Looking.y)
                end

                Travel = SpeedDirection
                StrafeAngle = -0.1
                
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    StrafeAngle = 0.1
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    StrafeAngle = -0.1
                end

                local Vec = Vector2new(SpeedDirection.x, SpeedDirection.z)
                Vec = Utility:GetRotate(Vec, StrafeAngle)                
                SpeedDirection = Vector3new(Vec.x, 0, Vec.y)
            else
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    Travel += Vector3new(Looking.x, 0, Looking.Z)
                end

                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    Travel -= Vector3new(Looking.x, 0, Looking.Z)
                end
                
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    Travel += Vector3new(-Looking.Z, 0, Looking.x)
                end

                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    Travel += Vector3new(Looking.Z, 0, -Looking.x)
                end

                --Travel = Travel.Unit

                --local Factor = _Speedhack.Bypass and mathclamp((0.2 + 0.8 * math.abs(mathsin(tick() * 2))) * Flags["movement_speed_hack_factor"], 25, 5^12) or Flags["movement_speed_hack_factor"]

                --local NewDirection = Vector3new(Travel.X, 0, Travel.Z)

                SpeedDirection = Vector3new(Travel.X, 0, Travel.Z).Unit

                StrafeAngle = -0.1


                --[[if Travel.Unit.X == Travel.Unit.X then
                    Root.Velocity = NewDirection     
                end]]--
            end

            Travel = SpeedDirection

            if Flags["movement_avoid_collisions"] then
                local OrigPosition = OldCFrame and OldCFrame.p or Root.CFrame.p
                if Flags["movement_circle_strafe"] and Flags["movement_circle_strafe_key"] then
                    local Scale = Flags["movement_avoid_collisions_factor"] / 1000

                    local Result = Raycast(Workspace, OrigPosition, Travel * Flags["movement_speed_hack_factor"] * Scale, Utility.Blacklist)
                                        
                    if Result then
                        for i = -10, 10 do
                            local Vec = Vector2new(Travel.x, Travel.z)

                            Vec = Utility:GetRotate(Vec, StrafeAngle * i * -1)

                            Vec = Vector3new(Vec.x, 0, Vec.y)

                            Result = Raycast(Workspace, OrigPosition, Travel * Flags["movement_speed_hack_factor"] * Scale, Utility.Blacklist)

                            if not Result then
                                Travel = Vec
                            end
                        end
                    end
                elseif Flags["movement_avoid_collisions_standalone"] then
                    for _ = 1, 10 do
                        local Result = Raycast(Workspace,OrigPosition, (Travel * Flags["movement_speed_hack_factor"] / 10) + Vector3new(0, Root.Velocity.y / 10, 0), Utility.Blacklist)

                        local Normal = Result and Result.Normal or Vector3zero
                        local Position = Result and Result.Position or OrigPosition

                        if Result then
                            local Dot = Normal.Unit:Dot((Root.CFrame.p - Position).Unit)

                            if Dot > 0 then
                                Travel += Normal.Unit * Dot

                                Travel = Travel.Unit

                                if Travel.x == Travel.x then
                                    StrafeAngle = Travel
                                end
                            end
                        end
                    end
                end
            end

            if Travel.x == Travel.x then
                if Flags["movement_speed_hack_type"] == "Velocity" then
                    Root.Velocity = Vector3new(Travel.x *  Flags["movement_speed_hack_factor"], Root.Velocity.y, Travel.z *  Flags["movement_speed_hack_factor"])
                else
                    if OldCFrame then
                        DesyncPositions.Old += Vector3new(Travel.x * Flags["movement_speed_hack_factor"] * dt, 0, Travel.z *  Flags["movement_speed_hack_factor"] * dt)
                    else
                        Root.CFrame += Vector3new(Travel.x * Flags["movement_speed_hack_factor"] * dt, 0, Travel.z *  Flags["movement_speed_hack_factor"] * dt)
                    end
                end
            end
        end

        if Flags["movement_auto_jump"] and Flags["movement_auto_jump_key"] and Humanoid then
            Humanoid.Jump = true
        end

        if Flags["movement_fly_hack"] and Flags["movement_fly_hack_key"] then
            local Travel = Vector3zero

            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                Travel += Looking
            end

            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                Travel -= Looking
            end

            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                Travel += Vector3new(-Looking.Z, 0, Looking.x)
            end

            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                Travel += Vector3new(Looking.Z, 0, -Looking.x)
            end

            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                Travel += Vector3new(0, 1, 0)
            end

            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                Travel -= Vector3new(0, 1, 0)
            end

            if Travel.Unit.X == Travel.Unit.X then
                if Flags["movement_fly_hack_type"] == "Velocity" then
                    Root.Velocity = Travel.Unit * Flags["movement_fly_hack_factor"]
                    Root.Anchored = false
                else
                    Root.Velocity = Vector3zero

                    if OldCFrame then
                        DesyncPositions.Old += Travel.Unit * Flags["movement_fly_hack_factor"] * dt
                    else
                        Root.CFrame += Travel.Unit * Flags["movement_fly_hack_factor"] * dt
                    end

                    Root.Anchored = false
                end
            else
                Root.Velocity = Vector3zero
                Root.Anchored = true
            end
        else
            Root.Anchored = false
        end
        
        if Flags["velocity"] and Flags["velocity_key"] then
            if game.PlaceId == 5104202731 then
                local Car = Utility:GetPlayerCar(LocalPlayer)

                if Car then
                    local Part = Car.Body.DownforceR
                    local PartF = Car.Body.DownforceF

                    local OldVelocity = Part.Velocity
                    local OldVelocityF = PartF.Velocity

                    Part.Velocity = Vector3new(Flags["velocity_factor"], 0, Flags["velocity_factor"])
                    PartF.Velocity = Vector3new(Flags["velocity_factor"], 0, Flags["velocity_factor"])

                    RunService.RenderStepped:Wait()        
        
                    Part.Velocity = OldVelocity
                    PartF.Velocity = OldVelocityF
                end
            else
                local OldVelocity = Root.Velocity
                
                Root.Velocity = Vector3new(Flags["velocity_factor"], Flags["velocity_factor"], Flags["velocity_factor"])

                RunService.RenderStepped:Wait()        

                Root.Velocity = OldVelocity
            end
        end
    end

    function Misc:RandomMessages(message, items, min, max)
		message = message or ""

		if max > 0 then
			for i = 1, mathrandom(min, max) do
				local RandomMessage = items[mathrandom(1, #items)]

				message = message .. RandomMessage .. " "
			end
		end

		return message
	end

    function Misc:GetChatSpamMessage()
        local Message = ""
        local ChosenType = Flags["chat_spam_type"]
        local CustomDirectory = Library.Folder .. "/Chat-Spam.txt"
        local TypeTable = ChosenType == "Custom" and isfile(CustomDirectory) and readfile(CustomDirectory):split("\n") or Misc.ChatSpam[ChosenType]

        for i = 1, Flags["chat_spam_repeat"] and mathrandom(Flags["chat_spam_repeat_min"], Flags["chat_spam_repeat_max"]) or 1 do
            local RepeatedMessage = ""

            -- Emojis
                if Flags["chat_spam_emojis"] then
                    RepeatedMessage = Misc:RandomMessages(RepeatedMessage, Misc.Emojis, Flags["chat_spam_emojis_min"], Flags["chat_spam_emojis_max"])
                end
            --

            -- Symbols
                if Flags["chat_spam_symbols"] then
                    RepeatedMessage = Misc:RandomMessages(RepeatedMessage, Misc.Symbols, Flags["chat_spam_symbols_min"], Flags["chat_spam_symbols_max"])
                end
            --

            -- Message
                RepeatedMessage = Misc:RandomMessages(RepeatedMessage, TypeTable, 1, 1)
            --

            -- Symbols
                if Flags["chat_spam_symbols"] then
                    RepeatedMessage = Misc:RandomMessages(RepeatedMessage, Misc.Symbols, Flags["chat_spam_symbols_min"], Flags["chat_spam_symbols_max"])
                end
            --

            -- Emojis
                if Flags["chat_spam_emojis"] then
                    RepeatedMessage = Misc:RandomMessages(RepeatedMessage, Misc.Emojis, Flags["chat_spam_emojis_min"], Flags["chat_spam_emojis_max"])
                end
            --

            Message = Message .. " " .. RepeatedMessage
        end

        return Message
    end

    function Misc:NoSlow()
        if not Flags["no_slow"] then
            return
        end

        local Character = Controller.Character

        if not Character then
            return
        end

        local BodyEffects = FindFirstChild(Character, "BodyEffects")

        if not BodyEffects then
            return
        end

        local Reload = FindFirstChild(BodyEffects, "Reload")
        if Reload then
            Reload.Value = false
        end

        local Movement = FindFirstChild(BodyEffects, "Movement")

        if Movement then
            local SlowDowns = 
                FindFirstChild(Movement, "NoJumping") or 
                FindFirstChild(Movement, "NoWalkSpeed") or 
                FindFirstChild(Movement, "ReduceWalk")

            if SlowDowns then SlowDowns:Destroy() end
        end
    end

    -- Hit Detection
        function Misc:ClosestPlayerRange(position, maxradius)
            local Radius = maxradius
            local ClosestPlayer
            local HealthRemaining = 0

            for plr, health in Misc.CurrentHealth do
                local Character = Utility:GetCharacter(plr)
    
                if not Character then
                    continue
                end

                local Humanoid = Utility:GetHumanoid(Character)

                if not Humanoid then
                    continue
                end

                local HumanoidRootPart = Utility:GetRootPart(Character, Humanoid)

                if not HumanoidRootPart then
                    continue
                end

                local Distance = (position - HumanoidRootPart.Position).Magnitude
                local CurrentHealth = Utility:GetHealth(plr, Humanoid)
                if (Distance < Radius) and (CurrentHealth < health) then
                    Radius = Distance
                    ClosestPlayer = plr
                    HealthRemaining = CurrentHealth
                end
            end

            return ClosestPlayer, HealthRemaining
        end

        function Misc:HitDetection()
            local Character = Controller.Character

            if not Character then
                return
            end

            local Ignored = FindFirstChild(workspace, "Ignored")

            if not Ignored then
                return
            end

            local Siren = FindFirstChild(Ignored, "Siren")

            if not Siren then
                return
            end

            local Radius = FindFirstChild(Siren, "Radius")

            if not Radius then
                return
            end

            local Tool = FindFirstChildWhichIsA(Character, "Tool")

            if not Tool then
                return
            end
            
            local CurrentGun = {}

            for _,v in Tool:GetChildren() do
                if v.Name:lower():find("ammo") and not v.Name:lower():find("max") then
                    CurrentGun.Tool = Tool
                    CurrentGun.IsGunEquipped = true
                    CurrentGun.Ammo = v

                    break
                end
            end

            if CurrentGun and CurrentGun.IsGunEquipped and CurrentGun.Tool then
                if CurrentGun.Tool ~= Misc.Gun.PreviousGun then
                    Misc.Gun.PreviousGun = CurrentGun.Tool
                    Misc.Gun.PreviousAmmo = 999

                    for _,v in Misc.GunConnections do
                        v:Disconnect()
                    end

                    Misc.GunConnections = {}
                end

                if not Misc.GunConnections["GunAmmoChanged"] then
                    Misc.GunConnections["GunAmmoChanged"] = Utility:Connect(CurrentGun.Ammo:GetPropertyChangedSignal("Value"), function()
                        if CurrentGun.Ammo.Value == 0 and Flags["auto_reload"] then
                            local Game = Games[PlaceId] or {
                                Arg = "UpdateMousePosI", Remote = "MainEvent"
                            }
                            local MainEvent = FindFirstChild(ReplicatedStorage, Game.Remote)
                
                            if MainEvent then
                                MainEvent:FireServer("Reload", CurrentGun.Tool)
                            end
                        end

                        local NewAmmo = CurrentGun.Ammo.Value
                        if NewAmmo < Misc.Gun.PreviousAmmo then
                            local ChildAdded
                            local ChildrenAdded = 0
                            ChildAdded = Utility:Connect(Radius.ChildAdded, function(Object)
                                if Object and Object.Name == "BULLET_RAYS" then
                                    ChildrenAdded += 1
                                    if tablefind(Misc.Gun.Shotguns, CurrentGun.Tool.Name) and ChildrenAdded <= 5 or ChildrenAdded == 1 then
                                        local GunBeam = Object:WaitForChild("GunBeam")
                                        local StartPos, EndPos = Object.Position, GunBeam.Attachment1.WorldPosition

                                        if Flags["world_bullet_tracers"] then
                                            Utility:CreateBulletTracer(StartPos, EndPos, Flags["world_bullet_tracers_color"].c, 1 - Flags["world_bullet_tracers_color"].a, Flags["world_bullet_tracers_time"], Flags["world_bullet_tracers_type"])
                                        end

                                        if Flags["world_hit_impact"] then
                                            local Impact = Utility:New("Part", {
                                                Anchored = true,
												CanCollide = false,
												Parent = workspace,
												Material = "Neon",
												Shape = Enum.PartType.Block,
												Transparency = 1 - Flags["world_hit_impact_color"].a,
												Color = Flags["world_hit_impact_color"].c,
												Size = Vector3new(Flags["world_hit_impact_size"], Flags["world_hit_impact_size"], Flags["world_hit_impact_size"]),
												CFrame = CFramenew(EndPos),
                                            })
                                            
                                            Debris:AddItem(Impact, Flags["world_hit_impact_time"])
                                        end

                                        local Player, HealthRemaining = Misc:ClosestPlayerRange(EndPos, 20)

                                        if Player then
                                            if Flags["hitsound"] then
                                                Utility:PlaySound(Misc.Hitsounds[Flags["hitsound_type"]], Flags["hitsound_volume"], Flags["hitsound_pitch"])
                                            end

                                            if Flags["hitlogs"] then
                                                Library:Notify({
                                                    Text = ("Hit player: %s, Health Remaining: %s"):format(Player.Name, tostring(HealthRemaining):sub(1, 5)),
                                                    Time = Flags["hitlogs_time"],
                                                })
                                            end

                                            if Flags["world_hit_chams"] then
                                                Visuals:CopyPlayerCharacter(Player, Flags["world_hit_chams_time"], Flags["world_hit_chams_color"])
                                            end

                                            if Flags["hitmarker"] then
                                                Visuals:NewHitmarker({
                                                    Position = EndPos,
                                                    Time = Flags["hitmarker_time"]
                                                })
                                            end
                                        end

                                        ChildAdded:Disconnect()
                                    end
                                else
                                    ChildAdded:Disconnect()
                                end
                            end)
                        end
                        Misc.Gun.PreviousAmmo = NewAmmo
                    end)
                end

                if not Misc.GunConnections["Activated"] then
                    Misc.GunConnections["Activated"] = Utility:Connect(CurrentGun.Tool.Activated, function()
                        if Flags["silent_remote"] then
                            local Game = Games[PlaceId] or {
                                Arg = "UpdateMousePosI", Remote = "MainEvent"
                            }
                            local MainEvent = FindFirstChild(ReplicatedStorage, Game.Remote)
                
                            if MainEvent then
                                local Target = SilentAim.Target
                
                                if Target and Target.Position then
                                    SilentAimActive = true

                                    MainEvent:FireServer("UpdateMousePosI", Target.Position)
                                end
                            end
                        end 
                    end)
                end
            end
        end
    --

    local Highlight = Utility:New("Highlight", {
        Name = "\0",
        Enabled = true,
        DepthMode = Enum.HighlightDepthMode.AlwaysOnTop,
        FillColor = Color3fromRGB(0, 0, 0),
        OutlineColor = Color3fromRGB(255, 255, 255),
        OutlineTransparency = 0.5,
        FillTransparency = 0,
        Parent = workspace
    })

    local Line = Utility:New("Frame", {
        BorderSizePixel = 0,
        Name = "\0",
        Parent = ESP.Holder,
        BorderSizePixel = 0,
        Visible = false,
        Position = UDim2new(0, 0, 0, 0),
        Size = UDim2new(0, 0, 0, 0),
        AnchorPoint = Vector2.one * 0.5
    })
    local NetworkTick = osclock()
    local Networking = false
    Utility:Connect(RunService.Heartbeat, function(dt)
        Misc:MovementFeatures(dt)

        Misc:NoSlow()

        for _,v in Utility:GetPlayers() do
            if v == LocalPlayer then
                continue
            end
    
            local Character = Utility:GetCharacter(v)
    
            if not Character then
                continue
            end
    
            local Humanoid = Utility:GetHumanoid(Character)
            local Health = Utility:GetHealth(v, Humanoid)

            Misc.CurrentHealth[v] = Health
        end

        if Flags["network_desync"] and Controller.RootPart and sethiddenproperty then
            if osclock() - NetworkTick > Flags["network_desync_delay"] then 
                NetworkTick = osclock() 
                Networking = not Networking
                sethiddenproperty(Controller.RootPart, "NetworkIsSleeping", Networking)
            end 
        end

        Misc:HitDetection()

        Aimbot:Think(dt)

        local TargetCharacter = Aimbot.Target and Aimbot.Target.Character or SilentAim.Target and SilentAim.Target.Character

        if Flags["world_highlight"] and TargetCharacter then
            Highlight.Enabled = true 
            Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            Highlight.FillColor = Flags["world_highlight_fill_color"].c
            Highlight.OutlineColor = Flags["world_highlight_outline_color"].c
            Highlight.Adornee = TargetCharacter
            Highlight.OutlineTransparency = 1 - Flags["world_highlight_outline_color"].a
            Highlight.FillTransparency = 1 - Flags["world_highlight_fill_color"].a
        else
            Highlight.Enabled = false
        end 
        
        local TargetHitbox = Aimbot.Target and Aimbot.Target.Hitbox or SilentAim.Target and SilentAim.Target.Hitbox

        if Flags["world_line"] and TargetHitbox then
            local MouseLocation = UserInputService:GetMouseLocation()
            local FromPosition = Vector2new(MouseLocation.x, MouseLocation.y)

            local ToPos, ToOnScreen = WorldToViewportPoint(Camera, TargetHitbox.Position)

            if ToPos and ToOnScreen then
                local MouseLocation = UserInputService:GetMouseLocation()
                local FromPosition = Vector2new(MouseLocation.x, MouseLocation.y)

                local ToPosition = Vector2new(ToPos.x, ToPos.y)

                local direction = (ToPosition - FromPosition)
                local center = (ToPosition + FromPosition) / 2
                local distance = direction.Magnitude
                local theta = math.deg(math.atan2(direction.Y, direction.X))
                
                Line.Position = UDim2new(0, center.X, 0, center.Y)
                Line.Rotation = theta
                Line.Size = UDim2new(0, distance, 0, 1)
                Line.BackgroundColor3 = Flags["world_line_color"].c
                Line.BackgroundTransparency = 1 - Flags["world_line_color"].a
                Line.Visible = true
            else
                Line.Visible = false
            end
        else
            Line.Visible = false
        end
    end, "Misc Heartbeat")

    taskspawn(function()
        if MainChannel then
            while taskwait(Flags["chat_spam_delay"]) do
                if Flags["chat_spam"] then
                    MainChannel:SendAsync(Misc:GetChatSpamMessage())
                end
            end
        end
    end)
--

-- Desync
    function Desync:Active()
        return (Desync.NewStatus or Flags["desync"] and Flags["desync_key"]) and Controller.RootPart
    end
    
    function Desync:SetStatus(status)
        Desync.NewStatus = status
    end

    function Desync:GetPositions()
        local Positions = Desync.Positions
        local Status = Desync:Active()

        if not Status then
            return
        end

        return Positions.Old, Positions.New
    end

    function Desync:RemoveOffset()
        local Positions = Desync.Positions
        local Status = Desync:Active()

        if not (Status and Positions.Old and Positions.New) then
            return
        end

        Camera.CFrame = Camera.CFrame - Utility:CFrameToVector3(Positions.New - Utility:CFrameToVector3(Positions.Old))
    end

    function Desync:GetLerpValue(pulse, min, max, speed)
        speed = speed or 1

        local NormalizedSin = (mathsin(pulse * speed) + 1) / 2

        return min + NormalizedSin * (max - min)
    end

    function Desync:GetValue(pos_type)
        local ClockPulse = osclock()

        local Mode = Flags["desync_mode_" .. pos_type]
        local Min = Flags["desync_min_" .. pos_type]
        local Max = Flags["desync_max_" .. pos_type]
        local Val = Flags["desync_val_" .. pos_type]

        return 
            Flags["desync_" .. pos_type] == true and 
                (Mode == "Static" and Val 
                or Mode == "Lerp" and Desync:GetLerpValue(ClockPulse, Min, Max, Flags["desync_speed_" .. pos_type])
                or Mode == "Random" and mathrandom(Min * 100, Max * 100) / 100)
            or not Flags["desync_" .. pos_type] and 0
    end

    function Desync:OverwritePosition(position)
        Desync.Overwriten = position
    end

    function Desync:RemoveOverwrite()
        Desync.Overwriten = nil
    end

    function Desync:CloneCharacter()
        local Character = Controller.Character

        if not Character then
            return
        end

        Character.Archivable = true

        local ClonedCharacter = Character:Clone()

        ClonedCharacter.Archivable = true
        ClonedCharacter.Name = "\0"
        ClonedCharacter.Parent = workspace

        Character.Archivable = false

        local Humanoid = FindFirstChildWhichIsA(ClonedCharacter, "Humanoid")
        local HumanoidRootPart = Utility:GetRootPart(ClonedCharacter, Humanoid)

        for _,v in ClonedCharacter:GetChildren() do
            if IsA(v, "Part") or IsA(v, "MeshPart") or IsA(v, "BasePart") then
                if v.Transparency ~= 1 then
                    local Color = Flags["desync_vis_color"]

                    Visuals:ApplyChams(v, Flags["desync_vis_material"], Color.c, 1 - Color.a, 0)
                end
                
                v.CanCollide = false
            else
                v:Destroy()
            end
        end

        if Humanoid then
            Humanoid:Destroy()
        end

        if HumanoidRootPart then
            HumanoidRootPart.Anchored = true
        end

        Desync.ClonedCharacter = {
            Character = ClonedCharacter,
            RootPart = HumanoidRootPart        
        }
    end

    function Desync:UpdateCharacter()
        local ClonedCharacter = Desync.ClonedCharacter

        if ClonedCharacter then
            local Character = ClonedCharacter.Character

            if Character then
                for _,v in Character:GetChildren() do
                    if IsA(v, "Part") or IsA(v, "MeshPart") or IsA(v, "BasePart") then
                        if v.Transparency ~= 1 then
                            local Color = Flags["desync_vis_color"]
        
                            Visuals:ApplyChams(v, Flags["desync_vis_material"], Color.c, 1 - Color.a, 0)
                        end
                    end
                end
            end
        end
    end

    function Desync:DestroyClonedCharacter()
        local ClonedCharacter = Desync.ClonedCharacter

        if ClonedCharacter and ClonedCharacter.Character then
            ClonedCharacter.Character:Destroy()

            Desync.ClonedCharacter = nil
        end
    end

    local Angle = 0
    function Desync:Think()
        local Root = Controller.RootPart
        local Status = Desync:Active()
        local Positions = Desync.Positions

        local ClonedCharacter = Desync.ClonedCharacter

        if not Status then
            Positions.Old = nil
            Positions.New = nil

            if ClonedCharacter then
                Desync:DestroyClonedCharacter()
            end

            return
        end

        if not Flags["desync_vis"] and ClonedCharacter then
            Desync:DestroyClonedCharacter()
        end

        if Flags["desync_vis"] and not ClonedCharacter then
            Desync:CloneCharacter()
        end

        ClonedCharacter = Desync.ClonedCharacter

        Positions.Old = Root.CFrame

        local TargetHitbox = Aimbot.Target and Aimbot.Target.Hitbox or SilentAim.Target and SilentAim.Target.Hitbox

        local StrafeCFrame = nil

        if Flags["desync_strafe"] and TargetHitbox and not (TargetHitbox.CFrame.x > 5000 or TargetHitbox.CFrame.y > 5000 or TargetHitbox.CFrame.z > 5000 or TargetHitbox.CFrame.x < -5000 or TargetHitbox.CFrame.y < -5000 or TargetHitbox.CFrame.z < -5000) then
            Angle += Flags["desync_strafe_speed"]
            
            StrafeCFrame = TargetHitbox.CFrame * CFrameAngles(0, mathrad(Angle), 0) * CFramenew(0, 0, Flags["desync_strafe_distance"])
        end

        if Desync.Overwriten then
            Root.CFrame = CFramenew(Desync.Overwriten)
        elseif StrafeCFrame then
            Root.CFrame = StrafeCFrame
        else
            local DesyncFactor = CFramenew(Vector3new(
                Desync:GetValue("x"),
                Desync:GetValue("y"),
                Desync:GetValue("z")
            ))

            DesyncFactor *= CFrameAngles(
                mathrad(Desync:GetValue("pitch")),
                mathrad(Desync:GetValue("yaw")),
                mathrad(Desync:GetValue("roll"))
            )

            Root.CFrame *= DesyncFactor
        end

        Positions.New = Root.CFrame

        if ClonedCharacter then
            ClonedCharacter.RootPart.CFrame = Positions.New
        end

        RunService.RenderStepped:Wait()

        Root.CFrame = Positions.Old
    end

    Utility:Connect(RunService.Heartbeat, function()
        Desync:Think()
    end, "Desync Heartbeat")
--

-- Hooks
    local OldIndex; OldIndex = hookmetamethod(game, "__index", newcclosure(function(self, prop)
        if not checkcaller() then
            if prop == "CFrame" then
                if Desync:Active() and Flags["desync_hook"] and self == Controller.RootPart then
                    local OldPosition = Desync:GetPositions()

                    if OldPosition then
                        return OldPosition
                    end
                end
            end

            if self == Mouse and not Flags["silent_remote"] then
                if mathrandom(1, 100) <= Flags["silent_hitchance"] then
                    local Target = SilentAim.Target

                    if Target then
                        local Position = Target.Position
                        local Hitbox = Target.Hitbox

                        local PropLower = prop:lower()

                        if PropLower == "target" and Hitbox then
                            return Hitbox
                        elseif PropLower == "hit" and Position then
                            return CFramenew(Position)
                        elseif PropLower == "unitray" then
                            return Ray.new(self.Origin, (self.Hit - self.Origin).Unit)
                        end
                    end
                end
            end
        end

        return OldIndex(self, prop)
    end))

    local OldNewIndex; OldNewIndex = hookmetamethod(game, "__newindex", newcclosure(function(self, index, value)
        if self == Camera then
            if index == "CFrame" and Flags["camera_tp"] and Flags["camera_tp_key"] then
                value *= CFramenew(Vector3new(Flags["camera_tp_x"], Flags["camera_tp_y"], Flags["camera_tp_z"]))
            end
        end

        return OldNewIndex(self, index, value)
    end))
--

-- Toggles
    Window = Library:Window({ Name = "Puppyware - beta", Watermark = true, Keybinds = true, Size = Vector2new(558, 482) })
    local CombatTab = Window:Tab({ Name = "Combat" })
    local VisualsTab = Window:Tab({ Name = "Visuals" })
    local MiscTab = Window:Tab({ Name = "Misc" })
    local PlayersTab = Window:Tab({ Name = "Players" })
    local SettingsTab = Window:Tab({ Name = "Settings" })

    local Materials = {}

    for _,v in Visuals.Materials do
        Materials[#Materials + 1] = _
    end

    local Skyboxes = {"Off"}

    for _,v in Visuals.Skyboxes do
        Skyboxes[#Skyboxes + 1] = _
    end

    local ChatSpams = {"Custom"}

    for _,v in Misc.ChatSpam do
        ChatSpams[#ChatSpams + 1] = _
    end

    local ESPFonts = {}

    for _,v in Fonts do
        ESPFonts[#ESPFonts + 1] = _
    end

    local BulletTracers = {}

    for _,v in Visuals.BulletTracers do
        BulletTracers[#BulletTracers + 1] = _
    end
    
    local Hitsounds = {}

    for _,v in Misc.Hitsounds do
        Hitsounds[#Hitsounds + 1] = _
    end

    -- Combat
        local AimAssistSec =  CombatTab:Section({Name = "Aim Assist"}) do
            local AimAssist = AimAssistSec:Toggle({Name = "Enabled", Flag = "aimbot"})
            AimAssist:Keybind({Name = "Aim Assist", Flag = "aimbot_key"})

            local FovSlider
            AimAssist:Toggle({Name = "Use Field Of View", Flag = "aimbot_use_fov", Callback = function(v)
                if FovSlider then
                    FovSlider.SetVisibility(v)
                end
            end})
            FovSlider = AimAssist:Slider({Name = "Field Of View Amount", Visible = false, Value = 60, Flag = "aimbot_fov_amount", Min = 0, Max = 360, Float = 1})
            
            AimAssist:Toggle({Name = "Use Mouse", Flag = "aimbot_mouse"})

            AimAssist:Toggle({Name = "Sticky Aim", Flag = "aimbot_sticky_aim"})

            AimAssist:Slider({Name = "Smoothing", Suffix = "%", Value = 20, Flag = "aimbot_smoothing", Min = 0, Max = 100, Float = 1})

            AimAssist:Toggle({Name = "Use Velocity", Flag = "aimbot_velocity"})

            AimAssist:Textbox({Name = "Prediction", Value = "", Flag = "aimbot_pred_box"})

            AimAssist:Toggle({Name = "Auto Prediction", Flag = "aimbot_pred"})

            AimAssistSec:Slider({Name = "Auto Prediction Factor", Value = 100, Flag = "aimbot_pred_amount", Min = 0, Max = 300, Float = 1})
            
            AimAssistSec:Dropdown({Name = "Position", Values = {"Mouse", "Screen"}, Value = "Mouse", Flag = "aimbot_position"})

            AimAssistSec:Dropdown({Name = "Hitbox", Values = {"Head", "HumanoidRootPart", "LowerTorso", "LeftUpperArm", "RightUpperArm", "LeftUpperLeg", "RightUpperLeg"}, Value = "Head", Flag = "aimbot_hitbox"})

            AimAssistSec:Dropdown({Name = "Checks", Values = {"Force-Field", "Health"}, Value = {"Health"}, Flag = "aimbot_checks", Multi = true})

            local LimitDistance
            AimAssistSec:Toggle({Name = "Limit Distance", Flag = "aimbot_limit_distance", Callback = function(v)
                if LimitDistance then
                    LimitDistance.SetVisibility(v)
                end
            end})

            LimitDistance = AimAssistSec:Slider({Name = "Limit Distance Amount", Visible = false, Flag = "aimbot_limit_distance_amount", Suffix = "st", Min = 0, Max = 2000, Float = 1, Value = 700})
        end

        local SilentAimSec =  CombatTab:Section({Name = "Silent Aim", Side = "Right"}) do
            local SilentAim = SilentAimSec:Toggle({Name = "Enabled", Flag = "silent"})
            SilentAim:Keybind({Name = "Silent Aim", Flag = "silent_key"})

            SilentAim:Toggle({Name = "Remote Type", Flag = "silent_remote"})

            local FovSlider
            SilentAim:Toggle({Name = "Use Field Of View", Flag = "silent_use_fov", Callback = function(v)
                if FovSlider then
                    FovSlider.SetVisibility(v)
                end
            end})
            FovSlider = SilentAim:Slider({Name = "Field Of View Amount", Visible = false, Value = 60, Flag = "silent_fov_amount", Min = 0, Max = 360, Float = 1})

            SilentAim:Slider({Name = "Hitchance", Suffix = "%", Value = 20, Flag = "silent_hitchance", Min = 0, Max = 100, Float = 1})

            SilentAim:Toggle({Name = "Sticky Aim", Flag = "silent_sticky_aim"})

            SilentAim:Toggle({Name = "Auto Shoot", Flag = "silent_auto_shoot"})

            SilentAim:Toggle({Name = "Use Velocity", Flag = "silent_velocity"})

            SilentAim:Textbox({Name = "Prediction", Value = "", Flag = "silent_pred_box"})

            SilentAim:Toggle({Name = "Auto Prediction", Flag = "silent_pred"})

            SilentAim:Toggle({Name = "Table Type", Flag = "silent_pred_table"})
                    
            SilentAim:Slider({Name = "Auto Prediction Factor", Value = 100, Flag = "silent_pred_amount", Min = 0, Max = 200, Float = 1})
            
            SilentAimSec:Dropdown({Name = "Position", Values = {"Mouse", "Screen"}, Value = "Mouse", Flag = "silent_position"})

            SilentAimSec:Dropdown({Name = "Hitbox", Values = {"Head", "HumanoidRootPart", "LowerTorso", "LeftUpperArm", "RightUpperArm", "LeftUpperLeg", "RightUpperLeg"}, Value = "Head", Flag = "silent_hitbox"})

            SilentAimSec:Dropdown({Name = "Checks", Values = {"Force-Field", "Health"}, Value = {"Health"}, Flag = "silent_checks", Multi = true})

            local LimitDistance
            SilentAimSec:Toggle({Name = "Limit Distance", Flag = "silent_limit_distance", Callback = function(v)
                if LimitDistance then
                    LimitDistance.SetVisibility(v)
                end
            end})

            LimitDistance = SilentAimSec:Slider({Name = "Limit Distance Amount", Visible = false, Flag = "silent_limit_distance_amount", Suffix = "st", Min = 0, Max = 2000, Float = 1, Value = 700})
        end
    --

    -- Visuals
        local CameraSection = VisualsTab:Section({Name = "Camera", Side = "Left"}) do
            local FovAmount = nil
            
            CameraSection:Toggle({Name = "Field Of View", Flag = "camera_fov"}):Slider({Name = "FoV Amount", Suffix = "°", Value = Camera.FieldOfView, Min = 0, Max = 120, Float = 1, Flag = "camera_fov_amount"})
            CameraSection:Toggle({Name = "Zoom", Flag = "camera_fov_zoom", Callback = function(v)
                if v and Flags["camera_fov_zoom_key"] then
                    FovAmount = Camera.FieldOfView
                else
                    if FovAmount then
                        Camera.FieldOfView = FovAmount
                    end
                end
            end}):Keybind({Name = "Zoom", Flag = "camera_fov_zoom_key", Callback = function(v)
                if v and Flags["camera_fov_zoom"] then
                    FovAmount = Camera.FieldOfView
                else
                    if FovAmount then
                        Camera.FieldOfView = FovAmount
                    end
                end
            end})
            CameraSection:Slider({Name = "FoV Amount", Suffix = "°", Value = Camera.FieldOfView, Min = 0, Max = 120, Float = 1, Flag = "camera_fov_zoom_amount"})
            local ThirdPerson = CameraSection:Toggle({Name = "Third Person", Flag = "camera_tp"})
            ThirdPerson:Keybind({Name = "Third Person", Flag = "camera_tp_key"})
            ThirdPerson:Slider({Name = "Third Person X", Suffix = "st", Value = 0, Min = -10, Max = 10, Float = 1, Flag = "camera_tp_x"})
            ThirdPerson:Slider({Name = "Third Person Y", Suffix = "st", Value = 0, Min = -10, Max = 10, Float = 1, Flag = "camera_tp_y"})
            ThirdPerson:Slider({Name = "Third Person Z", Suffix = "st", Value = 0, Min = -10, Max = 10, Float = 1, Flag = "camera_tp_z"})
            local AspectRatio = CameraSection:Toggle({Name = "Aspect Ratio", Flag = "camera_as"})
            AspectRatio:Slider({Name = "Aspect Ratio Horizontal", Suffix = "%", Value = 100, Min = 0, Max = 100, Float = 1, Flag = "camera_as_hor"})
            AspectRatio:Slider({Name = "Aspect Ratio Vertical", Suffix = "%", Value = 100, Min = 0, Max = 100, Float = 1, Flag = "camera_as_ver"})
        end

        local WorldSection = VisualsTab:Section({Name = "World", Side = "Right"}) do
            WorldSection:Toggle({Name = "Clock Time", Flag = "world_clock_time", Callback = function(v)
                if v and Flags["world_clock_time_amount"] then
                    Lighting.ClockTime = Flags["world_clock_time_amount"]
                end
            end}):Slider({Name = "Time", Suffix = "hr", Value = Lighting.ClockTime, Min = 0, Max = 24, Float = 1, Flag = "world_clock_time_amount", Callback = function(v)
                if Flags["world_clock_time"] and v then
                    Lighting.ClockTime = v
                end
            end})
            local Ambience = WorldSection:Toggle({Name = "Ambience Changer", Flag = "world_ambience", Callback = function(v)
                if v and Flags["world_ambience_outside"] and Flags["world_ambience_inside"] then
                    Lighting.OutdoorAmbient = Flags["world_ambience_outside"].c
                    Lighting.Ambient = Flags["world_ambience_inside"].c
                end
            end})
            Ambience:Colorpicker({Name = "Outside Ambient", Flag = "world_ambience_outside", Color = Lighting.OutdoorAmbient, Callback = function(v)
                if Flags["world_ambience"] and v and Flags["world_ambience_inside"] then
                    Lighting.OutdoorAmbient = v.c
                    Lighting.Ambient = Flags["world_ambience_inside"].c
                end
            end})
            Ambience:Colorpicker({Name = "Inside Ambient", Flag = "world_ambience_inside", Color = Lighting.Ambient, Callback = function(v)
                if Flags["world_ambience"] and Flags["world_ambience_outside"] and v then
                    Lighting.OutdoorAmbient = Flags["world_ambience_outside"].c
                    Lighting.Ambient = v.c
                end
            end})
            WorldSection:Toggle({Name = "Brightness", Flag = "world_brightness", Callback = function(v)
                if v and Flags["world_brightness_amount"] then
                    Lighting.Brightness = Flags["world_brightness_amount"] / 100
                end
            end}):Slider({Name = "Brightness Amount", Suffix = "lm", Value = Lighting.Brightness * 100, Min = 0, Max = 500, Float = 1, Flag = "world_brightness_amount", Callback = function(v)
                if Flags["world_brightness"] and v then
                    Lighting.Brightness = v / 100
                end
            end})
            local FogChanger = WorldSection:Toggle({Name = "Fog Changer", Flag = "world_fog", Callback = function(v)
                if v and Flags["world_fog_color"] and Flags["world_fog_start"] and Flags["world_fog_end"] then
                    Lighting.FogColor = Flags["world_fog_color"].c
                    Lighting.FogStart = Flags["world_fog_start"]
                    Lighting.FogEnd = Flags["world_fog_end"]
                end
            end})
            FogChanger:Colorpicker({Name = "Fog Color", Flag = "world_fog_color", Color = Lighting.FogColor, Callback = function(v)
                if Flags["world_fog"] and v and Flags["world_fog_start"] and Flags["world_fog_end"] then
                    Lighting.FogColor = v.c
                    Lighting.FogStart = Flags["world_fog_start"]
                    Lighting.FogEnd = Flags["world_fog_end"]
                end
            end})
            WorldSection:Slider({Name = "Fog Start", Suffix = "st", Value = Lighting.FogStart, Min = 0, Max = 5000, Float = 1, Flag = "world_fog_start", Callback = function(v)
                if Flags["world_fog"] and Flags["world_fog_color"] and v and Flags["world_fog_end"] then
                    Lighting.FogColor = Flags["world_fog_color"].c
                    Lighting.FogStart = v
                    Lighting.FogEnd = Flags["world_fog_end"]
                end
            end})
            WorldSection:Slider({Name = "Fog End", Suffix = "st", Value = Lighting.FogEnd, Min = 0, Max = 5000, Float = 1, Flag = "world_fog_end", Callback = function(v)
                if Flags["world_fog"] and Flags["world_fog_color"] and Flags["world_fog_start"] and v then
                    Lighting.FogColor = Flags["world_fog_color"].c
                    Lighting.FogStart = Flags["world_fog_start"]
                    Lighting.FogEnd = v
                end
            end})  

            if sethiddenproperty and gethiddenproperty then
                local TechnologyType = tostring(gethiddenproperty(Lighting, "Technology")):gsub("Enum.Technology.", "")

                WorldSection:Dropdown({Name = "Technology Type", Values = {"Legacy", "Voxel", "Compatibility", "ShadowMap", "Future"}, Value = TechnologyType, Flag = "world_tech_type", Callback = function(v)
                    if v and sethiddenproperty then
                        sethiddenproperty(Lighting, "Technology", Enum.Technology[v])
                    end
                end})
            end
            
            WorldSection:Dropdown({Name = "Skybox Changer", Values = Skyboxes, Value = "Off", Flag = "world_skybox_changer", Callback = function()
                Visuals:UpdateWorldVisuals()
            end}) 
            
            WorldSection:Toggle({Name = "Stars Count", Flag = "world_stars_count", Callback = function(v)
                Visuals:UpdateWorldVisuals()
            end}):Slider({Name = "Stars Count Amount", Value = Sky.StarCount, Min = 0, Max = 6000, Float = 1, Flag = "world_stars_count_amount", Callback = function(v)
                Visuals:UpdateWorldVisuals()
            end})

            WorldSection:Toggle({Name = "Bullet Tracers", Flag = "world_bullet_tracers"}):Colorpicker({Name = "Bullet Tracers Color", Flag = "world_bullet_tracers_color", Color = Color3.fromRGB(255, 255, 255)})
            WorldSection:Dropdown({Name = "Type", Values = BulletTracers, Value = BulletTracers[1], Flag = "world_bullet_tracers_type"}) 
            WorldSection:Slider({Name = "Time", Suffix = "s", Value = 2, Min = 0, Max = 20, Float = 1, Flag = "world_bullet_tracers_time"})  

            WorldSection:Toggle({Name = "Hit Impact", Flag = "world_hit_impact"}):Colorpicker({Name = "Hit Impact Color", Flag = "world_hit_impact_color", Color = Color3.fromRGB(255, 255, 255)})
            WorldSection:Slider({Name = "Time", Suffix = "s", Value = 2, Min = 0, Max = 20, Float = 1, Flag = "world_hit_impact_time"})  
            WorldSection:Slider({Name = "Size", Suffix = "st", Value = 1, Min = 0, Max = 5, Float = 0.01, Flag = "world_hit_impact_size"})  

            local HighlightTarget = WorldSection:Toggle({Name = "Highlight Target", Flag = "world_highlight"})
            HighlightTarget:Colorpicker({Name = "Highlight Fill Color", Flag = "world_highlight_fill_color", Color = Color3.fromRGB(255, 255, 255)})
            HighlightTarget:Colorpicker({Name = "Highlight Outline Color", Flag = "world_highlight_outline_color", Color = Color3.fromRGB(255, 255, 255)})

            WorldSection:Toggle({Name = "Target Line", Flag = "world_line"}):Colorpicker({Name = "Target Line Color", Flag = "world_line_color", Color = Color3.fromRGB(255, 255, 255)})
        
            WorldSection:Toggle({Name = "Hit Chams", Flag = "world_hit_chams"}):Colorpicker({Name = "Hit Chams Color", Flag = "world_hit_chams_color", Color = Color3.fromRGB(255, 255, 255)})
            WorldSection:Slider({Name = "Time", Suffix = "s", Value = 2, Min = 0, Max = 20, Float = 1, Flag = "world_hit_chams_time"})  
        
            local Hitmarkers = WorldSection:Toggle({Name = "3D Hitmarkers", Flag = "hitmarker"})
            Hitmarkers:Colorpicker({Name = "Hitmarkers Color", Flag = "hitmarker_color", Color = Color3.fromRGB(255, 255, 255)})
            Hitmarkers:Colorpicker({Name = "Hitmarkers Color", Flag = "hitmarker_outline", Color = Color3.fromRGB(255, 255, 255)})
            WorldSection:Slider({Name = "Time", Suffix = "s", Value = 2, Min = 0, Max = 20, Float = 1, Flag = "hitmarker_time"})
            WorldSection:Slider({Name = "Size", Suffix = "px", Value = 2, Min = 0, Max = 50, Float = 1, Flag = "hitmarker_size"})  
            WorldSection:Slider({Name = "Gap", Suffix = "px", Value = 2, Min = 0, Max = 50, Float = 1, Flag = "hitmarker_gap"})  

        end
    --

    -- Misc
        local Movement = MiscTab:Section({Name = "Movement"})  do
            local SpeedHack = Movement:Toggle({Name = "Speed Hack", Flag = "movement_speed_hack"})
            SpeedHack:Keybind({Name = "Speed Hack", Flag = "movement_speed_hack_key"})
            SpeedHack:Slider({Name = "Speed Hack Factor", Float = 1, Suffix = "st", Value = 60, Min = 0, Max = 300, Flag = "movement_speed_hack_factor"})
            SpeedHack:Dropdown({Name = "Speed Hack Type", Values = {"Velocity", "CFrame"}, Value = "Velocity", Flag = "movement_speed_hack_type"})

            local AutoJump = Movement:Toggle({Name = "Auto Jump", Flag = "movement_auto_jump"})
            AutoJump:Keybind({Name = "Auto Jump", Flag = "movement_auto_jump_key"})
            
            local FlyHack = Movement:Toggle({Name = "Fly Hack", Flag = "movement_fly_hack"})
            FlyHack:Keybind({Name = "Fly Hack", Flag = "movement_fly_hack_key"})
            FlyHack:Slider({Name = "Fly Hack Factor", Suffix = "st", Float = 1, Value = 60, Min = 0, Max = 300, Flag = "movement_fly_hack_factor"})
            FlyHack:Dropdown({Name = "Fly Hack Type", Values = {"Velocity", "CFrame"}, Value = "Velocity", Flag = "movement_fly_hack_type"})

            local CircleStrafe = Movement:Toggle({Name = "Circle Strafe", Flag = "movement_circle_strafe"})
            CircleStrafe:Keybind({Name = "Circle Strafe", Flag = "movement_circle_strafe_key"})

            local AvoidCollisions = Movement:Toggle({Name = "Avoid Collisions", Flag = "movement_avoid_collisions"})
            AvoidCollisions:Toggle({Name = "Standalone", Flag = "movement_avoid_collisions_standalone"})
            AvoidCollisions:Slider({Name = "Avoid Collisions Factor", Float = 1, Suffix = "st", Value = 100, Min = 0, Max = 300, Flag = "movement_avoid_collisions_factor"})
        end

        local DesyncSec
        local ExtraSec

        local MiscSecTab = MiscTab:Section({Name = "Misc Tabs", Side = "Right", Size = UDim2new(1, 0, 0, 56)}) do
            MiscSecTab:Dropdown({Name = "Misc Tab", Values = {"Desynchronization", "Extra"}, Value = "Desynchronization", Flag = "selected_misc_tab", Close = true, Callback = function(v)
                if DesyncSec then
                    DesyncSec.SetVisibility(v == "Desynchronization")
                end

                if ExtraSec then
                    ExtraSec.SetVisibility(v == "Extra")
                end
            end})
        end

        DesyncSec = MiscTab:Section({Name = "Desynchronization", Side = "Right", Size = UDim2new(1, 0, 1, -66)}) do
            local DesyncTog = DesyncSec:Toggle({Name = "Enabled", Flag = "desync"})
            DesyncTog:Keybind({Name = "Desynchronization", Flag = "desync_key"})

            DesyncSec:Toggle({Name = "Use Hook", Flag = "desync_hook"})

            local TargetStrafeDistance = nil
            local TargetSrafe = DesyncSec:Toggle({Name = "Target Strafe", Flag = "desync_strafe", Callback = function(v)
                if TargetStrafeDistance then
                    TargetStrafeDistance.SetVisibility(v)
                end
            end})
            TargetStrafeDistance =  TargetSrafe:Slider({Name = "Distance", Visible = false, Suffix = "st", Value = 8, Min = 0, Max = 20, Float = 1, Flag = "desync_strafe_distance"})
            TargetStrafeDistance:Slider({Name = "Speed", Value = 5, Min = 0, Max = 30, Float = 1, Flag = "desync_strafe_speed"})
            
            local DesyncXMode
            DesyncSec:Toggle({Name = "X Position", Flag = "desync_x", Callback = function(v)
                if DesyncXMode then
                    DesyncXMode.SetVisibility(v)
                end
            end})

            local DesyncXMin
            local DesyncXMax
            local DesyncXVal
            local DesyncXSpeed
            DesyncXMode = DesyncSec:Dropdown({Name = "X Mode", Visible = false, Values = {
                "Static",
                "Lerp",
                "Random"
            }, Value = "Static", Flag = "desync_mode_x", Callback = function(v)
                if DesyncXMin then
                    DesyncXMin.SetVisibility(v == "Lerp" or v == "Random" or false)
                end

                if DesyncXMax then
                    DesyncXMax.SetVisibility(v == "Lerp" or v == "Random" or false)
                end

                if DesyncXVal then
                    DesyncXVal.SetVisibility(v == "Static")
                end

                if DesyncXSpeed then
                    DesyncXSpeed.SetVisibility(v == "Lerp")
                end
            end})

            DesyncXMin = DesyncXMode:Slider({Name = "Min", Visible = false, Suffix = "st", Value = 0, Min = -300, Max = 0, Float = 1, Flag = "desync_min_x"})
            DesyncXMax = DesyncXMode:Slider({Name = "Max", Visible = false, Suffix = "st", Value = 0, Min = 0, Max = 300, Float = 1, Flag = "desync_max_x"})
            DesyncXVal = DesyncXMode:Slider({Name = "Value", Suffix = "st", Value = 0, Min = -300, Max = 300, Float = 1, Flag = "desync_val_x"})
            DesyncXSpeed = DesyncXMode:Slider({Name = "Lerp Speed", Value = 1, Min = 1, Max = 30, Float = 1, Flag = "desync_speed_x"})

            local DesyncYMode
            DesyncSec:Toggle({Name = "Y Position", Flag = "desync_y", Callback = function(v)
                if DesyncYMode then
                    DesyncYMode.SetVisibility(v)
                end
            end})

            local DesyncYMin
            local DesyncYMax
            local DesyncYVal
            local DesyncYSpeed
            DesyncYMode = DesyncSec:Dropdown({Name = "Y Mode", Visible = false, Values = {
                "Static",
                "Lerp",
                "Random"
            }, Value = "Static", Flag = "desync_mode_y", Callback = function(v)
                if DesyncYMin then
                    DesyncYMin.SetVisibility(v == "Lerp" or v == "Random" or false)
                end

                if DesyncYMax then
                    DesyncYMax.SetVisibility(v == "Lerp" or v == "Random" or false)
                end

                if DesyncYVal then
                    DesyncYVal.SetVisibility(v == "Static")
                end

                if DesyncYSpeed then
                    DesyncYSpeed.SetVisibility(v == "Lerp")
                end
            end})

            DesyncYMin = DesyncYMode:Slider({Name = "Min", Visible = false, Suffix = "st", Value = 0, Min = -300, Max = 0, Float = 1, Flag = "desync_min_y"})
            DesyncYMax = DesyncYMode:Slider({Name = "Max", Visible = false, Suffix = "st", Value = 0, Min = 0, Max = 300, Float = 1, Flag = "desync_max_y"})
            DesyncYVal = DesyncYMode:Slider({Name = "Value", Suffix = "st", Value = 0, Min = -300, Max = 300, Float = 1, Flag = "desync_val_y"})
            DesyncYSpeed = DesyncYMode:Slider({Name = "Lerp Speed", Value = 1, Min = 1, Max = 30, Float = 1, Flag = "desync_speed_y"})

            local DesyncZMode
            DesyncSec:Toggle({Name = "Z Position", Flag = "desync_z", Callback = function(v)
                if DesyncZMode then
                    DesyncZMode.SetVisibility(v)
                end
            end})

            local DesyncZMin
            local DesyncZMax
            local DesyncZVal
            local DesyncZSpeed
            DesyncZMode = DesyncSec:Dropdown({Name = "Z Mode", Visible = false, Values = {
                "Static",
                "Lerp",
                "Random"
            }, Value = "Static", Flag = "desync_mode_z", Callback = function(v)
                if DesyncZMin then
                    DesyncZMin.SetVisibility(v == "Lerp" or v == "Random" or false)
                end

                if DesyncZMax then
                    DesyncZMax.SetVisibility(v == "Lerp" or v == "Random" or false)
                end

                if DesyncZVal then
                    DesyncZVal.SetVisibility(v == "Static")
                end

                if DesyncZSpeed then
                    DesyncZSpeed.SetVisibility(v == "Lerp")
                end
            end})

            DesyncZMin = DesyncZMode:Slider({Name = "Min", Visible = false, Suffix = "st", Value = 0, Min = -300, Max = 0, Float = 1, Flag = "desync_min_z"})
            DesyncZMax = DesyncZMode:Slider({Name = "Max", Visible = false, Suffix = "st", Value = 0, Min = 0, Max = 300, Float = 1, Flag = "desync_max_z"})
            DesyncZVal = DesyncZMode:Slider({Name = "Value", Suffix = "st", Value = 0, Min = -300, Max = 300, Float = 1, Flag = "desync_val_z"})
            DesyncZSpeed = DesyncZMode:Slider({Name = "Lerp Speed", Value = 1, Min = 1, Max = 30, Float = 1, Flag = "desync_speed_z"})

            local DesyncPitchMode
            DesyncSec:Toggle({Name = "Pitch Position", Flag = "desync_pitch", Callback = function(v)
                if DesyncPitchMode then
                    DesyncPitchMode.SetVisibility(v)
                end
            end})

            local DesyncPitchMin
            local DesyncPitchMax
            local DesyncPitchVal
            local DesyncPitchSpeed
            DesyncPitchMode = DesyncSec:Dropdown({Name = "Pitch Mode", Visible = false, Values = {
                "Static",
                "Lerp",
                "Random"
            }, Value = "Static", Flag = "desync_mode_pitch", Callback = function(v)
                if DesyncPitchMin then
                    DesyncPitchMin.SetVisibility(v == "Lerp" or v == "Random" or false)
                end

                if DesyncPitchMax then
                    DesyncPitchMax.SetVisibility(v == "Lerp" or v == "Random" or false)
                end

                if DesyncPitchVal then
                    DesyncPitchVal.SetVisibility(v == "Static")
                end

                if DesyncPitchSpeed then
                    DesyncPitchSpeed.SetVisibility(v == "Lerp")
                end
            end})

            DesyncPitchMin = DesyncPitchMode:Slider({Name = "Min", Visible = false, Suffix = "°", Value = 0, Min = -360, Max = 0, Float = 1, Flag = "desync_min_pitch"})
            DesyncPitchMax = DesyncPitchMode:Slider({Name = "Max", Visible = false, Suffix = "°", Value = 0, Min = 0, Max = 360, Float = 1, Flag = "desync_max_pitch"})
            DesyncPitchVal = DesyncPitchMode:Slider({Name = "Value", Suffix = "°", Value = 0, Min = -360, Max = 360, Float = 1, Flag = "desync_val_pitch"})
            DesyncPitchSpeed = DesyncPitchMode:Slider({Name = "Lerp Speed", Value = 1, Min = 1, Max = 30, Float = 1, Flag = "desync_speed_pitch"})
            
            local DesyncYawMode
            DesyncSec:Toggle({Name = "Yaw Position", Flag = "desync_yaw", Callback = function(v)
                if DesyncYawMode then
                    DesyncYawMode.SetVisibility(v)
                end
            end})

            local DesyncYawMin
            local DesyncYawMax
            local DesyncYawVal
            local DesyncYawSpeed
            DesyncYawMode = DesyncSec:Dropdown({Name = "Yaw Mode", Visible = false, Values = {
                "Static",
                "Lerp",
                "Random"
            }, Value = "Static", Flag = "desync_mode_yaw", Callback = function(v)
                if DesyncYawMin then
                    DesyncYawMin.SetVisibility(v == "Lerp" or v == "Random" or false)
                end

                if DesyncYawMax then
                    DesyncYawMax.SetVisibility(v == "Lerp" or v == "Random" or false)
                end

                if DesyncYawVal then
                    DesyncYawVal.SetVisibility(v == "Static")
                end

                if DesyncYawSpeed then
                    DesyncYawSpeed.SetVisibility(v == "Lerp")
                end
            end})

            DesyncYawMin = DesyncYawMode:Slider({Name = "Min", Visible = false, Suffix = "°", Value = 0, Min = -360, Max = 0, Float = 1, Flag = "desync_min_yaw"})
            DesyncYawMax = DesyncYawMode:Slider({Name = "Max", Visible = false, Suffix = "°", Value = 0, Min = 0, Max = 360, Float = 1, Flag = "desync_max_yaw"})
            DesyncYawVal = DesyncYawMode:Slider({Name = "Value", Suffix = "°", Value = 0, Min = -360, Max = 360, Float = 1, Flag = "desync_val_yaw"})
            DesyncYawSpeed = DesyncYawMode:Slider({Name = "Lerp Speed", Value = 1, Min = 1, Max = 30, Float = 1, Flag = "desync_speed_yaw"})

            local DesyncRollMode
            DesyncSec:Toggle({Name = "Roll Position", Flag = "desync_roll", Callback = function(v)
                if DesyncRollMode then
                    DesyncRollMode.SetVisibility(v)
                end
            end})

            local DesyncRollMin
            local DesyncRollMax
            local DesyncRollVal
            local DesyncRollSpeed
            DesyncRollMode = DesyncSec:Dropdown({Name = "Roll Mode", Visible = false, Values = {
                "Static",
                "Lerp",
                "Random"
            }, Value = "Static", Flag = "desync_mode_roll", Callback = function(v)
                if DesyncRollMin then
                    DesyncRollMin.SetVisibility(v == "Lerp" or v == "Random" or false)
                end

                if DesyncRollMax then
                    DesyncRollMax.SetVisibility(v == "Lerp" or v == "Random" or false)
                end

                if DesyncRollVal then
                    DesyncRollVal.SetVisibility(v == "Static")
                end

                if DesyncRollSpeed then
                    DesyncRollSpeed.SetVisibility(v == "Lerp")
                end
            end})

            DesyncRollMin = DesyncRollMode:Slider({Name = "Min", Visible = false, Suffix = "°", Value = 0, Min = -360, Max = 0, Float = 1, Flag = "desync_min_roll"})
            DesyncRollMax = DesyncRollMode:Slider({Name = "Max", Visible = false, Suffix = "°", Value = 0, Min = 0, Max = 360, Float = 1, Flag = "desync_max_roll"})
            DesyncRollVal = DesyncRollMode:Slider({Name = "Value", Suffix = "°", Value = 0, Min = -360, Max = 360, Float = 1, Flag = "desync_val_roll"})
            DesyncRollSpeed = DesyncRollMode:Slider({Name = "Lerp Speed", Value = 1, Min = 1, Max = 30, Float = 1, Flag = "desync_speed_roll"})

            DesyncSec:Toggle({Name = "Void", Flag = "desync_void", Callback = function(v)
                if v and Flags["desync_void_key"] then
                    Desync:SetStatus(true)
                    Desync:OverwritePosition(Vector3new(9e9, -9e9, 9e9))
                else
                    Desync:SetStatus(nil)
                    Desync:RemoveOverwrite()
                end
            end}):Keybind({Name = "Void", Flag = "desync_void_key", Callback = function(v)
                if v and Flags["desync_void"] then
                    Desync:SetStatus(true)
                    Desync:OverwritePosition(Vector3new(9e9, -9e9, 9e9))
                else
                    Desync:SetStatus(nil)
                    Desync:RemoveOverwrite()
                end
            end})

            DesyncSec:Toggle({Name = "Visualize", Flag = "desync_vis"}):Colorpicker({Name = "Desync Color", Flag = "desync_vis_color", Callback = Desync.UpdateCharacter})

            DesyncSec:Dropdown({Name = "Material", Values = Materials, Value = "ForceField", Flag = "desync_vis_material", Callback = Desync.UpdateCharacter})
        end

        ExtraSec = MiscTab:Section({Name = "Extra", Visible = false, Side = "Right", Size = UDim2new(1, 0, 1, -66)}) do
            ExtraSec:Toggle({Name = "Ignore Friends", Flag = "ignore_friends"})
            ExtraSec:Toggle({Name = "Target Priority Only", Flag = "priority_only"})

            local VelocityFactor
            local VelocityTarget 
            local Velocity = ExtraSec:Toggle({Name = "Velocity Spoofer", Flag = "velocity", Callback = function(v)
                if VelocityFactor then
                    VelocityFactor.SetVisibility(v)
                end
                if VelocityTarget then
                    VelocityTarget.SetVisibility(v)
                end
            end})
            
            Velocity:Keybind({Name = "Velocity Spoofer", Flag = "velocity_key"})
            VelocityFactor = Velocity:Slider({Name = "Spoof Factor", Visible = false, Suffix = "vel", Value = 0, Min = 0, Max = 99999, Float = 1, Flag = "velocity_factor"})

            if sethiddenproperty then
                ExtraSec:Keybind({Name = "Network Desync", Flag = "network_desync"})
                ExtraSec:Slider({Name = "Delay", Visible = false, Suffix = "s", Value = 1, Min = 0, Max = 10, Float = 0.01, Flag = "network_desync_delay"})
            end

            if setfflag then
                local SenderRateAmount
                ExtraSec:Toggle({Name = "Physics Sender Rate", Flag = "physics_rate", Callback = function(v)
                    if v and Flags["physics_rate_amount"] and Flags["physics_rate_key"] then
                        setfflag("S2PhysicsSenderRate", tostring(Flags["physics_rate_amount"]))
                    else
                        setfflag("S2PhysicsSenderRate", "15")
                    end

                    if SenderRateAmount then
                        SenderRateAmount.SetVisibility(v)
                    end
                end}):Keybind({Name = "Sender Rate", Flag = "physics_rate_key", Callback = function(v)
                    if v and Flags["physics_rate"] and Flags["physics_rate_amount"] then
                        setfflag("S2PhysicsSenderRate", tostring(Flags["physics_rate_amount"]))
                    else
                        setfflag("S2PhysicsSenderRate", "15")
                    end
                end})
                SenderRateAmount = ExtraSec:Slider({Name = "Sender Rate Amount", Visible = false, Value = 3, Min = 0, Max = 15, Float = 1, Flag = "physics_rate_amount", Callback = function(v)
                    if v and Flags["physics_rate"] and Flags["physics_rate_key"] then
                        setfflag("S2PhysicsSenderRate", tostring(v))
                    else
                        setfflag("S2PhysicsSenderRate", "15")
                    end

                end})
            end

            local Ignored = workspace:FindFirstChild("Ignored")

            if Ignored then
                local Shop = Ignored:FindFirstChild("Shop")

                if Shop then
                    local Buying = false

                    local Items = {}

                    for _,v in next, Shop:GetChildren() do
                        if not v:IsA("Model") then
                            continue
                        end

                        local Name = v.Name:lower()

                        if not (Name:find("phone") or Name:find("mask") or Name:find("weight")) then
                            Items[v.Name] = v
                        end
                    end

                    local ItemNames = {}

                    for _,v in next, Items do
                        ItemNames[#ItemNames + 1] = _
                    end

                    ExtraSec:Dropdown({Name = "Item", Values = ItemNames, Value = ItemNames[1], Flag = "item_buy"})
                    ExtraSec:Button({Name = "Buy", Confirm = true, Callback = function()
                        if Buying then
                            Library:Notify({
                                Text = "Already buying item!"
                            })            
                            
                            return
                        end

                        Buying = true

                        local ItemType = Flags["item_buy"] 

                        local ItemModel = Items[ItemType]

                        if not ItemModel then
                            Buying = false
                            return
                        end

                        local ClickDetector = ItemModel:FindFirstChildWhichIsA("ClickDetector")

                        if not ClickDetector then
                            Buying = false
                            return
                        end

                        local ItemPart = ItemModel:FindFirstChildWhichIsA("Part") or ItemModel:FindFirstChildWhichIsA("MeshPart") or ItemModel:FindFirstChildWhichIsA("BasePart")

                        if not ItemPart then
                            Buying = false
                            return
                        end

                        Desync:SetStatus(true)
                        Desync:OverwritePosition(ItemPart.Position)

                        taskwait(1)

                        for i = 1, 10 do
                            fireclickdetector(ClickDetector)

                            taskwait()
                        end

                        taskwait(1)

                        Desync:SetStatus()
                        Desync:RemoveOverwrite()

                        Buying = false
                    end})
                end
            end

            ExtraSec:Toggle({Name = "Hit Sound", Flag = "hitsound"})
            ExtraSec:Dropdown({Name = "Type", Values = Hitsounds, Value = Hitsounds[1], Flag = "hitsound_type"})
            ExtraSec:Slider({Name = "Volume", Value = 100, Min = 0, Max = 100, Float = 1, Flag = "hitsound_volume"})
            ExtraSec:Slider({Name = "Pitch", Value = 100, Min = 0, Max = 200, Float = 1, Flag = "hitsound_pitch"})

            ExtraSec:Toggle({Name = "Hit Logs", Flag = "hitlogs"})
            ExtraSec:Slider({Name = "Time", Value = 3, Min = 0, Max = 10, Float = 1, Flag = "hitlogs_time"})

            ExtraSec:Toggle({Name = "No Slow", Flag = "no_slow"})

            ExtraSec:Toggle({Name = "Auto Reload", Flag = "auto_reload"})

        end
    --
    
    -- Players
        local DataIndex = {
            "None",
            "Friend",
            "Priority"
        }

        local DataIndexColors = {
            ["None"] = Color3fromRGB(255, 255, 255),
            ["Priority"] = Color3fromRGB(51, 255, 75),
            ["Friend"] = Color3fromRGB(0, 200, 255),
            ["Local"] = Color3fromRGB(0, 255, 157),        
        }

        local MainSec = PlayersTab:Section({Name = "Main"})  --
            local SelectedPlayer = nil
            local PlayersList = nil

            local PlayerNameLabel = nil
            local UserIdLabel = nil
            local AccountAgeLabel = nil
            local TeamLabel = nil
            local StatusLabel = nil
            local StatusDropdown = nil

            local function PlayerSelected(plr)
                SelectedPlayer = plr

                local PlayerTbl = Puppyware.Players[plr]
                local Player = PlayerTbl and PlayerTbl.Player
                local StatusType = plr == LocalPlayer.Name and "Local" or PlayerTbl and PlayerTbl.Status or "None"

                if PlayerNameLabel and Player then
                    PlayerNameLabel.ChangeText(("Player Name - %s"):format(plr))
                end

                if UserIdLabel and Player then
                    UserIdLabel.ChangeText(("User ID - %s"):format(Player.UserId))
                end

                if StatusLabel and StatusType then
                    local StatusColor = DataIndexColors[StatusType]

                    StatusLabel.ChangeText(('Status - <font color="rgb(%s, %s, %s)">%s</font>'):format(mathfloor(StatusColor.r * 255), mathfloor(StatusColor.g * 255), mathfloor(StatusColor.b * 255), StatusType))
                end

                if AccountAgeLabel and Player then
                    AccountAgeLabel.ChangeText(("Account Age - %s days"):format(Player.AccountAge))
                end

                if TeamLabel and Player then
                    local Team = Utility:GetTeam(Player)
                    local TeamColor = Team and Team.TeamColor and Team.TeamColor.Color or Color3fromRGB(255, 255, 255)
                    local TeamName = Team and tostring(Team) or "None"

                    TeamLabel.ChangeText(('Team - <font color="rgb(%s, %s, %s)">%s</font>'):format(mathfloor(TeamColor.r * 255), mathfloor(TeamColor.g * 255), mathfloor(TeamColor.b * 255), TeamName))
                end

                if StatusDropdown then
                    StatusDropdown.Set(StatusType)
                end
            end

            local function SetStatus(status)
                if not SelectedPlayer then
                    return
                end

                if SelectedPlayer == LocalPlayer.Name then
                    return
                end

                local PlayerTbl = Puppyware.Players[SelectedPlayer]

                if not PlayerTbl then
                    return
                end

                PlayerTbl.Status = status

                if StatusLabel and status then
                    local StatusColor = DataIndexColors[status]

                    StatusLabel.ChangeText(('Status - <font color="rgb(%s, %s, %s)">%s</font>'):format(mathfloor(StatusColor.r * 255), mathfloor(StatusColor.g * 255), mathfloor(StatusColor.b * 255), status))
                end
            end

            local StoredThumbnails = {}

            local SearchTextbox = MainSec:Textbox({Name = "Search", Value = "", Flag = "playerlist_search", Callback = function(v)
                if PlayersList then
                    local Items = PlayersList.Items

                    for name,itemtbl in Items do
                        
                        itemtbl.Holder.Visible = name:lower():find(v:lower())
                    end
                end
            end})
            PlayersList = MainSec:List({Name = "Players", Values = {}, Value = "-", Flag = "playerlist_list", Size = 290, Callback = PlayerSelected})

            local function RefreshPlayers()
                if not PlayersList then
                    return
                end

                SearchTextbox.Set("")

                local PlayersTbl = {}

                for _,v in Players:GetPlayers() do
                    local Thumbnail = StoredThumbnails[v.UserId] or Players:GetUserThumbnailAsync(v.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
    
                    StoredThumbnails[v.UserId] = Thumbnail
    
                    PlayersTbl[#PlayersTbl + 1] = {
                        Name = v.Name,
                        ImageId = Thumbnail
                    }
    
                    if not Puppyware.Players[v.Name] then
                        Puppyware.Players[v.Name] = {
                            Status = "None",
                            Player = v
                        }
                    end
                end

                PlayersList.Refresh(PlayersTbl)
            end

            MainSec:Button({Name = "Refresh", Callback = function()
                RefreshPlayers()
            end})

        --

        local InfoSec = PlayersTab:Section({Name = "Info", Side = "Right"}) --
            PlayerNameLabel = InfoSec:Label({Name = "Player Name - "})
            UserIdLabel = InfoSec:Label({Name = "User ID - "})
            AccountAgeLabel = InfoSec:Label({Name = "Account Age - "})
            TeamLabel = InfoSec:Label({Name = "Team - "})
            StatusLabel = InfoSec:Label({Name = "Status - "})
            StatusDropdown = InfoSec:Dropdown({Name = "Status", Values = DataIndex, Value = "None", Flag = "playerlist_status", Callback = SetStatus})
        --
    --

    -- Settings
        local ConfigsSection = SettingsTab:Section({
            Name = "Configurations"
        }) do
            local ConfigDropdown = ConfigsSection:List({Name = "Configs", Values = {}, Value = "-", Flag = "config_dropdown", Size = 190, Callback = function(v)
                if Library.ConfigFlags["config_name"] then
                    Library.ConfigFlags["config_name"].Set(v)
                end
            end})
            ConfigsSection:Textbox({Name = "Config Name", Value = "", Flag = "config_name"})
            ConfigsSection:Button({Name = "Save Config", Confirm = true, Callback = function()
                local ConfigName = Library.Flags["config_name"]

                Library:Notify({
                    Text = ("Successfully %s config (%s)!"):format(isfile(`{Library.Folder}/Configs/{ConfigName}.txt`) and "saved" or "created", ConfigName)
                })

                writefile(`{Library.Folder}/Configs/{ConfigName}.txt`, Library:GetConfig())

                local _, FileNames = Utility.GetFiles("Configs", {".txt"})

                ConfigDropdown.Refresh(FileNames)

                ConfigDropdown.Set(ConfigName)
            end})
            ConfigsSection:Button({Name = "Load Config", Confirm = true, Callback = function()
                local ConfigName = Library.Flags["config_name"]

                if isfile(`{Library.Folder}/Configs/{ConfigName}.txt`) then
                    Library:LoadConfig(readfile(`{Library.Folder}/Configs/{ConfigName}.txt`))

                    Library:Notify({
                        Text = ("Successfully loaded config (%s)!"):format(ConfigName)
                    })
                else
                    Library:Notify({
                        Text = ("Couldn't find config (%s)!"):format(ConfigName)
                    })
                end

                local _, FileNames = Utility.GetFiles("Configs", {".txt"})

                ConfigDropdown.Refresh(FileNames)
            end})
            ConfigsSection:Button({Name = "Reset Config", Confirm = true, Callback = function()
                local ConfigName = Library.Flags["config_name"]

                if isfile(`{Library.Folder}/Configs/{ConfigName}.txt`) then
                    writefile(`{Library.Folder}/Configs/{ConfigName}.txt`, "")

                    Library:Notify({
                        Text = ("Successfully reseted config (%s)!"):format(ConfigName)
                    })    
                else
                    Library:Notify({
                        Text = ("Couldn't find config (%s)!"):format(ConfigName)
                    })
                end

                local Files, FileNames = Utility.GetFiles("Configs", {".txt"})

                ConfigDropdown.Refresh(FileNames)
            end})
            ConfigsSection:Button({Name = "Delete Config", Confirm = true, Callback = function()
                local ConfigName = Library.Flags["config_name"]

                if isfile(`{Library.Folder}/Configs/{ConfigName}.txt`) then
                    delfile(`{Library.Folder}/Configs/{ConfigName}.txt`)

                    Library:Notify({
                        Text = ("Successfully deleted config (%s)!"):format(ConfigName)
                    })
                else
                    Library:Notify({
                        Text = ("Couldn't find config (%s)!"):format(ConfigName)
                    })
                end

                local _, FileNames = Utility.GetFiles("Configs", {".txt"})

                ConfigDropdown.Refresh(FileNames)

                ConfigDropdown.Set(FileNames[1])
            end})
            ConfigsSection:Button({Name = "Refresh Config", Confirm = true, Callback = function()
                local _, FileNames = Utility.GetFiles("Configs", {".txt"})

                ConfigDropdown.Refresh(FileNames)
            end})

            local _, FileNames = Utility.GetFiles("Configs", {".txt"})

            ConfigDropdown.Refresh(FileNames)
        end

        local ExtraSection = SettingsTab:Section({
            Name = "Extra",
            Side = "Right"
        }) do
            local Watermark = Window.Watermark
            local KeybindList = Window.KeybindList

            ExtraSection:Keybind({
                Name = "Menu Keybind",
                Flag = "menu_keybind",
                Key = Enum.KeyCode.RightShift,
                Ignore = true,
                Value = true,
                Callback = function(v)
                    Library:Show(v)
                end
            })
            ExtraSection:Button({Name = "Unload", Confirm = true, Callback = Utility.Unload})
            ExtraSection:Button({Name = "Rejoin Game", Confirm = true, Callback = function()
                TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)
            end})
            ExtraSection:Button({Name = "Join New Game", Confirm = true, Callback = function()
                local Notification = Library:Notify({
                    Text = "Looking for a server...",
                    Time = 9e9,
                    Animation = "Bounce"
                })

                while taskwait() do
                    local Success, Servers = pcall(function()
                        return HttpService:JSONDecode(
                            game:HttpGet(
                                ("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100"):format(
                                    game.PlaceId
                                )
                            )
                        )
                    end)

                    if not Success then
                        Notification.Text = "Failed to get server list."
                        Notification.Type = "Warning"
                        Notification.ClockTime = osclock() + 5

                        break
                    end
                end
            end})
            ExtraSection:Button({Name = "Copy Join Script", Confirm = true, Callback = function()
                Library:Notify({
                    Text = "Successfully copied join script to clipboard!"
                })

                setclipboard(
                    stringformat(
                        'game:GetService("TeleportService"):TeleportToPlaceInstance(%s, "%s")',
                        game.PlaceId,
                        game.JobId
                    )
                )
            end})
            ExtraSection:Toggle({
                Name = "Keybinds List",
                Status = true,
                Flag = "menu_keybinds_list",
                Callback = function(v)
                    if KeybindList then
                        KeybindList.SetVisibility(v)
                    end
                end
            })
            ExtraSection:Toggle({
                Name = "Watermark",
                Status = true,
                Flag = "menu_watermark",
                Callback = function(v)
                    if Watermark then
                        Watermark.SetVisibility(v)
                    end
                end
            })
            ExtraSection:Textbox({Name = "Watermark Text", Value = Watermark.Text, Flag = "menu_watermark_text", Callback = function(v)
                if Watermark then
                    Watermark.SetText(v)
                end
            end}) 
            ExtraSection:Slider({
                Name = "Watermark Tick Rate",
                Flag = "menu_watermark_tickrate",
                Min = 0,
                Max = 1000,
                Value = 200,
                Float = 1,
                Callback = function(v)
                    if Watermark then
                        Watermark.SetTickRate(v / 1000)
                    end
                end
            })
            ExtraSection:Slider({
                Name = "Tween Speed",
                Flag = "menu_tween_speed",
                Min = 0,
                Max = 1000,
                Value = 100,
                Float = 1,
                Callback = function(v)
                    Library.TweenSpeed = v / 1000
                end
            })
            ExtraSection:Slider({
                Name = "Lerp Speed",
                Flag = "menu_lerp_speed",
                Min = 0,
                Max = 1000,
                Value = 100,
                Float = 1,
                Callback = function(v)
                    Library.LerpSpeed = v / 1000
                end
            })

            local TweenStyles = {}

            for _,v in Enum.EasingStyle:GetEnumItems() do
                TweenStyles[#TweenStyles + 1] = tostring(v):gsub("Enum.EasingStyle.", "")
            end

            ExtraSection:Dropdown({Name = "Easing Style", Values = TweenStyles, Value = "Quad", Flag = "menu_easing_style", Callback = function(v)
                Library.TweenEasingStyle = Enum.EasingStyle[v]
            end})

            local ThemeColorpickers = {}
            for _,v in Library.Theme do
                ThemeColorpickers[_] = ExtraSection:Colorpicker({Name = _, Flag = _ .. "_theme", Color = v, Callback = function(v)
                    Library:ChangeTheme(_, v.c)
                end})
            end

            ExtraSection:Button({Name = "Reset Theme", Confirm = true, Callback = function()
                for _,v in Library.OriginalTheme do
                    Library:ChangeTheme(_, v)

                    ThemeColorpickers[_].Set(v)
                end
            end})
        end
    --

    SettingsTab.Select(true)
--

-- ESP Preview
    local ESPPreview = {}
    
    local WindowHolder = Window.OutlineHolder

    local ESPWindow = Library:Window({
        Name = "ESP Interacts",
        Size = Vector2new(350, 380),
        Selects = false,
        Holder = Library.Popups,
        Position = UDim2new(0, WindowHolder.AbsolutePosition.x + WindowHolder.AbsoluteSize.x + 5, 0, WindowHolder.AbsolutePosition.y),
        Resizing = false,
    })

    ESPWindow.OutlineHolder.Visible = false

    function ESPPreview:CreatePreview(tab, type, flag)
        local Page = tab.Page

        local MainFlag = "esp_" .. type .. "_"

        local Preview = {
            Items = {},
            Selected = {}
        }

        local ESPHolder = Library:New("Frame", {
            Name = "ESPHolder",
            Parent = Page,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2new(0, 0, 0, 0),
            Size = UDim2new(1, 0, 1, 0),
        })

        local ESPItemsOutline = Library:New("Frame", {
            Name = "ESPItemsOutline",
            Parent = ESPHolder,
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            Position = UDim2new(0, 0, 1, -38),
            Size = UDim2new(1, 0, 0, 38),
        })

        Library:AddTheme(ESPItemsOutline, {
            BackgroundColor3 = "Outline",
        })

        local ESPItemsBackground = Library:New("Frame", {
            Name = "ESPItemsBackground",
            Parent = ESPItemsOutline,
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            Position = UDim2new(0, 1, 0, 1),
            Size = UDim2new(1, -2, 1, -2),
        })

        Library:AddTheme(ESPItemsBackground, {
            BackgroundColor3 = "Element Background",
        })

        Library:New("UIPadding", {
            Parent = ESPItemsBackground,
            PaddingBottom = UDimnew(0, 5),
            PaddingLeft = UDimnew(0, 5),
            PaddingRight = UDimnew(0, 5),
            PaddingTop = UDimnew(0, 5),
        })

        local ESPItemsOne = Library:New("Frame", {
            Name = "ESPItemsOne",
            Parent = ESPItemsBackground,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2new(0, 0, 0, 0),
            Size = UDim2new(1, 0, 0, 13),
        })

        Library:New("UIListLayout", {
            Parent = ESPItemsOne,
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDimnew(0, 5),
        })

        local ESPItemsSecond = Library:New("Frame", {
            Name = "ESPItemsSecond",
            Parent = ESPItemsBackground,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2new(0, 0, 0, 15),
            Size = UDim2new(1, 0, 0, 13),
        })

        Library:New("UIListLayout", {
            Parent = ESPItemsSecond,
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDimnew(0, 5),
        })

        local BoxSize = Vector2new(131, 169)
        local BoxPosition = Vector2new(0, 0)

        local BoxHolder = Utility:New("Frame", {
            Parent = ESPHolder,
            BackgroundTransparency = 1,
            Size = UDim2offset(BoxSize.x, BoxSize.y),
            Position = UDim2new(0.5, -(BoxSize.x / 2), 0.5, -((BoxSize.y / 2) + (53 / 2))),
            BorderSizePixel = 0,
        })

        local SetFlag = MainFlag .. "selected" .. flag

        function Preview.Set(item)
            if typeof(item) == "table" then
                for _,v in item do
                    if not tablefind(Preview.Selected, v) then
                        Preview.Set(v)
                    end
                end
            else
                local Index = tablefind(Preview.Selected, item)
                local Item = Preview.Items[item]

                if Item then
                    if Index then    
                        Item.Set(false)

                        tableremove(Preview.Selected, Index)

                        Library.Flags[SetFlag] = Preview.Selected
                    else    
                        Item.Set(true)

                        tableinsert(Preview.Selected, item)
    
                        Library.Flags[SetFlag] = Preview.Selected    
                    end
                end
            end
        end

        local OldOpenedPopUp = nil

        function Preview.CreateItem(name, callback, holder, popup)
            callback = callback or function() end
            holder = holder or ESPItemsOne
            popup = popup == nil and true or popup

            local Item = {
                Selected = false
            }

            local ItemText = Library:New("TextButton", {
                BackgroundTransparency = 1,
                AutomaticSize = Enum.AutomaticSize.X,
                Size = UDim2new(0, 0, 0, 13),
                FontFace = Library.Font,
                Text = name,
                TextSize = Library.FontSize,
                Parent = holder,
                TextStrokeTransparency = 0,
                RichText = true,
                TextXAlignment = Enum.TextXAlignment.Left,
            })

            Item.Text = ItemText
            Item.Name = name

            Library:AddTheme(ItemText, {
                TextColor3 = "Text",
            })

            local PopUpSection = nil
            if popup then
                PopUpSection = Utility:New("Frame", {
                    Parent = Library.Popups,
                    BackgroundTransparency = 0.5,
                    Active = true,
                    Draggable = true,
                    Visible = false,
                    Size = UDim2new(0, 250, 0, 150),
                    Position = UDim2new(0, 0, 0, 0),
                    BorderSizePixel = 0,
                })

                Item.PopUp = PopUpSection
            end

            function Item.Set(status)
                Item.Selected = status

                Library:ChangeObjectTheme(ItemText, {
                    TextColor3 = Item.Selected and "Accent" or "Text"
                }, true)

                callback(status)
            end

            Utility:Connect(ItemText.MouseButton1Down, function()
                Preview.Set(name)
            end)

            if popup then
                Utility:Connect(ItemText.MouseButton2Down, function()
                    PopUpSection.Visible = not PopUpSection.Visible

                    local AbsolutePosition = ItemText.AbsolutePosition
                    local AbsoluteSize = ItemText.AbsoluteSize

                    PopUpSection.Position = UDim2new(0, AbsolutePosition.x, 0, AbsolutePosition.y + AbsoluteSize.y + 5)

                    if OldOpenedPopUp then
                        OldOpenedPopUp.Visible = false
                    end

                    if PopUpSection.Visible then
                        OldOpenedPopUp = PopUpSection
                    else
                        OldOpenedPopUp = nil
                    end
                end)
            end

            Preview.Items[name] = Item

            return Item
        end

        function Preview.CreateSeperator(holder)
            local SeperatorHolder = Library:New("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2new(0, 1, 1, 0),
                Parent = holder,
                BorderSizePixel = 0,
            })
            
            local SeperatorAccent = Library:New("Frame", {
                Position = UDim2new(0, 0, 0, 3),
                Size = UDim2new(0, 1, 1, -6),
                Parent = SeperatorHolder,
                BorderSizePixel = 0,
            })

            Library:AddTheme(SeperatorAccent, {
                BackgroundColor3 = "Accent",
            })
        end

        Library.ConfigFlags[SetFlag] = Preview

        -- On
            Preview.CreateItem("On", function(v)
                Library.Flags[MainFlag .. "enabled" .. flag] = v
            end, ESPItemsOne, false)

            Preview.CreateSeperator(ESPItemsOne)
        --
        
        -- Box
            local BoxItem = Preview.CreateItem("Box", function(v)
                Library.Flags[MainFlag .. "box" .. flag] = v
            end)

            local BoxSection = Library.Section({Left = BoxItem.PopUp}, {Name = "Box Settings"})

            BoxSection:Colorpicker({Name = "Box Color", Flag = MainFlag .. "box_color" .. flag})

            BoxSection:Colorpicker({Name = "Box Outline Color", Flag = MainFlag .. "box_outline" .. flag, Color = Color3fromRGB(0, 0, 0), Transparency = 0.5})

            local BoxGradientTog = BoxSection:Toggle({Name = "Box Gradient", Flag = MainFlag .. "box_gradient" .. flag})
            BoxGradientTog:Colorpicker({Name = "Box Gradient Color", Flag = MainFlag .. "box_gradient_from_color" .. flag, Color = Color3fromRGB(0, 255, 0)})
            BoxGradientTog:Colorpicker({Name = "To Gradient Color", Flag = MainFlag .. "box_gradient_to_color" .. flag, Color = Color3fromRGB(255, 0, 0)})

            BoxSection:Toggle({Name = "Gradient Rainbow", Flag = MainFlag .. "box_gradient_rainbow" .. flag})
            BoxSection:Slider({Name = "Rainbow Speed", Flag = MainFlag .. "box_gradient_rainbow_speed" .. flag, Min = 0, Max = 100, Float = 1, Value = 50})
        
            Preview.CreateSeperator(ESPItemsOne)
        --

        -- Box Fill
            local BoxFillItem = Preview.CreateItem("Box Fill", function(v)
                Library.Flags[MainFlag .. "box_fill" .. flag] = v
            end)

            local BoxFillSection = Library.Section({Left = BoxFillItem.PopUp}, {Name = "Box Fill Settings"})

            BoxFillSection:Colorpicker({Name = "Box Fill Color", Flag = MainFlag .. "box_fill_color" .. flag, Transparency = 0})

            local BoxFillGradientTog = BoxFillSection:Toggle({Name = "Box Fill Gradient", Flag = MainFlag .. "box_fill_gradient" .. flag})
            BoxFillGradientTog:Colorpicker({Name = "Fill Gradient Color", Flag = MainFlag .. "box_fill_gradient_from_color" .. flag, Color = Color3fromRGB(0, 255, 0)})
            BoxFillGradientTog:Colorpicker({Name = "To Gradient Color", Flag = MainFlag .. "box_fill_gradient_to_color" .. flag, Color = Color3fromRGB(255, 0, 0)})

            BoxFillSection:Toggle({Name = "Gradient Rainbow", Flag = MainFlag .. "box_fill_gradient_rainbow" .. flag})
            BoxFillSection:Slider({Name = "Rainbow Speed", Flag = MainFlag .. "box_fill_gradient_rainbow_speed" .. flag, Min = 0, Max = 100, Float = 1, Value = 50})
        
            Preview.CreateSeperator(ESPItemsOne)
        --
        
        -- Name
            local NameItem = Preview.CreateItem("Name", function(v)
                Library.Flags[MainFlag .. "name" .. flag] = v
            end)

            NameItem.PopUp.Size = UDim2new(0, 250, 0, 180)

            local NameSection = Library.Section({Left = NameItem.PopUp}, {Name = "Name Settings"})

            NameSection:Colorpicker({Name = "Name Color", Flag = MainFlag .. "name_color" .. flag})

            Library.Dropdown({Holder = NameSection.Holder, ContentHolder = Library.Popups}, {Name = "Name Font", Values = ESPFonts, Value = "Minecraftia", Flag = MainFlag .. "name_font" .. flag})
            NameSection:Slider({Name = "Name Size", Suffix = "px", Min = 0, Max = 30, Float = 1, Value = 10, Flag = MainFlag .. "name_size" .. flag})

            Library.Dropdown({Holder = NameSection.Holder, ContentHolder = Library.Popups}, {Name = "Text Case", Values = {"Normal", "UPPERCASE", "lowercase"}, Value = "Normal", Flag = MainFlag .. "name_case" .. flag})

            NameSection:Slider({Name = "Max Name Length", Suffix = "px", Min = 0, Max = 30, Float = 1, Value = 10, Flag = MainFlag .. "name_max" .. flag})
            
            Preview.CreateSeperator(ESPItemsOne)
        --

        -- Distance
            local DistanceItem = Preview.CreateItem("Distance", function(v)
                Library.Flags[MainFlag .. "distance" .. flag] = v
            end)

            local DistanceSection = Library.Section({Left = DistanceItem.PopUp}, {Name = "Distance Settings"})

            DistanceSection:Colorpicker({Name = "Distance Color", Flag = MainFlag .. "distance_color" .. flag})
            
            Library.Dropdown({Holder = DistanceSection.Holder, ContentHolder = Library.Popups}, {Name = "Distance Font", Values = ESPFonts, Value = "Minecraftia", Flag = MainFlag .. "distance_font" .. flag})
            DistanceSection:Slider({Name = "Distance Size", Suffix = "px", Min = 0, Max = 30, Float = 1, Value = 10, Flag = MainFlag .. "distance_size" .. flag})
        
            Library.Dropdown({Holder = DistanceSection.Holder, ContentHolder = Library.Popups}, {Name = "Distance Case", Values = {"Normal", "UPPERCASE", "lowercase"}, Value = "Normal", Flag = MainFlag .. "distance_case" .. flag})
        
            Preview.CreateSeperator(ESPItemsOne)
        --

        -- Health Bar
            local HealthBarItem = Preview.CreateItem("Health Bar", function(v)
                Library.Flags[MainFlag .. "health_bar" .. flag] = v
            end)

            HealthBarItem.PopUp.Size = UDim2new(0, 250, 0, 154)

            local HealthBarSection = Library.Section({Left = HealthBarItem.PopUp}, {Name = "Health Bar Settings"})

            HealthBarSection:Colorpicker({Name = "Health Bar Color", Flag = MainFlag .. "health_bar_color" .. flag, Color = Color3fromRGB(0, 255, 0)})
            HealthBarSection:Colorpicker({Name = "Health Bar Outline Color", Flag = MainFlag .. "health_bar_outline" .. flag, Color = Color3fromRGB(0, 0, 0), Transparency = 0.5})
                
            HealthBarSection:Slider({Name = "Health Bar Size", Flag = MainFlag .. "health_bar_size" .. flag, Suffix = "px", Min = 1, Max = 50, Float = 1, Value = 2})

            local HealthBarGradientTog = HealthBarSection:Toggle({Name = "Health Bar Gradient", Flag = MainFlag .. "health_bar_gradient" .. flag})
            HealthBarGradientTog:Colorpicker({Name = "From Gradient Color", Flag = MainFlag .. "health_bar_gradient_from_color" .. flag, Color = Color3fromRGB(0, 255, 0)})
            HealthBarGradientTog:Colorpicker({Name = "To Gradient Color", Flag = MainFlag .. "health_bar_gradient_to_color" .. flag, Color = Color3fromRGB(255, 0, 0)})

            HealthBarSection:Toggle({Name = "Gradient Rainbow", Flag = MainFlag .. "health_bar_gradient_rainbow" .. flag})
            HealthBarSection:Slider({Name = "Rainbow Speed", Flag = MainFlag .. "health_bar_gradient_rainbow_speed" .. flag, Min = 0, Max = 100, Float = 1, Value = 50})
        --

        -- Health Number
            local HealthNumberItem = Preview.CreateItem("Health Number", function(v)
                Library.Flags[MainFlag .. "health_number" .. flag] = v
            end, ESPItemsSecond)

            local HealthNumberSection = Library.Section({Left = HealthNumberItem.PopUp}, {Name = "Health Number Settings"})

            HealthNumberSection:Colorpicker({Name = "Health Number Color", Flag = MainFlag .. "health_number_color" .. flag})

            HealthNumberSection:Toggle({Name = "Follow Health Bar", Flag = MainFlag .. "health_number_follow" .. flag})

            Library.Dropdown({Holder = HealthNumberSection.Holder, ContentHolder = Library.Popups}, {Name = "Health Number Font", Values = ESPFonts, Value = "Minecraftia", Flag = MainFlag .. "health_number_font" .. flag})
            HealthNumberSection:Slider({Name = "Health Number Size", Suffix = "px", Min = 0, Max = 30, Float = 1, Value = 10, Flag = MainFlag .. "health_number_size" .. flag})
        
            Preview.CreateSeperator(ESPItemsSecond)
        --

        -- Image
            local ImageItem = Preview.CreateItem("Image", function(v)
                Library.Flags[MainFlag .. "image" .. flag] = v
            end, ESPItemsSecond)

            local ImageSection = Library.Section({Left = ImageItem.PopUp}, {Name = "Image Settings"})

            local ImageDirectory = `{Library.Folder}/Images/`

            local _, FileNames = Utility.GetFiles("Images", {".png", ".jpeg"})
            
            local ImageType = Library.Dropdown({Holder = ImageSection.Holder, ContentHolder = Library.Popups}, {Name = "Image Type", Values = FileNames, Value = "-", Flag = MainFlag .. "image_type" .. flag, Callback = function(v)
                if v ~= "-" then
                    local FileType = isfile(ImageDirectory .. v .. ".png") and "png" or isfile(ImageDirectory .. v .. ".jpeg") and "jpeg"
                    local File = isfile(ImageDirectory .. v .. ".png") and getcustomasset(ImageDirectory .. v .. ".png") or isfile(ImageDirectory .. v .. ".jpeg") and getcustomasset(ImageDirectory .. v .. ".jpeg")

                    if File then
                        if flag == "_enemy" then
                            ESP.EnemyImage = File
                            ESP.EnemyFileType = FileType
                        elseif flag == "_team" then
                            ESP.TeamImage = File
                            ESP.TeamFileType = FileType
                        else
                            ESP.LocalImage = File
                            ESP.LocalFileType = FileType
                        end
                    end
                end
            end})

            ImageSection:Button({Name = "Refresh", Callback = function(v)
                local _, FileNames = Utility.GetFiles("Images", {".png", ".jpeg"})

                ImageType.Refresh(FileNames)
            end})
        
            Preview.CreateSeperator(ESPItemsSecond)
        --

        -- Tool
            local ToolItem = Preview.CreateItem("Tool", function(v)
                Library.Flags[MainFlag .. "tool" .. flag] = v
            end, ESPItemsSecond)

            ToolItem.PopUp.Size = UDim2new(0, 250, 0, 180)

            local ToolSection = Library.Section({Left = ToolItem.PopUp}, {Name = "Tool Settings"})

            ToolSection:Colorpicker({Name = "Tool Color", Flag = MainFlag .. "tool_color" .. flag})

            Library.Dropdown({Holder = ToolSection.Holder, ContentHolder = Library.Popups}, {Name = "Tool Font", Values = ESPFonts, Value = "Minecraftia", Flag = MainFlag .. "tool_font" .. flag})
            ToolSection:Slider({Name = "Tool Size", Suffix = "px", Min = 0, Max = 30, Float = 1, Value = 10, Flag = MainFlag .. "tool_size" .. flag})
        
            Library.Dropdown({Holder = ToolSection.Holder, ContentHolder = Library.Popups}, {Name = "Tool Case", Values = {"Normal", "UPPERCASE", "lowercase"}, Value = "Normal", Flag = MainFlag .. "tool_case" .. flag})

            ToolSection:Slider({Name = "Max Tool Length", Suffix = "px", Min = 0, Max = 30, Float = 1, Value = 10, Flag = MainFlag .. "tool_max" .. flag}) 
        
            Preview.CreateSeperator(ESPItemsSecond)
        --

        -- Force Field
            local ForceFieldItem = Preview.CreateItem("Force Field", function(v)
                Library.Flags[MainFlag .. "force" .. flag] = v
            end, ESPItemsSecond)

            local ForceFieldSection = Library.Section({Left = ForceFieldItem.PopUp}, {Name = "Force Field Settings"})

            ForceFieldSection:Colorpicker({Name = "Force Field Color", Flag = MainFlag .. "force_color" .. flag})

            Library.Dropdown({Holder = ForceFieldSection.Holder, ContentHolder = Library.Popups}, {Name = "Force Field Font", Values = ESPFonts, Value = "Minecraftia", Flag = MainFlag .. "force_font" .. flag})
            ForceFieldSection:Slider({Name = "Force Field Size", Suffix = "px", Min = 0, Max = 30, Float = 1, Value = 10, Flag = MainFlag .. "force_size" .. flag})
        
            Library.Dropdown({Holder = ForceFieldSection.Holder, ContentHolder = Library.Popups}, {Name = "Force Field Case", Values = {"Normal", "UPPERCASE", "lowercase"}, Value = "Normal", Flag = MainFlag .. "force_case" .. flag})
        
            Preview.CreateSeperator(ESPItemsSecond)
        --

        -- Target
            local TargetItem = Preview.CreateItem("Target", function(v)
                Library.Flags[MainFlag .. "target" .. flag] = v
            end, ESPItemsSecond)

            local TargetSection = Library.Section({Left = TargetItem.PopUp}, {Name = "Target Settings"})

            TargetSection:Colorpicker({Name = "Target Color", Flag = MainFlag .. "target_color" .. flag})

            Library.Dropdown({Holder = TargetSection.Holder, ContentHolder = Library.Popups}, {Name = "Target Font", Values = ESPFonts, Value = "Minecraftia", Flag = MainFlag .. "target_font" .. flag})
            TargetSection:Slider({Name = "Target Size", Suffix = "px", Min = 0, Max = 30, Float = 1, Value = 10, Flag = MainFlag .. "target_size" .. flag})
        
            Library.Dropdown({Holder = TargetSection.Holder, ContentHolder = Library.Popups}, {Name = "Target Case", Values = {"Normal", "UPPERCASE", "lowercase"}, Value = "Normal", Flag = MainFlag .. "target_case" .. flag})
        --

        local PlayerTable = {
            Drawings = {},
            Health = 0,
            Offsets = {},
            StaticOffsets = {
                Right = 0,
                Bottom = 0
            },
            Sides = {
                Right = Vector2zero,
                Bottom = Vector2zero
            }
        }

        PlayerTable.Drawings = {}

        local Holder = BoxHolder
        local Drawings = PlayerTable.Drawings
        local StaticOffsets = PlayerTable.StaticOffsets
        local Sides = PlayerTable.Sides
        local Offsets = PlayerTable.Offsets

        Drawings.Box = Utility:New("Frame", {
            Parent = Holder,
            Visible = false,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
        })
        Drawings.BoxFill = Utility:New("Frame", {
            Parent = Drawings.Box,
            Visible = true,
            BackgroundTransparency = 1,
            Position = UDim2new(0, -1, 0, -1),
            Size = UDim2new(1, 2, 1, 2),
            BorderSizePixel = 0,
        })
        Drawings.BoxOutline = Utility:New("UIStroke", {
            Parent = Drawings.Box,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            LineJoinMode = Enum.LineJoinMode.Miter,
            Thickness = 3,
            Color = Color3fromRGB()   
        })
        Drawings.BoxInline = Utility:New("UIStroke", {
            Parent = Drawings.BoxFill,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            LineJoinMode = Enum.LineJoinMode.Miter,
            Thickness = 1,  
        })
        Drawings.BoxGradient = Utility:New("UIGradient", {
            Enabled = false,
            Rotation = 270,
            Parent = Drawings.BoxInline
        })
        Drawings.BoxFillGradient = Utility:New("UIGradient", {
            Enabled = false,
            Rotation = 270,
            Parent = Drawings.BoxFill
        })
        Drawings.Name = Utility:New("TextLabel", {
            Parent = Holder,
            Visible = false,
            AutomaticSize = Enum.AutomaticSize.XY,
            Size = UDim2new(0, 0, 0, 0),
            Position = UDim2new(0, 0, 0, 0),
            TextYAlignment = Enum.TextYAlignment.Top,
            TextStrokeTransparency = 0,
            BackgroundTransparency = 1,
            RichText = true,
        })
        Drawings.HealthBarOutline = Utility:New("Frame", {
            Visible = false,
            BorderSizePixel = 0,
            Parent = Holder,
        })
        Drawings.HealthBar = Utility:New("Frame", {
            Visible = true,
            BorderSizePixel = 0,
            Parent = Drawings.HealthBarOutline,
        })
        Drawings.HealthBarGradient = Utility:New("UIGradient", {
            Enabled = false,
            Rotation = 270,
            Parent = Drawings.HealthBar
        })
        Drawings.HealthNumber = Utility:New("TextLabel", {
            Parent = Holder,
            Visible = false,
            AutomaticSize = Enum.AutomaticSize.XY,
            Size = UDim2new(0, 0, 0, 0),
            Position = UDim2new(0, 0, 0, 0),
            TextYAlignment = Enum.TextYAlignment.Top,
            TextStrokeTransparency = 0,
            BackgroundTransparency = 1,
        })
        Drawings.ImageLabel = Utility:New("ImageLabel", {
            Parent = Holder,
            Visible = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
        })

        function PlayerTable.CreateFlag(flag, text, colortbl, font, size, status, side, overwrite)
            local Position = Sides[side]

            local object = Drawings[flag]

            if not object then
                Drawings[flag] = Utility:New("TextLabel", {
                    Parent = Holder,
                    Visible = false,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    Size = UDim2new(0, 0, 0, 0),
                    Position = UDim2new(0, 0, 0, 0),
                    TextYAlignment = Enum.TextYAlignment.Top,
                    TextStrokeTransparency = 0,
                    BackgroundTransparency = 1,
                })

                object = Drawings[flag]
            end

            local OffsetFlag = flag .. side

            if not Offsets[OffsetFlag] then
                Offsets[OffsetFlag] = 1
            end

            local EndVal = status and 255 or 0

            if Offsets[OffsetFlag] ~= EndVal then
                Offsets[OffsetFlag] = Utility:Lerp(Offsets[OffsetFlag], EndVal, 0.1)
            end

            if Offsets[OffsetFlag] == 0 then
                object.Visible = false

                return
            end

            object.Visible = true

            object.Text = text

            local LerpVal = Offsets[OffsetFlag] / 255

            object.TextTransparency = 1 - (colortbl.a * LerpVal)
            object.TextColor3 = overwrite or colortbl.c
            object.FontFace = GetFontFromIndex(Fonts[font])
            object.TextSize = size
            object.Position = side == "Right" and UDim2new(0, Position.x, 0, Position.y + StaticOffsets[side]) or UDim2new(0, Position.x - object.TextBounds.x / 2, 0, Position.y + StaticOffsets[side])

            StaticOffsets[side] += (object.TextBounds.y + 2) * LerpVal
        end
        
        local HealthBarLerp = 0
        local HealthBarDirection = 1

        Utility:Connect(RunService.Heartbeat, function(DT)
            if not tab.Page.Visible then
                return
            end

            if not ESPWindow.OutlineHolder.Visible then
                return
            end

            if not Library.Popups.Enabled then
                return
            end
            
            local TeamFlag = flag

            local ClockPulse = osclock()

            PlayerTable.Health = Utility:Lerp(PlayerTable.Health, PlayerTable.Health + HealthBarDirection * 100, 0.006)

            if PlayerTable.Health >= 100 then
                PlayerTable.Health = 100
                HealthBarDirection = -1
            elseif PlayerTable.Health <= 0 then
                PlayerTable.Health = 0
                HealthBarDirection = 1
            end

            local Health = PlayerTable.Health

            local HealthScale = Health / 100

            StaticOffsets = {
                Right = 0,
                Bottom = 0
            }

            Sides = {
                Right = BoxPosition + Vector2new(BoxSize.x + 4, -4),
                Bottom = BoxPosition + Vector2new(BoxSize.x / 2, BoxSize.y + 4)
            }

            local Box = Drawings.Box
            local BoxOutline = Drawings.BoxOutline
            local BoxInline = Drawings.BoxInline
            local BoxGradient = Drawings.BoxGradient

            local BoxStatus = Flags[MainFlag .. "box" .. TeamFlag]
            Box.Visible = BoxStatus
            if BoxStatus then
                Box.Size = UDim2offset(BoxSize.X - 2, BoxSize.Y - 2)
                Box.Position = UDim2offset(BoxPosition.X + 1, BoxPosition.Y + 1)

                BoxOutline.Transparency = 1 - Flags[MainFlag .. "box_outline" .. TeamFlag].a
                BoxOutline.Color = Flags[MainFlag .. "box_outline" .. TeamFlag].c

                local BoxGradientStatus = Flags[MainFlag .. "box_gradient" .. TeamFlag]

                BoxGradient.Enabled = BoxGradientStatus

                if BoxGradientStatus then 
                    BoxInline.Color = Color3fromRGB(255, 255, 255)
                    BoxInline.Transparency = 0
                    local Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Flags[MainFlag .. "box_gradient_from_color" .. TeamFlag].c), 
                        ColorSequenceKeypoint.new(1, Flags[MainFlag .. "box_gradient_to_color" .. TeamFlag].c)
                    })

                    local Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1 - Flags[MainFlag .. "box_gradient_from_color" .. TeamFlag].a),
                        NumberSequenceKeypoint.new(1, 1 - Flags[MainFlag .. "box_gradient_to_color" .. TeamFlag].a),
                    })

                    if Flags[MainFlag .. "box_gradient_rainbow" .. TeamFlag] then 
                        local Time = tick()
                        local HueStart = (Time / 5) % 1
                        local HueEnd = (HueStart + (Flags[MainFlag .. "box_gradient_rainbow_speed" .. TeamFlag] / 100)) % 1 
                    
                        local ColorStart = Color3fromHSV(HueStart, 1, 1)
                        local ColorEnd = Color3fromHSV(HueEnd, 1, 1)
                    
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, ColorStart),
                            ColorSequenceKeypoint.new(1, ColorEnd)
                        })
                    end

                    BoxGradient.Color = Color 
                    BoxGradient.Transparency = Transparency 
                else
                    BoxInline.Color = Flags[MainFlag .. "box_color" .. TeamFlag].c
                    BoxInline.Transparency = 1 - Flags[MainFlag .. "box_color" .. TeamFlag].a
                end
            end

            local BoxFill = Drawings.BoxFill
            local BoxFillGradient = Drawings.BoxFillGradient

            if Flags[MainFlag .. "box_fill" .. TeamFlag] then
                local BoxFillGradientStatus = Flags[MainFlag .. "box_fill_gradient" .. TeamFlag]

                BoxFillGradient.Enabled = BoxFillGradientStatus

                if BoxFillGradientStatus then 
                    BoxFill.BackgroundColor3 = Color3fromRGB(255, 255, 255)
                    BoxFill.BackgroundTransparency = 0

                    local Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Flags[MainFlag .. "box_fill_gradient_from_color" .. TeamFlag].c), 
                        ColorSequenceKeypoint.new(1, Flags[MainFlag .. "box_fill_gradient_to_color" .. TeamFlag].c)
                    })

                    local Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1 - Flags[MainFlag .. "box_fill_gradient_from_color" .. TeamFlag].a),
                        NumberSequenceKeypoint.new(1, 1 - Flags[MainFlag .. "box_fill_gradient_to_color" .. TeamFlag].a),
                    })

                    if Flags[MainFlag .. "box_fill_gradient_rainbow" .. TeamFlag] then 
                        local Time = tick()
                        local HueStart = (Time / 5) % 1
                        local HueEnd = (HueStart + (Flags[MainFlag .. "box_fill_gradient_rainbow_speed" .. TeamFlag] / 100)) % 1 
                    
                        local ColorStart = Color3fromHSV(HueStart, 1, 1)
                        local ColorEnd = Color3fromHSV(HueEnd, 1, 1)
                    
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, ColorStart),
                            ColorSequenceKeypoint.new(1, ColorEnd)
                        })
                    end

                    BoxFillGradient.Color = Color 
                    BoxFillGradient.Transparency = Transparency 
                else
                    BoxFill.BackgroundColor3 = Flags[MainFlag .. "box_fill_color" .. TeamFlag].c
                    BoxFill.BackgroundTransparency = 1 - Flags[MainFlag .. "box_fill_color" .. TeamFlag].a
                end 
            end

            local ImageLabel = Drawings.ImageLabel

            local ImageId = TeamFlag == "_enemy" and ESP.EnemyImage or TeamFlag == "_team" and ESP.TeamImage or ESP.Image
            local FileType = TeamFlag == "_enemy" and ESP.EnemyFileType or TeamFlag == "_team" and ESP.TeamFileType or ESP.FileType
            local ImageStatus = Flags[MainFlag .. "image" .. TeamFlag] and ImageId

            ImageLabel.Visible = ImageStatus and FileType

            if ImageStatus then
                ImageLabel.Size = UDim2offset(BoxSize.x, BoxSize.y)
                ImageLabel.Position = UDim2offset(BoxPosition.x, BoxPosition.y)

                if ImageLabel.Image ~= ImageId then
                    ImageLabel.Image = ImageId
                end
            end

            local Name = Drawings.Name
            
            local NameStatus = Flags[MainFlag .. "name" .. TeamFlag]

            Name.Visible = NameStatus
            if NameStatus then
                Name.Position = UDim2offset(BoxPosition.x + BoxSize.x / 2 - Name.TextBounds.x / 2, BoxPosition.y - Name.TextBounds.y - 4)
                Name.TextColor3 = OverwritenColor or Flags[MainFlag .. "name_color" .. TeamFlag].c
                Name.TextTransparency = 1 - Flags[MainFlag .. "name_color" .. TeamFlag].a
                Name.Text = ESP.GetCase(("Player"):sub(0, Flags[MainFlag .. "name_max" .. TeamFlag]), Flags[MainFlag .. "name_case" .. TeamFlag])
                Name.FontFace = GetFontFromIndex(Fonts[Flags[MainFlag .. "name_font" .. TeamFlag]])
                Name.TextSize = Flags[MainFlag .. "name_size" .. TeamFlag]
            end

            local ToolStatus = Flags[MainFlag .. "tool" .. TeamFlag]

            PlayerTable.CreateFlag(
                "Tool", 
                ESP.GetCase("Tool", Flags[MainFlag .. "tool_case" .. TeamFlag]):sub(0, Flags[MainFlag .. "tool_max" .. TeamFlag]), 
                Flags[MainFlag .. "tool_color" .. TeamFlag], 
                Flags[MainFlag .. "tool_font" .. TeamFlag], 
                Flags[MainFlag .. "tool_size" .. TeamFlag], 
                ToolStatus, 
                "Bottom",
                OverwritenColor
            )

            local DistanceStatus = Flags[MainFlag .. "distance" .. TeamFlag]

            PlayerTable.CreateFlag(
                "Distance", 
                ESP.GetCase("100 ST", Flags[MainFlag .. "distance_case" .. TeamFlag]), 
                Flags[MainFlag .. "distance_color" .. TeamFlag], 
                Flags[MainFlag .. "distance_font" .. TeamFlag], 
                Flags[MainFlag .. "distance_size" .. TeamFlag], 
                DistanceStatus, 
                "Bottom",
                OverwritenColor
            )

            local HealthNumber = Drawings.HealthNumber
            local HealthBarOutline = Drawings.HealthBarOutline
            local HealthBar = Drawings.HealthBar
            local HealthBarGradient = Drawings.HealthBarGradient

            local HealthBarStatus = Flags[MainFlag .. "health_bar" .. TeamFlag]
            local HealthBarSize = Flags[MainFlag .. "health_bar_size" .. TeamFlag] + 2

            HealthBarOutline.Visible = HealthBarStatus

            if HealthBarStatus then
                HealthBarOutline.Size = UDim2offset(HealthBarSize, BoxSize.y + 4)
                HealthBarOutline.Position = UDim2offset(BoxPosition.x - 4 - HealthBarSize, BoxPosition.y - 2)
                HealthBarOutline.BackgroundColor3 = Flags[MainFlag .. "health_bar_outline" .. TeamFlag].c
                HealthBarOutline.BackgroundTransparency = 1 - Flags[MainFlag .. "health_bar_outline" .. TeamFlag].a

                local HealthScaleSize = (HealthBarOutline.AbsoluteSize.y - 2) * HealthScale

                HealthBar.Size = UDim2new(1, -2, 0, HealthScaleSize)
                HealthBar.Position = UDim2new(0, 1, 1, -(HealthScaleSize + 1))

                local HealthBarGradientStatus = Flags[MainFlag .. "health_bar_gradient" .. TeamFlag]

                HealthBarGradient.Enabled = HealthBarGradientStatus

                if HealthBarGradientStatus then 
                    HealthBar.BackgroundColor3 = Color3fromRGB(255, 255, 255)
                    HealthBar.BackgroundTransparency = 0

                    local Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Flags[MainFlag .. "health_bar_gradient_from_color" .. TeamFlag].c), 
                        ColorSequenceKeypoint.new(1, Flags[MainFlag .. "health_bar_gradient_to_color" .. TeamFlag].c)
                    })

                    local Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1 - Flags[MainFlag .. "health_bar_gradient_from_color" .. TeamFlag].a),
                        NumberSequenceKeypoint.new(1, 1 - Flags[MainFlag .. "health_bar_gradient_to_color" .. TeamFlag].a),
                    })

                    if Flags[MainFlag .. "health_bar_gradient_rainbow" .. TeamFlag] then 
                        local Time = tick()
                        local HueStart = (Time / 5) % 1
                        local HueEnd = (HueStart + (Flags[MainFlag .. "health_bar_gradient_rainbow_speed" .. TeamFlag] / 100)) % 1 
                    
                        local ColorStart = Color3fromHSV(HueStart, 1, 1)
                        local ColorEnd = Color3fromHSV(HueEnd, 1, 1)
                    
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, ColorStart),
                            ColorSequenceKeypoint.new(1, ColorEnd)
                        })
                    end

                    HealthBarGradient.Color = Color 
                    HealthBarGradient.Transparency = Transparency 
                else
                    HealthBar.BackgroundColor3 = Flags[MainFlag .. "health_bar_color" .. TeamFlag].c
                    HealthBar.BackgroundTransparency = 1 - Flags[MainFlag .. "health_bar_color" .. TeamFlag].a
                end 
            end

            local HealthNumberStatus = Flags[MainFlag .. "health_number" .. TeamFlag] and PlayerTable.Health <= 90

            HealthNumber.Visible = HealthNumberStatus

            if HealthNumberStatus then
                local HealthScaleSize = (HealthBarOutline.AbsoluteSize.y - 2) * HealthScale

                local FollowHealthBar = Flags[MainFlag .. "health_number_follow" .. TeamFlag]

                local HealthPosition = UDim2offset(BoxPosition.x - (HealthBarStatus and not FollowHealthBar and HealthBarOutline.Size.X.Offset + 4 or 4) - HealthNumber.TextBounds.x, BoxPosition.y - 6)

                if FollowHealthBar and HealthBarStatus then
                    HealthPosition = UDim2offset(BoxPosition.x - 4 - HealthBarSize / 2 - HealthNumber.TextBounds.x / 2, (BoxPosition.y + BoxSize.y) - HealthScaleSize - HealthNumber.TextBounds.y / 2)
                end

                HealthNumber.Position = HealthPosition
                HealthNumber.TextColor3 = Flags[MainFlag .. "health_number_color" .. TeamFlag].c
                HealthNumber.TextTransparency = 1 - Flags[MainFlag .. "health_number_color" .. TeamFlag].a
                HealthNumber.Text = tostring(mathfloor(PlayerTable.Health))
                HealthNumber.FontFace = GetFontFromIndex(Fonts[Flags[MainFlag .. "health_number_font" .. TeamFlag]])
                HealthNumber.TextSize = Flags[MainFlag .. "health_number_size" .. TeamFlag]
            end

            local ForceFieldStatus = Flags[MainFlag .. "force" .. TeamFlag]

            PlayerTable.CreateFlag(
                "Force Field", 
                ESP.GetCase("Force-Field", Flags[MainFlag .. "force_case" .. TeamFlag]), 
                Flags[MainFlag .. "force_color" .. TeamFlag], 
                Flags[MainFlag .. "force_font" .. TeamFlag], 
                Flags[MainFlag .. "force_size" .. TeamFlag], 
                ForceFieldStatus, 
                "Right"
            )

            local TargetStatus = Flags[MainFlag .. "target" .. TeamFlag]

            PlayerTable.CreateFlag(
                "Target", 
                ESP.GetCase("Target", Flags[MainFlag .. "target_case" .. TeamFlag]), 
                Flags[MainFlag .. "target_color" .. TeamFlag], 
                Flags[MainFlag .. "target_font" .. TeamFlag], 
                Flags[MainFlag .. "target_size" .. TeamFlag], 
                TargetStatus, 
                "Right"
            )
        end, "ESP Preview Heartbeat")
    end

    ESPPreview.Window = ESPWindow

    local Enemies = ESPWindow:Tab({Name = "Enemy"})

    ESPPreview:CreatePreview(Enemies, "players", "_enemy")

    ESPPreview.Enemies = Enemies

    -- local Teammates = ESPWindow:Tab({Name = "Team"})

    -- ESPPreview:CreatePreview(Teammates, "players", "_team")

    -- ESPPreview.Teammates = Teammates

    local Local = ESPWindow:Tab({Name = "Local"})

    ESPPreview:CreatePreview(Local, "players", "_local")

    ESPPreview.Local = Local

    local SettingsESP = ESPWindow:Tab({Name = "Options"})

    local SettingsESPHolder = Library:New("TextButton", {
        Name = "SettingsESPHolder",
        Parent = SettingsESP.Page,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2new(0, 0, 0, 0),
        Text = "",
        Size = UDim2new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
    })

    Library:New("UIListLayout", {
        Parent = SettingsESPHolder,
        FillDirection = Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDimnew(0, 4),
    })
    
    Library.Toggle({Holder = SettingsESPHolder}, {Name = "Highlight Targets", Flag = "esp_highlight_targets"}):Colorpicker({Name = "Targets Color", Flag = "esp_highlight_targets_color", Color = Color3fromRGB(255, 0, 0)})
    Library.Toggle({Holder = SettingsESPHolder}, {Name = "Highlight Friends", Flag = "esp_highlight_friends"}):Colorpicker({Name = "Friends Color", Flag = "esp_highlight_friends_color", Color = Color3fromRGB(0, 166, 255)})
    Library.Toggle({Holder = SettingsESPHolder}, {Name = "Highlight Priority", Flag = "esp_highlight_priority"}):Colorpicker({Name = "Priority Color", Flag = "esp_highlight_priority_color", Color = Color3fromRGB(0, 255, 115)})

    local LimitDistance
    Library.Toggle({Holder = SettingsESPHolder}, {Name = "Limit Distance", Flag = "esp_players_limit", Callback = function(v)
        if LimitDistance then
            LimitDistance.SetVisibility(v)
        end
    end})

    LimitDistance = Library.Slider({Holder = SettingsESPHolder}, {Name = "Limit Distance Amount", Visible = false, Flag = "esp_players_limit_amount", Suffix = "st", Min = 0, Max = 2000, Float = 1, Value = 700})

    Library.Dropdown({Holder = SettingsESPHolder, ContentHolder = Library.Popups}, {Name = "Box Sizing", Values = {"Simple", "Automatic"}, Value = "Simple", Flag = "esp_auto_sizing"})

    Library.Slider({Holder = SettingsESPHolder}, {Name = "Health Fade Speed", Min = 1, Max = 300, Float = 1, Value = 80, Flag = "esp_health_fade_speed"})

    Library.Button({Holder = SettingsESPHolder}, {Name = "Test Fade", Callback = function()
        for _,v in ESP.Players do
            v.Health = 0
        end
    end})

    ESPWindow.OutlineHolder.Visible = true
--

LoadingNotification.ClockTime = osclock() + 20
LoadingNotification.Text = ("Welcome to Puppyware, loaded cheat in %sms!\nExecuted at: %s. Press RightShift to open/close menu."):format(mathfloor((tick() - StartTick) * 1000), os.date("%H:%M:%S"))

Library:Notify({
    Text = "This cheat might be detected on\ngames with hook detection. Be cautious!",
    Time = 15,
    Type = "Warning",
})

RefreshPlayers()
