local v0 = {};
local v1 = nil;
local v2 = cloneref or function(...) --[[ Line: 14 ]]
    return ...;
end;
local v2741 = {
    Explorer = function() --[[ Line: 17 ]] --[[ Name: Explorer ]]
        local v3 = nil;
        local v4 = nil;
        local v5 = nil;
        local v6 = nil;
        local v7 = nil;
        local v8 = nil;
        local v9 = nil;
        local v10 = nil;
        local v11 = nil;
        local v12 = nil;
        local v13 = nil;
        local v14 = nil;
        local v15 = nil;
        local v16 = nil;
        local v17 = nil;
        local function v19(v18) --[[ Line: 29 ]] --[[ Name: initDeps ]]
            v3 = v18.Main;
            v4 = v18.Lib;
            v5 = v18.Apps;
            v6 = v18.Settings;
            v11 = v18.API;
            v12 = v18.RMD;
            v13 = v18.env;
            v14 = v18.service;
            v15 = v18.plr;
            v16 = v18.create;
            v17 = v18.createSimple;
        end;
        local function v20() --[[ Line: 44 ]] --[[ Name: initAfterMain ]]
            v7 = v5.Explorer;
            v8 = v5.Properties;
            v9 = v5.ScriptViewer;
            v10 = v5.Notebook;
        end;
        local function v574() --[[ Line: 51 ]] --[[ Name: main ]]
            local v21 = {};
            local v22 = {};
            local v23 = {};
            local v24 = {};
            local v25 = {};
            local v26 = {};
            local v27 = nil;
            local v28 = nil;
            local v29 = nil;
            local v30 = nil;
            local v31 = nil;
            local v32 = nil;
            local v33 = nil;
            local l_FindFirstAncestorWhichIsA_0 = game.FindFirstAncestorWhichIsA;
            local l_GetDescendants_0 = game.GetDescendants;
            local l_GetTextSize_0 = v14.TextService.GetTextSize;
            local v37 = false;
            local v38 = false;
            local v39 = {
                Obj = Instance.new("Folder")
            };
            local v40 = 0;
            local v41 = nil;
            local v42 = nil;
            local v43 = nil;
            local v44 = nil;
            local v45 = nil;
            local v46 = nil;
            local v47 = nil;
            local v48 = nil;
            local l_table_0 = table;
            local l_math_0 = math;
            local v51 = {};
            local v52 = {};
            local l_Connect_0 = game.DescendantAdded.Connect;
            local v54 = nil;
            local v55 = nil;
            local v56 = nil;
            v54 = function(v57) --[[ Line: 70 ]]
                if v0[v57] then
                    return;
                else
                    local v58 = false;
                    local v59 = l_FindFirstAncestorWhichIsA_0(v57, "Instance");
                    local v60 = v0[v59];
                    if not v60 then
                        if v51[v57] then
                            v52[v57] = v52[v57] or {
                                l_Connect_0(v57.ChildAdded, v54), 
                                l_Connect_0(v57.AncestryChanged, v56)
                            };
                            v60 = v39;
                            v58 = true;
                        else
                            return;
                        end;
                    elseif v51[v59] or v60 == v39 then
                        v51[v57] = true;
                        v52[v57] = v52[v57] or {
                            l_Connect_0(v57.ChildAdded, v54), 
                            l_Connect_0(v57.AncestryChanged, v56)
                        };
                        v58 = true;
                    end;
                    local v61 = {
                        Obj = v57, 
                        Parent = v60
                    };
                    v0[v57] = v61;
                    if v47 and v27[v60] and v60.Sorted then
                        local v62 = 1;
                        local v63 = #v60;
                        local l_floor_0 = l_math_0.floor;
                        local l_NodeSorter_0 = v21.NodeSorter;
                        local v66 = false;
                        if v63 == 0 then
                            v66 = 1;
                        end;
                        if not v66 then
                            while v63 > v62 do
                                local v67 = l_floor_0((v62 + v63) / 2);
                                if l_NodeSorter_0(v61, v60[v67]) then
                                    v63 = v67 - 1;
                                else
                                    v62 = v67 + 1;
                                end;
                            end;
                            v66 = if l_NodeSorter_0(v61, v60[v62]) then v62 else v62 + 1;
                        end;
                        l_table_0.insert(v60, v66, v61);
                    else
                        v60[#v60 + 1] = v61;
                        v60.Sorted = nil;
                    end;
                    local v68 = l_GetDescendants_0(v57);
                    for v69 = 1, #v68 do
                        local v70 = v68[v69];
                        if not v0[v70] then
                            local v71 = v0[l_FindFirstAncestorWhichIsA_0(v70, "Instance")];
                            if v71 then
                                local v72 = {
                                    Obj = v70, 
                                    Parent = v71
                                };
                                v0[v70] = v72;
                                v71[#v71 + 1] = v72;
                                if v58 then
                                    v51[v70] = true;
                                    v52[v70] = v52[v70] or {
                                        l_Connect_0(v70.ChildAdded, v54), 
                                        l_Connect_0(v70.AncestryChanged, v56)
                                    };
                                end;
                            end;
                        end;
                    end;
                    if v46 and v48 then
                        v46({
                            v61
                        });
                    end;
                    if not v37 and v21.IsNodeVisible(v60) then
                        if v27[v60] then
                            v21.PerformUpdate();
                            return;
                        elseif not v38 then
                            v21.PerformRefresh();
                        end;
                    end;
                    return;
                end;
            end;
            v55 = function(v73) --[[ Line: 168 ]]
                local v74 = v0[v73];
                if not v74 then
                    return;
                elseif v51[v74.Obj] then
                    v56(v74.Obj);
                    return;
                else
                    local l_Parent_0 = v74.Parent;
                    if l_Parent_0 then
                        l_Parent_0.HasDel = true;
                    end;
                    local function v76(v77) --[[ Line: 183 ]] --[[ Name: recur ]]
                        for v78 = 1, #v77 do
                            local v79 = v77[v78];
                            if not v79.Del then
                                v0[v79.Obj] = nil;
                                if #v79 > 0 then
                                    v76(v79);
                                end;
                            end;
                        end;
                    end;
                    v76(v74);
                    v74.Del = true;
                    v0[v73] = nil;
                    if l_Parent_0 and not v37 and v21.IsNodeVisible(l_Parent_0) then
                        if v27[l_Parent_0] then
                            v21.PerformUpdate();
                            return;
                        elseif not v38 then
                            v21.PerformRefresh();
                        end;
                    end;
                    return;
                end;
            end;
            v56 = function(v80) --[[ Line: 205 ]]
                local v81 = v0[v80];
                if not v81 then
                    return;
                else
                    local l_Parent_1 = v81.Parent;
                    local v83 = v0[l_FindFirstAncestorWhichIsA_0(v80, "Instance")];
                    if l_Parent_1 == v83 then
                        return;
                    else
                        if not v83 then
                            if v51[v80] then
                                v83 = v39;
                            else
                                return;
                            end;
                        elseif v51[v83.Obj] or v83 == v39 then
                            v51[v80] = true;
                            v52[v80] = v52[v80] or {
                                l_Connect_0(v80.ChildAdded, v54), 
                                l_Connect_0(v80.AncestryChanged, v56)
                            };
                        end;
                        if l_Parent_1 then
                            local v84 = l_table_0.find(l_Parent_1, v81);
                            if v84 then
                                l_table_0.remove(l_Parent_1, v84);
                            end;
                        end;
                        v81.Id = nil;
                        v81.Parent = v83;
                        if v47 and v27[v83] and v83.Sorted then
                            local v85 = 1;
                            local v86 = #v83;
                            local l_floor_1 = l_math_0.floor;
                            local l_NodeSorter_1 = v21.NodeSorter;
                            local v89 = false;
                            if v86 == 0 then
                                v89 = 1;
                            end;
                            if not v89 then
                                while v86 > v85 do
                                    local v90 = l_floor_1((v85 + v86) / 2);
                                    if l_NodeSorter_1(v81, v83[v90]) then
                                        v86 = v90 - 1;
                                    else
                                        v85 = v90 + 1;
                                    end;
                                end;
                                v89 = if l_NodeSorter_1(v81, v83[v85]) then v85 else v85 + 1;
                            end;
                            l_table_0.insert(v83, v89, v81);
                        else
                            v83[#v83 + 1] = v81;
                            v83.Sorted = nil;
                        end;
                        if v46 and v25[v81] then
                            local l_Parent_2 = v81.Parent;
                            while l_Parent_2 and (not v25[l_Parent_2] or v27[l_Parent_2] == 0) do
                                v27[l_Parent_2] = true;
                                v25[l_Parent_2] = true;
                                l_Parent_2 = l_Parent_2.Parent;
                            end;
                        end;
                        if not v37 and (v21.IsNodeVisible(v83) or v21.IsNodeVisible(l_Parent_1)) then
                            if v27[v83] or v27[l_Parent_1] then
                                v21.PerformUpdate();
                                return;
                            elseif not v38 then
                                v21.PerformRefresh();
                            end;
                        end;
                        return;
                    end;
                end;
            end;
            v21.ViewWidth = 0;
            v21.Index = 0;
            v21.EntryIndent = 20;
            v21.FreeWidth = 32;
            v21.GuiElems = {};
            v21.InitRenameBox = function() --[[ Line: 292 ]]
                v44 = v16({
                    {
                        1, 
                        "TextBox", 
                        {
                            BackgroundColor3 = Color3.new(0.17647059261799, 0.17647059261799, 0.17647059261799), 
                            BorderColor3 = Color3.new(0.062745101749897, 0.51764708757401, 1), 
                            BorderMode = 2, 
                            ClearTextOnFocus = false, 
                            Font = 3, 
                            Name = "RenameBox", 
                            PlaceholderColor3 = Color3.new(0.69803923368454, 0.69803923368454, 0.69803923368454), 
                            Position = UDim2.new(0, 26, 0, 2), 
                            Size = UDim2.new(0, 200, 0, 16), 
                            Text = "", 
                            TextColor3 = Color3.new(1, 1, 1), 
                            TextSize = 14, 
                            TextXAlignment = 0, 
                            Visible = false, 
                            ZIndex = 2
                        }
                    }
                });
                v44.Parent = v21.Window.GuiElems.Content.List;
                v44.FocusLost:Connect(function() --[[ Line: 297 ]]
                    if not v45 then
                        return;
                    else
                        pcall(function() --[[ Line: 300 ]]
                            v45.Obj.Name = v44.Text;
                        end);
                        v45 = nil;
                        v21.Refresh();
                        return;
                    end;
                end);
                v44.Focused:Connect(function() --[[ Line: 305 ]]
                    v44.SelectionStart = 1;
                    v44.CursorPosition = #v44.Text + 1;
                end);
            end;
            v21.SetRenamingNode = function(v92) --[[ Line: 311 ]]
                v45 = v92;
                v44.Text = tostring(v92.Obj);
                v44:CaptureFocus();
                v21.Refresh();
            end;
            v21.SetSortingEnabled = function(v93) --[[ Line: 318 ]]
                v47 = v93;
                v6.Explorer.Sorting = v93;
            end;
            v21.UpdateView = function() --[[ Line: 323 ]]
                local v94 = l_math_0.ceil(v29.AbsoluteSize.Y / 20);
                local l_X_0 = v29.AbsoluteSize.X;
                local v96 = v21.ViewWidth + v21.FreeWidth;
                v41.VisibleSpace = v94;
                v41.TotalSpace = #v22 + 1;
                v42.VisibleSpace = l_X_0;
                v42.TotalSpace = v96;
                v41.Gui.Visible = v94 < #v22 + 1;
                v42.Gui.Visible = l_X_0 < v96;
                local l_Size_0 = v29.Size;
                v29.Size = UDim2.new(1, v41.Gui.Visible and -16 or 0, 1, v42.Gui.Visible and -39 or -23);
                if l_Size_0 ~= v29.Size then
                    v21.UpdateView();
                    return;
                else
                    v41:Update();
                    v42:Update();
                    v44.Size = UDim2.new(0, l_X_0 - 100, 0, 16);
                    if v41.Gui.Visible and v42.Gui.Visible then
                        v41.Gui.Size = UDim2.new(0, 16, 1, -39);
                        v42.Gui.Size = UDim2.new(1, -16, 0, 16);
                        v21.Window.GuiElems.Content.ScrollCorner.Visible = true;
                    else
                        v41.Gui.Size = UDim2.new(0, 16, 1, -23);
                        v42.Gui.Size = UDim2.new(1, 0, 0, 16);
                        v21.Window.GuiElems.Content.ScrollCorner.Visible = false;
                    end;
                    v21.Index = v41.Index;
                    return;
                end;
            end;
            v21.NodeSorter = function(v98, v99) --[[ Line: 360 ]]
                if v98.Del or v99.Del then
                    return false;
                else
                    local l_Class_0 = v98.Class;
                    local l_Class_1 = v99.Class;
                    if not l_Class_0 then
                        l_Class_0 = v98.Obj.ClassName;
                        v98.Class = l_Class_0;
                    end;
                    if not l_Class_1 then
                        l_Class_1 = v99.Obj.ClassName;
                        v99.Class = l_Class_1;
                    end;
                    local v102 = v24[l_Class_0];
                    local v103 = v24[l_Class_1];
                    if not v102 then
                        v102 = v12.Classes[l_Class_0] and tonumber(v12.Classes[l_Class_0].ExplorerOrder) or 9999;
                        v24[l_Class_0] = v102;
                    end;
                    if not v103 then
                        v103 = v12.Classes[l_Class_1] and tonumber(v12.Classes[l_Class_1].ExplorerOrder) or 9999;
                        v24[l_Class_1] = v103;
                    end;
                    if v102 ~= v103 then
                        return v102 < v103;
                    else
                        local v104 = tostring(v98.Obj);
                        local v105 = tostring(v99.Obj);
                        if v104 ~= v105 then
                            return v104 < v105;
                        elseif l_Class_0 ~= l_Class_1 then
                            return l_Class_0 < l_Class_1;
                        else
                            local l_Id_0 = v98.Id;
                            if not l_Id_0 then
                                l_Id_0 = v40;
                                v40 = (v40 + 0.001) % 999999999;
                                v98.Id = l_Id_0;
                            end;
                            local l_Id_1 = v99.Id;
                            if not l_Id_1 then
                                l_Id_1 = v40;
                                v40 = (v40 + 0.001) % 999999999;
                                v99.Id = l_Id_1;
                            end;
                            return l_Id_0 < l_Id_1;
                        end;
                    end;
                end;
            end;
            v21.Update = function() --[[ Line: 389 ]]
                l_table_0.clear(v22);
                local v108 = 0;
                local v109 = 1;
                local v110 = 1;
                local v111 = {};
                local l_SourceSans_0 = Enum.Font.SourceSans;
                local v113 = Vector2.new(l_math_0.huge, 20);
                local l_UseNameWidth_0 = v6.Explorer.UseNameWidth;
                local l_sort_0 = l_table_0.sort;
                local l_NodeSorter_2 = v21.NodeSorter;
                local v117 = v27 == v21.SearchExpanded;
                local l_TextService_0 = v14.TextService;
                local function v119(v120, v121) --[[ Line: 401 ]] --[[ Name: recur ]]
                    if v109 < v121 then
                        v109 = v121;
                    end;
                    v121 = v121 + 1;
                    if v47 and not v120.Sorted then
                        l_sort_0(v120, l_NodeSorter_2);
                        v120.Sorted = true;
                    end;
                    for v122 = 1, #v120 do
                        local v123 = v120[v122];
                        if (not v117 or v25[v123]) and not v123.Del then
                            if l_UseNameWidth_0 then
                                local l_NameWidth_0 = v123.NameWidth;
                                if not l_NameWidth_0 then
                                    local v125 = tostring(v123.Obj);
                                    l_NameWidth_0 = v111[v125];
                                    if not l_NameWidth_0 then
                                        l_NameWidth_0 = l_GetTextSize_0(l_TextService_0, v125, 14, l_SourceSans_0, v113).X;
                                        v111[v125] = l_NameWidth_0;
                                    end;
                                    v123.NameWidth = l_NameWidth_0;
                                end;
                                if v108 < l_NameWidth_0 then
                                    v108 = l_NameWidth_0;
                                end;
                            end;
                            v22[v110] = v123;
                            v110 = v110 + 1;
                            if v27[v123] and #v123 > 0 then
                                v119(v123, v121);
                            end;
                        end;
                    end;
                end;
                v119(v0[game], 1);
                if v13.getnilinstances and (not v117 or v25[v39]) then
                    v22[v110] = v39;
                    v110 = v110 + 1;
                    if v27[v39] then
                        v119(v39, 2);
                    end;
                end;
                v21.MaxNameWidth = v108;
                v21.MaxDepth = v109;
                v21.ViewWidth = l_UseNameWidth_0 and v21.EntryIndent * v109 + v108 + 26 or v21.EntryIndent * v109 + 226;
                v21.UpdateView();
            end;
            v21.StartDrag = function(v126, v127) --[[ Line: 456 ]]
                if v21.Dragging then
                    return;
                else
                    v21.Dragging = true;
                    local v128 = v29:Clone();
                    v128:ClearAllChildren();
                    for v129, v130 in pairs(v23) do
                        local v131 = v22[v129 + v21.Index];
                        if v131 and v1.Map[v131] then
                            local v132 = v130:Clone();
                            v132.Active = false;
                            v132.Indent.Expand.Visible = false;
                            v132.Parent = v128;
                        end;
                    end;
                    local l_ScreenGui_0 = Instance.new("ScreenGui");
                    l_ScreenGui_0.DisplayOrder = v3.DisplayOrders.Menu;
                    v128.Parent = l_ScreenGui_0;
                    v4.ShowGui(l_ScreenGui_0);
                    local v134 = v16({
                        {
                            1, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BackgroundTransparency = 1, 
                                Name = "DragSelect", 
                                Size = UDim2.new(1, 0, 1, 0)
                            }
                        }, 
                        {
                            2, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BorderSizePixel = 0, 
                                Name = "Line", 
                                Parent = {
                                    1
                                }, 
                                Size = UDim2.new(1, 0, 0, 1), 
                                ZIndex = 2
                            }
                        }, 
                        {
                            3, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BorderSizePixel = 0, 
                                Name = "Line", 
                                Parent = {
                                    1
                                }, 
                                Position = UDim2.new(0, 0, 1, -1), 
                                Size = UDim2.new(1, 0, 0, 1), 
                                ZIndex = 2
                            }
                        }, 
                        {
                            4, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BorderSizePixel = 0, 
                                Name = "Line", 
                                Parent = {
                                    1
                                }, 
                                Size = UDim2.new(0, 1, 1, 0), 
                                ZIndex = 2
                            }
                        }, 
                        {
                            5, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BorderSizePixel = 0, 
                                Name = "Line", 
                                Parent = {
                                    1
                                }, 
                                Position = UDim2.new(1, -1, 0, 0), 
                                Size = UDim2.new(0, 1, 1, 0), 
                                ZIndex = 2
                            }
                        }
                    });
                    v134.Parent = v29;
                    local v135 = v3.Mouse or v14.Players.LocalPlayer:GetMouse();
                    local function v140() --[[ Line: 489 ]] --[[ Name: move ]]
                        local v136 = v135.X - v126;
                        local v137 = v135.Y - v127;
                        v128.Position = UDim2.new(0, v136, 0, v137);
                        for v138 = 1, #v23 do
                            local v139 = v23[v138];
                            if v4.CheckMouseInGui(v139) then
                                v134.Position = UDim2.new(0, v139.Indent.Position.X.Offset - v42.Index, 0, v139.Position.Y.Offset);
                                v134.Size = UDim2.new(0, v139.Size.X.Offset - v139.Indent.Position.X.Offset, 0, 20);
                                v134.Visible = true;
                                return;
                            end;
                        end;
                        v134.Visible = false;
                    end;
                    v140();
                    local l_UserInputService_0 = v14.UserInputService;
                    local v142 = nil;
                    local v143 = nil;
                    v142 = l_UserInputService_0.InputChanged:Connect(function(v144) --[[ Line: 510 ]]
                        if v144.UserInputType == Enum.UserInputType.MouseMovement then
                            v140();
                        end;
                    end);
                    v143 = l_UserInputService_0.InputEnded:Connect(function(v145) --[[ Line: 516 ]]
                        if v145.UserInputType == Enum.UserInputType.MouseButton1 then
                            v143:Disconnect();
                            v142:Disconnect();
                            l_ScreenGui_0:Destroy();
                            v134:Destroy();
                            v21.Dragging = false;
                            for v146 = 1, #v23 do
                                if v4.CheckMouseInGui(v23[v146]) then
                                    local v147 = v22[v146 + v21.Index];
                                    if v147 then
                                        if v1.Map[v147] then
                                            return;
                                        else
                                            local l_Obj_0 = v147.Obj;
                                            local l_List_0 = v1.List;
                                            for v150 = 1, #l_List_0 do
                                                local v151 = l_List_0[v150];
                                                pcall(function() --[[ Line: 533 ]]
                                                    v151.Obj.Parent = l_Obj_0;
                                                end);
                                            end;
                                            v21.ViewNode(l_List_0[1]);
                                            return;
                                        end;
                                    else
                                        break;
                                    end;
                                end;
                            end;
                        end;
                    end);
                    return;
                end;
            end;
            v21.NewListEntry = function(v152) --[[ Line: 544 ]]
                local v153 = v28:Clone();
                v153.Position = UDim2.new(0, 0, 0, 20 * (v152 - 1));
                local v154 = false;
                v153.InputBegan:Connect(function(v155) --[[ Line: 550 ]]
                    local v156 = v22[v152 + v21.Index];
                    if not v156 or v1.Map[v156] or v155.UserInputType ~= Enum.UserInputType.MouseMovement then
                        return;
                    else
                        v153.Indent.BackgroundColor3 = v6.Theme.Button;
                        v153.Indent.BorderSizePixel = 0;
                        v153.Indent.BackgroundTransparency = 0;
                        return;
                    end;
                end);
                v153.InputEnded:Connect(function(v157) --[[ Line: 559 ]]
                    local v158 = v22[v152 + v21.Index];
                    if not v158 or v1.Map[v158] or v157.UserInputType ~= Enum.UserInputType.MouseMovement then
                        return;
                    else
                        v153.Indent.BackgroundTransparency = 1;
                        return;
                    end;
                end);
                v153.MouseButton1Down:Connect(function() --[[ Line: 566 ]]

                end);
                v153.MouseButton1Up:Connect(function() --[[ Line: 570 ]]

                end);
                v153.InputBegan:Connect(function(v159) --[[ Line: 574 ]]
                    if v159.UserInputType == Enum.UserInputType.MouseButton1 then
                        local v160 = nil;
                        local v161 = nil;
                        local v162 = v3.Mouse or v15:GetMouse();
                        local l_X_1 = v162.X;
                        local l_Y_0 = v162.Y;
                        local v165 = l_X_1 - v29.AbsolutePosition.X;
                        local v166 = l_Y_0 - v29.AbsolutePosition.Y;
                        do
                            local l_v160_0, l_v161_0 = v160, v161;
                            l_v160_0 = v2(game:GetService("UserInputService")).InputEnded:Connect(function(v169) --[[ Line: 585 ]]
                                if v169.UserInputType == Enum.UserInputType.MouseButton1 then
                                    l_v160_0:Disconnect();
                                    l_v161_0:Disconnect();
                                end;
                            end);
                            l_v161_0 = v2(game:GetService("UserInputService")).InputChanged:Connect(function(v170) --[[ Line: 592 ]]
                                if v170.UserInputType == Enum.UserInputType.MouseMovement then
                                    local v171 = v162.X - l_X_1;
                                    local v172 = v162.Y - l_Y_0;
                                    if l_math_0.sqrt(v171 ^ 2 + v172 ^ 2) > 5 then
                                        l_v160_0:Disconnect();
                                        l_v161_0:Disconnect();
                                        v154 = false;
                                        v21.StartDrag(v165, v166);
                                    end;
                                end;
                            end);
                        end;
                    end;
                end);
                v153.MouseButton2Down:Connect(function() --[[ Line: 609 ]]

                end);
                v153.Indent.Expand.InputBegan:Connect(function(v173) --[[ Line: 613 ]]
                    local v174 = v22[v152 + v21.Index];
                    if not v174 or v173.UserInputType ~= Enum.UserInputType.MouseMovement then
                        return;
                    else
                        v21.MiscIcons:DisplayByKey(v153.Indent.Expand.Icon, v27[v174] and "Collapse_Over" or "Expand_Over");
                        return;
                    end;
                end);
                v153.Indent.Expand.InputEnded:Connect(function(v175) --[[ Line: 620 ]]
                    local v176 = v22[v152 + v21.Index];
                    if not v176 or v175.UserInputType ~= Enum.UserInputType.MouseMovement then
                        return;
                    else
                        v21.MiscIcons:DisplayByKey(v153.Indent.Expand.Icon, v27[v176] and "Collapse" or "Expand");
                        return;
                    end;
                end);
                v153.Indent.Expand.MouseButton1Down:Connect(function() --[[ Line: 627 ]]
                    local v177 = v22[v152 + v21.Index];
                    if not v177 or #v177 == 0 then
                        return;
                    else
                        v27[v177] = not v27[v177];
                        v21.Update();
                        v21.Refresh();
                        return;
                    end;
                end);
                v153.Parent = v29;
                return v153;
            end;
            v21.Refresh = function() --[[ Line: 640 ]]
                local v178 = l_math_0.max(l_math_0.ceil(v29.AbsoluteSize.Y / 20), 0);
                local v179 = false;
                local l_IsA_0 = game.IsA;
                for v181 = 1, v178 do
                    local v182 = v23[v181];
                    if not v23[v181] then
                        v182 = v21.NewListEntry(v181);
                        v23[v181] = v182;
                        v21.ClickSystem:Add(v182);
                    end;
                    local v183 = v22[v181 + v21.Index];
                    if v183 then
                        local l_Obj_1 = v183.Obj;
                        local v185 = v21.EntryIndent * v21.NodeDepth(v183);
                        v182.Visible = true;
                        v182.Position = UDim2.new(0, -v42.Index, 0, v182.Position.Y.Offset);
                        v182.Size = UDim2.new(0, v21.ViewWidth, 0, 20);
                        v182.Indent.EntryName.Text = tostring(v183.Obj);
                        v182.Indent.Position = UDim2.new(0, v185, 0, 0);
                        v182.Indent.Size = UDim2.new(1, -v185, 1, 0);
                        v182.Indent.EntryName.TextTruncate = v6.Explorer.UseNameWidth and Enum.TextTruncate.None or Enum.TextTruncate.AtEnd;
                        if (l_IsA_0(l_Obj_1, "LocalScript") or l_IsA_0(l_Obj_1, "Script")) and l_Obj_1.Disabled then
                            v21.MiscIcons:DisplayByKey(v182.Indent.Icon, l_IsA_0(l_Obj_1, "LocalScript") and "LocalScript_Disabled" or "Script_Disabled");
                        else
                            local v186 = v12.Classes[l_Obj_1.ClassName];
                            v21.ClassIcons:Display(v182.Indent.Icon, v186 and v186.ExplorerImageIndex or 0);
                        end;
                        if v1.Map[v183] then
                            v182.Indent.BackgroundColor3 = v6.Theme.ListSelection;
                            v182.Indent.BorderSizePixel = 0;
                            v182.Indent.BackgroundTransparency = 0;
                        elseif v4.CheckMouseInGui(v182) then
                            v182.Indent.BackgroundColor3 = v6.Theme.Button;
                        else
                            v182.Indent.BackgroundTransparency = 1;
                        end;
                        if v183 == v45 then
                            v179 = true;
                            v44.Position = UDim2.new(0, v185 + 25 - v42.Index, 0, v182.Position.Y.Offset + 2);
                            v44.Visible = true;
                        end;
                        if #v183 > 0 and v27[v183] ~= 0 then
                            if v4.CheckMouseInGui(v182.Indent.Expand) then
                                v21.MiscIcons:DisplayByKey(v182.Indent.Expand.Icon, v27[v183] and "Collapse_Over" or "Expand_Over");
                            else
                                v21.MiscIcons:DisplayByKey(v182.Indent.Expand.Icon, v27[v183] and "Collapse" or "Expand");
                            end;
                            v182.Indent.Expand.Visible = true;
                        else
                            v182.Indent.Expand.Visible = false;
                        end;
                    else
                        v182.Visible = false;
                    end;
                end;
                if not v179 then
                    v44.Visible = false;
                end;
                for v187 = v178 + 1, #v23 do
                    v21.ClickSystem:Remove(v23[v187]);
                    v23[v187]:Destroy();
                    v23[v187] = nil;
                end;
            end;
            v21.PerformUpdate = function(v188) --[[ Line: 714 ]]
                v37 = true;
                v4.FastWait(not v188 and 0.1);
                if not v37 then
                    return;
                else
                    v37 = false;
                    if not v21.Window:IsVisible() then
                        return;
                    else
                        v21.Update();
                        v21.Refresh();
                        return;
                    end;
                end;
            end;
            v21.ForceUpdate = function(v189) --[[ Line: 724 ]]
                v37 = false;
                v21.Update();
                if not v189 then
                    v21.Refresh();
                end;
            end;
            v21.PerformRefresh = function() --[[ Line: 730 ]]
                v38 = true;
                v4.FastWait(0.1);
                v38 = false;
                if v37 or not v21.Window:IsVisible() then
                    return;
                else
                    v21.Refresh();
                    return;
                end;
            end;
            v21.IsNodeVisible = function(v190) --[[ Line: 738 ]]
                if not v190 then
                    return;
                else
                    local l_Parent_3 = v190.Parent;
                    while true do
                        if l_Parent_3 then
                            if not v27[l_Parent_3] then
                                return false;
                            else
                                l_Parent_3 = l_Parent_3.Parent;
                            end;
                        else
                            return true;
                        end;
                    end;
                end;
            end;
            v21.NodeDepth = function(v192) --[[ Line: 749 ]]
                local v193 = 0;
                if v192 == v39 then
                    return 1;
                else
                    local l_Parent_4 = v192.Parent;
                    while l_Parent_4 do
                        if l_Parent_4 == v39 then
                            v193 = v193 + 1;
                        end;
                        l_Parent_4 = l_Parent_4.Parent;
                        v193 = v193 + 1;
                    end;
                    return v193;
                end;
            end;
            v21.SetupConnections = function() --[[ Line: 765 ]]
                if v31 then
                    v31:Disconnect();
                end;
                if v32 then
                    v32:Disconnect();
                end;
                if v33 then
                    v33:Disconnect();
                end;
                if v3.Elevated then
                    v31 = game.DescendantAdded:Connect(v54);
                    v32 = game.DescendantRemoving:Connect(v55);
                else
                    v31 = game.DescendantAdded:Connect(function(v195) --[[ Line: 774 ]]
                        pcall(v54, v195);
                    end);
                    v32 = game.DescendantRemoving:Connect(function(v196) --[[ Line: 775 ]]
                        pcall(v55, v196);
                    end);
                end;
                if v6.Explorer.UseNameWidth then
                    v33 = game.ItemChanged:Connect(function(v197, v198) --[[ Line: 779 ]]
                        if v198 == "Parent" and v0[v197] then
                            v56(v197);
                            return;
                        else
                            if v198 == "Name" and v0[v197] then
                                v0[v197].NameWidth = nil;
                            end;
                            return;
                        end;
                    end);
                    return;
                else
                    v33 = game.ItemChanged:Connect(function(v199, v200) --[[ Line: 787 ]]
                        if v200 == "Parent" and v0[v199] then
                            v56(v199);
                        end;
                    end);
                    return;
                end;
            end;
            v21.ViewNode = function(v201) --[[ Line: 795 ]]
                if not v201 then
                    return;
                else
                    v21.MakeNodeVisible(v201);
                    v21.ForceUpdate(true);
                    local l_VisibleSpace_0 = v41.VisibleSpace;
                    for v203, v204 in next, v22 do
                        if v204 == v201 then
                            local v205 = v203 - 1;
                            if v205 < v21.Index then
                                v41.Index = v205;
                            elseif v21.Index + l_VisibleSpace_0 - 1 <= v205 then
                                v41.Index = v205 - l_VisibleSpace_0 + 2;
                            end;
                        end;
                    end;
                    v41:Update();
                    v21.Index = v41.Index;
                    v21.Refresh();
                    return;
                end;
            end;
            v21.ViewObj = function(v206) --[[ Line: 817 ]]
                v21.ViewNode(v0[v206]);
            end;
            v21.MakeNodeVisible = function(v207, v208) --[[ Line: 821 ]]
                if not v207 then
                    return;
                else
                    local v209 = false;
                    if v208 and not v27[v207] then
                        v27[v207] = true;
                        v209 = true;
                    end;
                    local l_Parent_5 = v207.Parent;
                    while l_Parent_5 do
                        v209 = true;
                        v27[l_Parent_5] = true;
                        l_Parent_5 = l_Parent_5.Parent;
                    end;
                    if v209 and not v37 then
                        coroutine.wrap(v21.PerformUpdate)(true);
                    end;
                    return;
                end;
            end;
            v21.ShowRightClick = function() --[[ Line: 843 ]]
                local l_RightClickContext_0 = v21.RightClickContext;
                l_RightClickContext_0:Clear();
                local l_List_1 = v1.List;
                local l_Map_0 = v1.Map;
                local v214 = #v43 == 0;
                local v215 = {};
                local l_Classes_0 = v11.Classes;
                for v217 = 1, #l_List_1 do
                    local v218 = l_List_1[v217];
                    local l_Class_2 = v218.Class;
                    if not l_Class_2 then
                        l_Class_2 = v218.Obj.ClassName;
                        v218.Class = l_Class_2;
                    end;
                    local v220 = l_Classes_0[l_Class_2];
                    while v220 and not v215[v220.Name] do
                        v215[v220.Name] = true;
                        v220 = v220.Superclass;
                    end;
                end;
                l_RightClickContext_0:AddRegistered("CUT");
                l_RightClickContext_0:AddRegistered("COPY");
                l_RightClickContext_0:AddRegistered("PASTE", v214);
                l_RightClickContext_0:AddRegistered("DUPLICATE");
                l_RightClickContext_0:AddRegistered("DELETE");
                l_RightClickContext_0:AddRegistered("RENAME", #l_List_1 ~= 1);
                l_RightClickContext_0:AddDivider();
                l_RightClickContext_0:AddRegistered("GROUP");
                l_RightClickContext_0:AddRegistered("UNGROUP");
                l_RightClickContext_0:AddRegistered("SELECT_CHILDREN");
                l_RightClickContext_0:AddRegistered("JUMP_TO_PARENT");
                l_RightClickContext_0:AddRegistered("EXPAND_ALL");
                l_RightClickContext_0:AddRegistered("COLLAPSE_ALL");
                l_RightClickContext_0:AddDivider();
                if v27 == v21.SearchExpanded then
                    l_RightClickContext_0:AddRegistered("CLEAR_SEARCH_AND_JUMP_TO");
                end;
                if v13.setclipboard then
                    l_RightClickContext_0:AddRegistered("COPY_PATH");
                end;
                l_RightClickContext_0:AddRegistered("INSERT_OBJECT");
                l_RightClickContext_0:AddRegistered("SAVE_INST");
                l_RightClickContext_0:AddRegistered("CALL_FUNCTION");
                l_RightClickContext_0:AddRegistered("VIEW_CONNECTIONS");
                l_RightClickContext_0:AddRegistered("GET_REFERENCES");
                l_RightClickContext_0:AddRegistered("VIEW_API");
                l_RightClickContext_0:QueueDivider();
                if v215.BasePart or v215.Model then
                    l_RightClickContext_0:AddRegistered("TELEPORT_TO");
                    l_RightClickContext_0:AddRegistered("VIEW_OBJECT");
                end;
                if v215.TouchTransmitter then
                    l_RightClickContext_0:AddRegistered("FIRE_TOUCHTRANSMITTER", firetouchinterest == nil);
                end;
                if v215.ClickDetector then
                    l_RightClickContext_0:AddRegistered("FIRE_CLICKDETECTOR", fireclickdetector == nil);
                end;
                if v215.ProximityPrompt then
                    l_RightClickContext_0:AddRegistered("FIRE_PROXIMITYPROMPT", fireproximityprompt == nil);
                end;
                if v215.Player then
                    l_RightClickContext_0:AddRegistered("SELECT_CHARACTER");
                end;
                if v215.Players then
                    l_RightClickContext_0:AddRegistered("SELECT_LOCAL_PLAYER");
                end;
                if v215.LuaSourceContainer then
                    l_RightClickContext_0:AddRegistered("VIEW_SCRIPT");
                end;
                if l_Map_0[v39] then
                    l_RightClickContext_0:AddRegistered("REFRESH_NIL");
                    l_RightClickContext_0:AddRegistered("HIDE_NIL");
                end;
                local l_v21_0 = v21;
                local l_v21_1 = v21;
                local l_X_2 = v3.Mouse.X;
                local l_Y_1 = v3.Mouse.Y;
                l_v21_0.LastRightClickX = l_X_2;
                l_v21_1.LastRightClickY = l_Y_1;
                l_RightClickContext_0:Show();
            end;
            v21.InitRightClick = function() --[[ Line: 912 ]]
                local v225 = v4.ContextMenu.new();
                v225:Register("CUT", {
                    Name = "Cut", 
                    IconMap = v21.MiscIcons, 
                    Icon = "Cut", 
                    DisabledIcon = "Cut_Disabled", 
                    Shortcut = "Ctrl+Z", 
                    OnClick = function() --[[ Line: 915 ]] --[[ Name: OnClick ]]
                        local l_Destroy_0 = game.Destroy;
                        local l_Clone_0 = game.Clone;
                        local l_List_2 = v1.List;
                        local v229 = {};
                        local v230 = 1;
                        for v231 = 1, #l_List_2 do
                            local l_Obj_2 = l_List_2[v231].Obj;
                            local l_status_0, l_result_0 = pcall(l_Clone_0, l_Obj_2);
                            if l_status_0 and l_result_0 then
                                v229[v230] = l_result_0;
                                v230 = v230 + 1;
                            end;
                            pcall(l_Destroy_0, l_Obj_2);
                        end;
                        v43 = v229;
                        v1:Clear();
                    end
                });
                v225:Register("COPY", {
                    Name = "Copy", 
                    IconMap = v21.MiscIcons, 
                    Icon = "Copy", 
                    DisabledIcon = "Copy_Disabled", 
                    Shortcut = "Ctrl+C", 
                    OnClick = function() --[[ Line: 932 ]] --[[ Name: OnClick ]]
                        local l_Clone_1 = game.Clone;
                        local l_List_3 = v1.List;
                        local v237 = {};
                        local v238 = 1;
                        for v239 = 1, #l_List_3 do
                            local l_Obj_3 = l_List_3[v239].Obj;
                            local l_status_1, l_result_1 = pcall(l_Clone_1, l_Obj_3);
                            if l_status_1 and l_result_1 then
                                v237[v238] = l_result_1;
                                v238 = v238 + 1;
                            end;
                        end;
                        v43 = v237;
                    end
                });
                v225:Register("PASTE", {
                    Name = "Paste Into", 
                    IconMap = v21.MiscIcons, 
                    Icon = "Paste", 
                    DisabledIcon = "Paste_Disabled", 
                    Shortcut = "Ctrl+Shift+V", 
                    OnClick = function() --[[ Line: 947 ]] --[[ Name: OnClick ]]
                        local l_List_4 = v1.List;
                        local v244 = {};
                        local v245 = 1;
                        for v246 = 1, #l_List_4 do
                            local v247 = l_List_4[v246];
                            local l_Obj_4 = v247.Obj;
                            v21.MakeNodeVisible(v247, true);
                            for v249 = 1, #v43 do
                                local v250 = v43[v249]:Clone();
                                if v250 then
                                    v250.Parent = l_Obj_4;
                                    local v251 = v0[v250];
                                    if v251 then
                                        v244[v245] = v251;
                                        v245 = v245 + 1;
                                    end;
                                end;
                            end;
                        end;
                        v1:SetTable(v244);
                        if #v244 > 0 then
                            v21.ViewNode(v244[1]);
                        end;
                    end
                });
                v225:Register("DUPLICATE", {
                    Name = "Duplicate", 
                    IconMap = v21.MiscIcons, 
                    Icon = "Copy", 
                    DisabledIcon = "Copy_Disabled", 
                    Shortcut = "Ctrl+D", 
                    OnClick = function() --[[ Line: 971 ]] --[[ Name: OnClick ]]
                        local l_Clone_2 = game.Clone;
                        local l_List_5 = v1.List;
                        local v254 = {};
                        local v255 = 1;
                        for v256 = 1, #l_List_5 do
                            local v257 = l_List_5[v256];
                            local l_Obj_5 = v257.Obj;
                            local v259 = v257.Parent and v257.Parent.Obj;
                            v21.MakeNodeVisible(v257);
                            local l_status_2, l_result_2 = pcall(l_Clone_2, l_Obj_5);
                            if l_status_2 and l_result_2 then
                                l_result_2.Parent = v259;
                                local v262 = v0[l_result_2];
                                if v262 then
                                    v254[v255] = v262;
                                    v255 = v255 + 1;
                                end;
                            end;
                        end;
                        v1:SetTable(v254);
                        if #v254 > 0 then
                            v21.ViewNode(v254[1]);
                        end;
                    end
                });
                v225:Register("DELETE", {
                    Name = "Delete", 
                    IconMap = v21.MiscIcons, 
                    Icon = "Delete", 
                    DisabledIcon = "Delete_Disabled", 
                    Shortcut = "Del", 
                    OnClick = function() --[[ Line: 995 ]] --[[ Name: OnClick ]]
                        local l_Destroy_1 = game.Destroy;
                        local l_List_6 = v1.List;
                        for v265 = 1, #l_List_6 do
                            pcall(l_Destroy_1, l_List_6[v265].Obj);
                        end;
                        v1:Clear();
                    end
                });
                v225:Register("RENAME", {
                    Name = "Rename", 
                    IconMap = v21.MiscIcons, 
                    Icon = "Rename", 
                    DisabledIcon = "Rename_Disabled", 
                    Shortcut = "F2", 
                    OnClick = function() --[[ Line: 1004 ]] --[[ Name: OnClick ]]
                        local l_List_7 = v1.List;
                        if l_List_7[1] then
                            v21.SetRenamingNode(l_List_7[1]);
                        end;
                    end
                });
                v225:Register("GROUP", {
                    Name = "Group", 
                    IconMap = v21.MiscIcons, 
                    Icon = "Group", 
                    DisabledIcon = "Group_Disabled", 
                    Shortcut = "Ctrl+G", 
                    OnClick = function() --[[ Line: 1011 ]] --[[ Name: OnClick ]]
                        local l_List_8 = v1.List;
                        if #l_List_8 == 0 then
                            return;
                        else
                            local v268 = Instance.new("Model", l_List_8[#l_List_8].Obj.Parent);
                            for v269 = 1, #l_List_8 do
                                pcall(function() --[[ Line: 1017 ]]
                                    l_List_8[v269].Obj.Parent = v268;
                                end);
                            end;
                            if v0[v268] then
                                v1:Set(v0[v268]);
                                v21.ViewNode(v0[v268]);
                            end;
                            return;
                        end;
                    end
                });
                v225:Register("UNGROUP", {
                    Name = "Ungroup", 
                    IconMap = v21.MiscIcons, 
                    Icon = "Ungroup", 
                    DisabledIcon = "Ungroup_Disabled", 
                    Shortcut = "Ctrl+U", 
                    OnClick = function() --[[ Line: 1026 ]] --[[ Name: OnClick ]]
                        local v270 = {};
                        local v271 = 1;
                        local l_IsA_1 = game.IsA;
                        local function v280(v273) --[[ Line: 1031 ]] --[[ Name: ungroup ]]
                            local l_Obj_6 = v273.Parent.Obj;
                            local v275 = {};
                            local v276 = 1;
                            for v277 = 1, #v273 do
                                local v278 = v273[v277];
                                v270[v271] = v278;
                                v275[v276] = v278;
                                v271 = v271 + 1;
                                v276 = v276 + 1;
                            end;
                            for v279 = 1, #v275 do
                                pcall(function() --[[ Line: 1045 ]]
                                    v275[v279].Obj.Parent = l_Obj_6;
                                end);
                            end;
                            v273.Obj:Destroy();
                        end;
                        for __, v282 in next, v1.List do
                            if l_IsA_1(v282.Obj, "Model") then
                                v280(v282);
                            end;
                        end;
                        v1:SetTable(v270);
                        if #v270 > 0 then
                            v21.ViewNode(v270[1]);
                        end;
                    end
                });
                v225:Register("SELECT_CHILDREN", {
                    Name = "Select Children", 
                    IconMap = v21.MiscIcons, 
                    Icon = "SelectChildren", 
                    DisabledIcon = "SelectChildren_Disabled", 
                    OnClick = function() --[[ Line: 1063 ]] --[[ Name: OnClick ]]
                        local v283 = {};
                        local v284 = 1;
                        local l_List_9 = v1.List;
                        for v286 = 1, #l_List_9 do
                            local v287 = l_List_9[v286];
                            for v288 = 1, #v287 do
                                local v289 = v287[v288];
                                if v288 == 1 then
                                    v21.MakeNodeVisible(v289);
                                end;
                                v283[v284] = v289;
                                v284 = v284 + 1;
                            end;
                        end;
                        v1:SetTable(v283);
                        if #v283 > 0 then
                            v21.ViewNode(v283[1]);
                            return;
                        else
                            v21.Refresh();
                            return;
                        end;
                    end
                });
                v225:Register("JUMP_TO_PARENT", {
                    Name = "Jump to Parent", 
                    IconMap = v21.MiscIcons, 
                    Icon = "JumpToParent", 
                    OnClick = function() --[[ Line: 1087 ]] --[[ Name: OnClick ]]
                        local v290 = {};
                        local v291 = 1;
                        local l_List_10 = v1.List;
                        for v293 = 1, #l_List_10 do
                            local v294 = l_List_10[v293];
                            if v294.Parent then
                                v290[v291] = v294.Parent;
                                v291 = v291 + 1;
                            end;
                        end;
                        v1:SetTable(v290);
                        if #v290 > 0 then
                            v21.ViewNode(v290[1]);
                            return;
                        else
                            v21.Refresh();
                            return;
                        end;
                    end
                });
                v225:Register("TELEPORT_TO", {
                    Name = "Teleport To", 
                    IconMap = v21.MiscIcons, 
                    Icon = "TeleportTo", 
                    OnClick = function() --[[ Line: 1108 ]] --[[ Name: OnClick ]]
                        local l_List_11 = v1.List;
                        local l_IsA_2 = game.IsA;
                        local v297 = v15.Character and v15.Character:FindFirstChild("HumanoidRootPart");
                        if not v297 then
                            return;
                        else
                            for v298 = 1, #l_List_11 do
                                local v299 = l_List_11[v298];
                                if l_IsA_2(v299.Obj, "BasePart") then
                                    v297.CFrame = v299.Obj.CFrame + v6.Explorer.TeleportToOffset;
                                    return;
                                elseif l_IsA_2(v299.Obj, "Model") then
                                    if v299.Obj.PrimaryPart then
                                        v297.CFrame = v299.Obj.PrimaryPart.CFrame + v6.Explorer.TeleportToOffset;
                                        return;
                                    else
                                        local l_FirstChildWhichIsA_0 = v299.Obj:FindFirstChildWhichIsA("BasePart", true);
                                        if l_FirstChildWhichIsA_0 and v0[l_FirstChildWhichIsA_0] then
                                            v297.CFrame = v0[l_FirstChildWhichIsA_0].Obj.CFrame + v6.Explorer.TeleportToOffset;
                                        end;
                                    end;
                                end;
                            end;
                            return;
                        end;
                    end
                });
                v225:Register("EXPAND_ALL", {
                    Name = "Expand All", 
                    OnClick = function() --[[ Line: 1135 ]] --[[ Name: OnClick ]]
                        local l_List_12 = v1.List;
                        local function v302(v303) --[[ Line: 1138 ]] --[[ Name: expand ]]
                            v27[v303] = true;
                            for v304 = 1, #v303 do
                                if #v303[v304] > 0 then
                                    v302(v303[v304]);
                                end;
                            end;
                        end;
                        for v305 = 1, #l_List_12 do
                            v302(l_List_12[v305]);
                        end;
                        v21.ForceUpdate();
                    end
                });
                v225:Register("COLLAPSE_ALL", {
                    Name = "Collapse All", 
                    OnClick = function() --[[ Line: 1154 ]] --[[ Name: OnClick ]]
                        local l_List_13 = v1.List;
                        local function v307(v308) --[[ Line: 1157 ]] --[[ Name: expand ]]
                            v27[v308] = nil;
                            for v309 = 1, #v308 do
                                if #v308[v309] > 0 then
                                    v307(v308[v309]);
                                end;
                            end;
                        end;
                        for v310 = 1, #l_List_13 do
                            v307(l_List_13[v310]);
                        end;
                        v21.ForceUpdate();
                    end
                });
                v225:Register("CLEAR_SEARCH_AND_JUMP_TO", {
                    Name = "Clear Search and Jump to", 
                    OnClick = function() --[[ Line: 1173 ]] --[[ Name: OnClick ]]
                        local v311 = {};
                        local v312 = 1;
                        local l_List_14 = v1.List;
                        for v314 = 1, #l_List_14 do
                            v311[v312] = l_List_14[v314];
                            v312 = v312 + 1;
                        end;
                        v1:SetTable(v311);
                        v21.ClearSearch();
                        if #v311 > 0 then
                            v21.ViewNode(v311[1]);
                        end;
                    end
                });
                local function v316(v315) --[[ Line: 1190 ]]
                    if v315:sub(1, 28) == "game:GetService(\"Workspace\")" then
                        v315 = v315:gsub("game:GetService%(\"Workspace\"%)", "workspace", 1);
                    end;
                    if v315:sub(1, 27 + #v15.Name) == "game:GetService(\"Players\")." .. v15.Name then
                        v315 = v315:gsub("game:GetService%(\"Players\"%)." .. v15.Name, "game:GetService(\"Players\").LocalPlayer", 1);
                    end;
                    return v315;
                end;
                v225:Register("COPY_PATH", {
                    Name = "Copy Path", 
                    OnClick = function() --[[ Line: 1196 ]] --[[ Name: OnClick ]]
                        local l_List_15 = v1.List;
                        if #l_List_15 == 1 then
                            v13.setclipboard(v316(v21.GetInstancePath(l_List_15[1].Obj)));
                            return;
                        else
                            if #l_List_15 > 1 then
                                local v318 = {
                                    "{"
                                };
                                local v319 = 2;
                                for v320 = 1, #l_List_15 do
                                    local v321 = "\t" .. v316(v21.GetInstancePath(l_List_15[v320].Obj)) .. ",";
                                    if #v321 > 0 then
                                        v318[v319] = v321;
                                        v319 = v319 + 1;
                                    end;
                                end;
                                v318[v319] = "}";
                                v13.setclipboard(l_table_0.concat(v318, "\n"));
                            end;
                            return;
                        end;
                    end
                });
                v225:Register("INSERT_OBJECT", {
                    Name = "Insert Object", 
                    IconMap = v21.MiscIcons, 
                    Icon = "InsertObject", 
                    OnClick = function() --[[ Line: 1215 ]] --[[ Name: OnClick ]]
                        local l_Mouse_0 = v3.Mouse;
                        local v323 = v21.LastRightClickX or l_Mouse_0.X;
                        local v324 = v21.LastRightClickY or l_Mouse_0.Y;
                        v21.InsertObjectContext:Show(v323, v324);
                    end
                });
                v225:Register("CALL_FUNCTION", {
                    Name = "Call Function", 
                    IconMap = v21.ClassIcons, 
                    Icon = 66, 
                    OnClick = function() --[[ Line: 1221 ]] --[[ Name: OnClick ]]

                    end
                });
                v225:Register("GET_REFERENCES", {
                    Name = "Get Lua References", 
                    IconMap = v21.ClassIcons, 
                    Icon = 34, 
                    OnClick = function() --[[ Line: 1225 ]] --[[ Name: OnClick ]]

                    end
                });
                v225:Register("SAVE_INST", {
                    Name = "Save to File", 
                    IconMap = v21.MiscIcons, 
                    Icon = "Save", 
                    OnClick = function() --[[ Line: 1229 ]] --[[ Name: OnClick ]]

                    end
                });
                v225:Register("VIEW_CONNECTIONS", {
                    Name = "View Connections", 
                    OnClick = function() --[[ Line: 1233 ]] --[[ Name: OnClick ]]

                    end
                });
                v225:Register("VIEW_API", {
                    Name = "View API Page", 
                    IconMap = v21.MiscIcons, 
                    Icon = "Reference", 
                    OnClick = function() --[[ Line: 1237 ]] --[[ Name: OnClick ]]

                    end
                });
                v225:Register("VIEW_OBJECT", {
                    Name = "View Object (Right click to reset)", 
                    IconMap = v21.ClassIcons, 
                    Icon = 5, 
                    OnClick = function() --[[ Line: 1241 ]] --[[ Name: OnClick ]]
                        local l_List_16 = v1.List;
                        local l_IsA_3 = game.IsA;
                        for v327 = 1, #l_List_16 do
                            local v328 = l_List_16[v327];
                            if l_IsA_3(v328.Obj, "BasePart") or l_IsA_3(v328.Obj, "Model") then
                                workspace.CurrentCamera.CameraSubject = v328.Obj;
                                return;
                            end;
                        end;
                    end, 
                    OnRightClick = function() --[[ Line: 1253 ]] --[[ Name: OnRightClick ]]
                        workspace.CurrentCamera.CameraSubject = v15.Character;
                    end
                });
                v225:Register("FIRE_TOUCHTRANSMITTER", {
                    Name = "Fire TouchTransmitter", 
                    IconMap = v21.ClassIcons, 
                    Icon = 37, 
                    OnClick = function() --[[ Line: 1257 ]] --[[ Name: OnClick ]]
                        local v329 = v15.Character and v15.Character:FindFirstChild("HumanoidRootPart");
                        if not v329 then
                            return;
                        else
                            for __, v331 in ipairs(v1.List) do
                                if v331.Obj and v331.Obj:IsA("TouchTransmitter") then
                                    firetouchinterest(v329, v331.Obj.Parent, 0);
                                end;
                            end;
                            return;
                        end;
                    end
                });
                v225:Register("FIRE_CLICKDETECTOR", {
                    Name = "Fire ClickDetector", 
                    IconMap = v21.ClassIcons, 
                    Icon = 41, 
                    OnClick = function() --[[ Line: 1263 ]] --[[ Name: OnClick ]]
                        if not (v15.Character and v15.Character:FindFirstChild("HumanoidRootPart")) then
                            return;
                        else
                            for __, v333 in ipairs(v1.List) do
                                if v333.Obj and v333.Obj:IsA("ClickDetector") then
                                    fireclickdetector(v333.Obj);
                                end;
                            end;
                            return;
                        end;
                    end
                });
                v225:Register("FIRE_PROXIMITYPROMPT", {
                    Name = "Fire ProximityPrompt", 
                    IconMap = v21.ClassIcons, 
                    Icon = 124, 
                    OnClick = function() --[[ Line: 1269 ]] --[[ Name: OnClick ]]
                        if not (v15.Character and v15.Character:FindFirstChild("HumanoidRootPart")) then
                            return;
                        else
                            for __, v335 in ipairs(v1.List) do
                                if v335.Obj and v335.Obj:IsA("ProximityPrompt") then
                                    fireproximityprompt(v335.Obj);
                                end;
                            end;
                            return;
                        end;
                    end
                });
                v225:Register("VIEW_SCRIPT", {
                    Name = "View Script", 
                    IconMap = v21.MiscIcons, 
                    Icon = "ViewScript", 
                    OnClick = function() --[[ Line: 1275 ]] --[[ Name: OnClick ]]
                        local v336 = v1.List[1] and v1.List[1].Obj;
                        if v336 then
                            v9.ViewScript(v336);
                        end;
                    end
                });
                v225:Register("SELECT_CHARACTER", {
                    Name = "Select Character", 
                    IconMap = v21.ClassIcons, 
                    Icon = 9, 
                    OnClick = function() --[[ Line: 1280 ]] --[[ Name: OnClick ]]
                        local v337 = {};
                        local v338 = 1;
                        local l_List_17 = v1.List;
                        local l_IsA_4 = game.IsA;
                        for v341 = 1, #l_List_17 do
                            local v342 = l_List_17[v341];
                            if l_IsA_4(v342.Obj, "Player") and v0[v342.Obj.Character] then
                                v337[v338] = v0[v342.Obj.Character];
                                v338 = v338 + 1;
                            end;
                        end;
                        v1:SetTable(v337);
                        if #v337 > 0 then
                            v21.ViewNode(v337[1]);
                            return;
                        else
                            v21.Refresh();
                            return;
                        end;
                    end
                });
                v225:Register("SELECT_LOCAL_PLAYER", {
                    Name = "Select Local Player", 
                    IconMap = v21.ClassIcons, 
                    Icon = 9, 
                    OnClick = function() --[[ Line: 1302 ]] --[[ Name: OnClick ]]
                        pcall(function() --[[ Line: 1303 ]]
                            if v0[v15] then
                                v1:Set(v0[v15]);
                                v21.ViewNode(v0[v15]);
                            end;
                        end);
                    end
                });
                v225:Register("REFRESH_NIL", {
                    Name = "Refresh Nil Instances", 
                    OnClick = function() --[[ Line: 1306 ]] --[[ Name: OnClick ]]
                        v21.RefreshNilInstances();
                    end
                });
                v225:Register("HIDE_NIL", {
                    Name = "Hide Nil Instances", 
                    OnClick = function() --[[ Line: 1310 ]] --[[ Name: OnClick ]]
                        v21.HideNilInstances();
                    end
                });
                v21.RightClickContext = v225;
            end;
            v21.HideNilInstances = function() --[[ Line: 1317 ]]
                l_table_0.clear(v51);
                local l_Disconnect_0 = Instance.new("Folder").ChildAdded:Connect(function() --[[ Line: 1320 ]]

                end).Disconnect;
                for __, v345 in next, v52 do
                    l_Disconnect_0(v345[1]);
                    l_Disconnect_0(v345[2]);
                end;
                l_table_0.clear(v52);
                for v346 = 1, #v39 do
                    coroutine.wrap(v55)(v39[v346].Obj);
                end;
                v21.Update();
                v21.Refresh();
            end;
            v21.RefreshNilInstances = function() --[[ Line: 1335 ]]
                if not v13.getnilinstances then
                    return;
                else
                    local v347 = v13.getnilinstances();
                    local l_game_0 = game;
                    local l_GetDescendants_1 = l_game_0.GetDescendants;
                    for v350 = 1, #v347 do
                        local v351 = v347[v350];
                        if v351 ~= l_game_0 then
                            v51[v351] = true;
                            local v352 = l_GetDescendants_1(v351);
                            for v353 = 1, #v352 do
                                v51[v352[v353]] = true;
                            end;
                        end;
                    end;
                    for v354 = 1, #v347 do
                        local v355 = v347[v354];
                        if not v0[v355] then
                            coroutine.wrap(v54)(v355);
                        end;
                    end;
                    v21.Update();
                    v21.Refresh();
                    return;
                end;
            end;
            v21.GetInstancePath = function(v356) --[[ Line: 1404 ]]
                local l_FindFirstChild_0 = game.FindFirstChild;
                local l_GetChildren_0 = game.GetChildren;
                local v359 = "";
                local l_v356_0 = v356;
                local l_tostring_0 = tostring;
                local l_match_0 = string.match;
                local __ = string.gsub;
                local l_find_0 = l_table_0.find;
                local l_CopyPathUseGetChildren_0 = v6.Explorer.CopyPathUseGetChildren;
                local l_FormatLuaString_0 = v4.FormatLuaString;
                while true do
                    if l_v356_0 then
                        if l_v356_0 == game then
                            return "game" .. v359;
                        else
                            local l_ClassName_0 = l_v356_0.ClassName;
                            local v368 = l_tostring_0(l_v356_0);
                            local v369 = nil;
                            v369 = if l_match_0(v368, "^[%a_][%w_]*$") then "." .. v368 else "[\"" .. l_FormatLuaString_0(v368) .. "\"]";
                            local l_Parent_6 = l_v356_0.Parent;
                            if l_Parent_6 then
                                local v371 = l_FindFirstChild_0(l_Parent_6, v368);
                                if l_CopyPathUseGetChildren_0 and v371 and v371 ~= l_v356_0 then
                                    v369 = ":GetChildren()[" .. l_find_0(l_GetChildren_0(l_Parent_6), l_v356_0) .. "]";
                                elseif l_Parent_6 == game and v11.Classes[l_ClassName_0] and v11.Classes[l_ClassName_0].Tags.Service then
                                    v369 = ":GetService(\"" .. l_ClassName_0 .. "\")";
                                end;
                            elseif l_Parent_6 == nil then
                                v369 = "local getNil = function(name, class) for _, v in next, getnilinstances() do if v.ClassName == class and v.Name == name then return v end end end" .. ("\n\ngetNil(\"%s\", \"%s\")"):format(l_v356_0.Name, l_ClassName_0);
                            end;
                            v359 = v369 .. v359;
                            l_v356_0 = l_Parent_6;
                        end;
                    else
                        return v359;
                    end;
                end;
            end;
            v21.InitInsertObject = function() --[[ Line: 1455 ]]
                local v372 = v4.ContextMenu.new();
                v372.SearchEnabled = true;
                v372.MaxHeight = 400;
                v372:ApplyTheme({
                    ContentColor = v6.Theme.Main2, 
                    OutlineColor = v6.Theme.Outline1, 
                    DividerColor = v6.Theme.Outline1, 
                    TextColor = v6.Theme.Text, 
                    HighlightColor = v6.Theme.ButtonHover
                });
                local v373 = {};
                for __, v375 in next, v11.Classes do
                    local l_Tags_0 = v375.Tags;
                    if not l_Tags_0.NotCreatable and not l_Tags_0.Service then
                        local v377 = v12.Classes[v375.Name];
                        v373[#v373 + 1] = {
                            v375, 
                            v377 and v377.ClassCategory or "Uncategorized"
                        };
                    end;
                end;
                l_table_0.sort(v373, function(v378, v379) --[[ Line: 1475 ]]
                    if v378[2] ~= v379[2] then
                        return v378[2] < v379[2];
                    else
                        return v378[1].Name < v379[1].Name;
                    end;
                end);
                local function v386(v380) --[[ Line: 1483 ]] --[[ Name: onClick ]]
                    local l_List_18 = v1.List;
                    local l_new_0 = Instance.new;
                    for v383 = 1, #l_List_18 do
                        local v384 = l_List_18[v383];
                        local l_Obj_7 = v384.Obj;
                        v21.MakeNodeVisible(v384, true);
                        pcall(l_new_0, v380, l_Obj_7);
                    end;
                end;
                local v387 = "";
                for v388 = 1, #v373 do
                    local v389 = v373[v388][1];
                    local v390 = v12.Classes[v389.Name];
                    local v391 = v390 and tonumber(v390.ExplorerImageIndex) or 0;
                    local v392 = v373[v388][2];
                    if v387 ~= v392 then
                        v372:AddDivider(v392);
                        v387 = v392;
                    end;
                    v372:Add({
                        Name = v389.Name, 
                        IconMap = v21.ClassIcons, 
                        Icon = v391, 
                        OnClick = v386
                    });
                end;
                v21.InsertObjectContext = v372;
            end;
            v21.SearchFilters = {
                Comparison = {
                    isa = function(v393) --[[ Line: 1516 ]]
                        local l_lower_0 = string.lower;
                        local l_find_1 = string.find;
                        local v396 = string.split(v393)[1];
                        if not v396 then
                            return;
                        else
                            v396 = l_lower_0(v396);
                            local v397 = nil;
                            for v398, __ in pairs(v11.Classes) do
                                local v400 = l_lower_0(v398);
                                if v400 == v396 then
                                    v397 = v398;
                                    break;
                                elseif l_find_1(v400, v396, 1, true) then
                                    v397 = v398;
                                end;
                            end;
                            if not v397 then
                                return;
                            else
                                return {
                                    Headers = {
                                        "local isa = game.IsA"
                                    }, 
                                    Predicate = "isa(obj,'" .. v397 .. "')"
                                };
                            end;
                        end;
                    end, 
                    remotes = function(__) --[[ Line: 1540 ]]
                        return {
                            Headers = {
                                "local isa = game.IsA"
                            }, 
                            Predicate = "isa(obj,'RemoteEvent') or isa(obj,'RemoteFunction')"
                        };
                    end, 
                    bindables = function(__) --[[ Line: 1546 ]]
                        return {
                            Headers = {
                                "local isa = game.IsA"
                            }, 
                            Predicate = "isa(obj,'BindableEvent') or isa(obj,'BindableFunction')"
                        };
                    end, 
                    rad = function(v403) --[[ Line: 1552 ]]
                        local v404 = tonumber(v403);
                        if not v404 then
                            return;
                        elseif not v14.Players.LocalPlayer.Character or not v14.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or not v14.Players.LocalPlayer.Character.HumanoidRootPart:IsA("BasePart") then
                            return;
                        else
                            return {
                                Headers = {
                                    "local isa = game.IsA", 
                                    "local hrp = service.Players.LocalPlayer.Character.HumanoidRootPart"
                                }, 
                                Setups = {
                                    "local hrpPos = hrp.Position"
                                }, 
                                ObjectDefs = {
                                    "local isBasePart = isa(obj,'BasePart')"
                                }, 
                                Predicate = "(isBasePart and (obj.Position-hrpPos).Magnitude <= " .. v404 .. ")"
                            };
                        end;
                    end
                }, 
                Specific = {
                    players = function() --[[ Line: 1567 ]]
                        return function() --[[ Line: 1568 ]]
                            return v14.Players:GetPlayers();
                        end;
                    end, 
                    loadedmodules = function() --[[ Line: 1570 ]]
                        return v13.getloadedmodules;
                    end
                }, 
                Default = function(v405, v406) --[[ Line: 1574 ]] --[[ Name: Default ]]
                    local v407 = v405:gsub("\"", "\\\""):gsub("\n", "\\n");
                    if v406 then
                        return {
                            Headers = {
                                "local find = string.find"
                            }, 
                            ObjectDefs = {
                                "local objName = tostring(obj)"
                            }, 
                            Predicate = "find(objName,\"" .. v407 .. "\",1,true)"
                        };
                    else
                        return {
                            Headers = {
                                "local lower = string.lower", 
                                "local find = string.find", 
                                "local tostring = tostring"
                            }, 
                            ObjectDefs = {
                                "local lowerName = lower(tostring(obj))"
                            }, 
                            Predicate = "find(lowerName,\"" .. v407:lower() .. "\",1,true)"
                        };
                    end;
                end, 
                SpecificDefault = function(v408) --[[ Line: 1590 ]] --[[ Name: SpecificDefault ]]
                    return {
                        Headers = {}, 
                        ObjectDefs = {
                            "local isSpec" .. v408 .. " = specResults[" .. v408 .. "][node]"
                        }, 
                        Predicate = "isSpec" .. v408
                    };
                end
            };
            v21.BuildSearchFunc = function(v409) --[[ Line: 1599 ]]
                local v410 = {};
                local v411 = {};
                local v412 = "";
                local l_rep_0 = string.rep;
                local v415 = v409:gsub("\\.", "  "):gsub("\".-\"", function(v414) --[[ Line: 1603 ]]
                    return l_rep_0(" ", #v414);
                end);
                local v416 = {};
                local v417 = {};
                local v418 = {};
                local __ = string.find;
                local __ = string.sub;
                local l_lower_1 = string.lower;
                local l_match_1 = string.match;
                local v423 = {
                    ["("] = "(", 
                    [")"] = ")", 
                    ["||"] = " or ", 
                    ["&&"] = " and "
                };
                local l_Comparison_0 = v21.SearchFilters.Comparison;
                local l_Specific_0 = v21.SearchFilters.Specific;
                local v426 = 1;
                local v427 = nil;
                local function v435(v428) --[[ Line: 1623 ]] --[[ Name: processFilter ]]
                    if v428.Headers then
                        local l_Headers_0 = v428.Headers;
                        for v430 = 1, #l_Headers_0 do
                            v416[l_Headers_0[v430]] = true;
                        end;
                    end;
                    if v428.ObjectDefs then
                        local l_ObjectDefs_0 = v428.ObjectDefs;
                        for v432 = 1, #l_ObjectDefs_0 do
                            v417[l_ObjectDefs_0[v432]] = true;
                        end;
                    end;
                    if v428.Setups then
                        local l_Setups_0 = v428.Setups;
                        for v434 = 1, #l_Setups_0 do
                            v418[l_Setups_0[v434]] = true;
                        end;
                    end;
                    v412 = v412 .. v428.Predicate;
                end;
                local v436 = {};
                local v437 = {};
                local l_find_3 = string.find;
                local l_sub_1 = string.sub;
                local function v451(v440, v441) --[[ Line: 1653 ]] --[[ Name: findAll ]]
                    local v442 = #v436 + 1;
                    local v443 = 1;
                    local v444 = #v441;
                    local v445, v446, v447 = l_find_3(v440, v441, v443, true);
                    while v445 do
                        v436[v442] = v445;
                        v437[v445] = {
                            v444, 
                            v441
                        };
                        v442 = v442 + 1;
                        v443 = v446 + 1;
                        local v448, v449, v450 = l_find_3(v440, v441, v443, true);
                        v445 = v448;
                        v446 = v449;
                        v447 = v450;
                    end;
                end;
                local __ = tick();
                v451(v415, "&&");
                v451(v415, "||");
                v451(v415, "(");
                v451(v415, ")");
                l_table_0.sort(v436);
                l_table_0.insert(v436, #v415 + 1);
                local function v455(v453) --[[ Line: 1675 ]] --[[ Name: inQuotes ]]
                    local v454 = #v453;
                    if l_sub_1(v453, 1, 1) == "\"" and l_sub_1(v453, v454, v454) == "\"" then
                        return (l_sub_1(v453, 2, v454 - 1));
                    else
                        return;
                    end;
                end;
                for v456 = 1, #v436 do
                    local v457 = v436[v456];
                    local v458 = v437[v457] or {
                        1
                    };
                    local v459 = v423[v458[2]];
                    local v460 = l_match_1(l_sub_1(v409, v426, v457 - 1), "^%s*(.-)%s*$") or "";
                    if #v460 > 0 then
                        if l_sub_1(v460, 1, 1) == "!" then
                            v460 = l_sub_1(v460, 2);
                            v412 = v412 .. "not ";
                        end;
                        local v461 = v455(v460);
                        if v461 then
                            v435(v21.SearchFilters.Default(v461, true));
                        else
                            local v462, v463 = l_find_3(v460, "%S+");
                            if v462 then
                                local v464 = l_sub_1(v460, v462, v463);
                                local v465 = false;
                                if l_sub_1(v464, 1, 1) == "/" then
                                    v465 = l_lower_1((l_sub_1(v464, 2)));
                                end;
                                local v466 = v465 and l_Comparison_0[v465];
                                local v467 = v465 and l_Specific_0[v465];
                                if v466 then
                                    local v468 = l_sub_1(v460, v463 + 2);
                                    local v469 = v466(v455(v468) or v468);
                                    if v469 then
                                        v435(v469);
                                    else
                                        v412 = v412 .. "false";
                                    end;
                                elseif v467 then
                                    local v470 = l_sub_1(v460, v463 + 2);
                                    local v471 = v467(v455(v470) or v470);
                                    if v471 then
                                        if not v411[v460] then
                                            v410[#v410 + 1] = v471;
                                            v411[v460] = #v410;
                                        end;
                                        v435(v21.SearchFilters.SpecificDefault(v411[v460]));
                                    else
                                        v412 = v412 .. "false";
                                    end;
                                else
                                    v435(v21.SearchFilters.Default(v460));
                                end;
                            end;
                        end;
                    end;
                    if v459 then
                        v412 = v412 .. v459;
                        if v459 == "(" and (#v460 > 0 or v427 == ")") then
                            return;
                        else
                            v427 = v459;
                        end;
                    end;
                    v426 = v457 + v458[1];
                end;
                local v472 = "";
                local v473 = "";
                local v474 = "";
                for v475, __ in next, v418 do
                    v472 = v472 .. v475 .. "\n";
                end;
                for v477, __ in next, v416 do
                    v473 = v473 .. v477 .. "\n";
                end;
                for v479, __ in next, v417 do
                    v474 = v474 .. v479 .. "\n";
                end;
                local v481 = ("local searchResults = searchResults\nlocal nodes = nodes\nlocal expandTable = Explorer.SearchExpanded\nlocal specResults = specResults\nlocal service = service\n\n%s\nlocal function search(root)\t\n%s\n\t\n\tlocal expandedpar = false\n\tfor i = 1,#root do\n\t\tlocal node = root[i]\n\t\tlocal obj = node.Obj\n\t\t\n%s\n\t\t\n\t\tif %s then\n\t\t\texpandTable[node] = 0\n\t\t\tsearchResults[node] = true\n\t\t\tif not expandedpar then\n\t\t\t\tlocal parnode = node.Parent\n\t\t\t\twhile parnode and (not searchResults[parnode] or expandTable[parnode] == 0) do\n\t\t\t\t\texpandTable[parnode] = true\n\t\t\t\t\tsearchResults[parnode] = true\n\t\t\t\t\tparnode = parnode.Parent\n\t\t\t\tend\n\t\t\t\texpandedpar = true\n\t\t\tend\n\t\tend\n\t\t\n\t\tif #node > 0 then search(node) end\n\tend\nend\nreturn search"):format(v473, v472, v474, v412);
                local l_status_3, l_result_3 = pcall(loadstring, v481);
                if not l_status_3 or not l_result_3 then
                    return nil, v410;
                else
                    local v484 = setmetatable({
                        searchResults = v25, 
                        nodes = v0, 
                        Explorer = v21, 
                        specResults = v26, 
                        service = v14
                    }, {
                        __index = getfenv()
                    });
                    setfenv(l_result_3, v484);
                    return l_result_3(), v410;
                end;
            end;
            v21.DoSearch = function(v485) --[[ Line: 1800 ]]
                l_table_0.clear(v21.SearchExpanded);
                l_table_0.clear(v25);
                v27 = #v485 == 0 and v21.Expanded or v21.SearchExpanded;
                v46 = nil;
                if #v485 > 0 then
                    local l_SearchExpanded_0 = v21.SearchExpanded;
                    local v487 = nil;
                    local l_lower_2 = string.lower;
                    local l_find_4 = string.find;
                    local l_tostring_1 = tostring;
                    local v491 = l_lower_2(v485);
                    local function v492(v493) --[[ Line: 1816 ]] --[[ Name: defaultSearch ]]
                        local v494 = false;
                        for v495 = 1, #v493 do
                            local v496 = v493[v495];
                            local l_Obj_8 = v496.Obj;
                            if l_find_4(l_lower_2((l_tostring_1(l_Obj_8))), v491, 1, true) then
                                l_SearchExpanded_0[v496] = 0;
                                v25[v496] = true;
                                if not v494 then
                                    local l_Parent_7 = v496.Parent;
                                    while l_Parent_7 and (not v25[l_Parent_7] or l_SearchExpanded_0[l_Parent_7] == 0) do
                                        v27[l_Parent_7] = true;
                                        v25[l_Parent_7] = true;
                                        l_Parent_7 = l_Parent_7.Parent;
                                    end;
                                    v494 = true;
                                end;
                            end;
                            if #v496 > 0 then
                                v492(v496);
                            end;
                        end;
                    end;
                    if v3.Elevated then
                        local __ = tick();
                        local v500, v501 = v21.BuildSearchFunc(v485);
                        v46 = v500;
                        v487 = v501;
                    else
                        v46 = v492;
                    end;
                    if v487 then
                        l_table_0.clear(v26);
                        for v502 = 1, #v487 do
                            local v503 = {};
                            v26[v502] = v503;
                            local v504 = v487[v502]();
                            for v505 = 1, #v504 do
                                local v506 = v0[v504[v505]];
                                if v506 then
                                    v503[v506] = true;
                                end;
                            end;
                        end;
                    end;
                    if v46 then
                        local __ = tick();
                        v46(v0[game]);
                        v46(v39);
                    end;
                end;
                v21.ForceUpdate();
            end;
            v21.ClearSearch = function() --[[ Line: 1874 ]]
                v21.GuiElems.SearchBar.Text = "";
                v27 = v21.Expanded;
                v46 = nil;
            end;
            v21.InitSearch = function() --[[ Line: 1880 ]]
                local l_SearchBox_0 = v21.GuiElems.ToolBar.SearchFrame.SearchBox;
                v21.GuiElems.SearchBar = l_SearchBox_0;
                v4.ViewportTextBox.convert(l_SearchBox_0);
                l_SearchBox_0.FocusLost:Connect(function() --[[ Line: 1886 ]]
                    v21.DoSearch(l_SearchBox_0.Text);
                end);
            end;
            v21.InitEntryTemplate = function() --[[ Line: 1891 ]]
                v28 = v16({
                    {
                        1, 
                        "TextButton", 
                        {
                            AutoButtonColor = false, 
                            BackgroundColor3 = Color3.new(0, 0, 0), 
                            BackgroundTransparency = 1, 
                            BorderColor3 = Color3.new(0, 0, 0), 
                            Font = 3, 
                            Name = "Entry", 
                            Position = UDim2.new(0, 1, 0, 1), 
                            Size = UDim2.new(0, 250, 0, 20), 
                            Text = "", 
                            TextSize = 14
                        }
                    }, 
                    {
                        2, 
                        "Frame", 
                        {
                            BackgroundColor3 = Color3.new(0.04313725605607, 0.35294118523598, 0.68627452850342), 
                            BackgroundTransparency = 1, 
                            BorderColor3 = Color3.new(0.33725491166115, 0.49019610881805, 0.73725491762161), 
                            BorderSizePixel = 0, 
                            Name = "Indent", 
                            Parent = {
                                1
                            }, 
                            Position = UDim2.new(0, 20, 0, 0), 
                            Size = UDim2.new(1, -20, 1, 0)
                        }
                    }, 
                    {
                        3, 
                        "TextLabel", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            Font = 3, 
                            Name = "EntryName", 
                            Parent = {
                                2
                            }, 
                            Position = UDim2.new(0, 26, 0, 0), 
                            Size = UDim2.new(1, -26, 1, 0), 
                            Text = "Workspace", 
                            TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                            TextSize = 14, 
                            TextXAlignment = 0
                        }
                    }, 
                    {
                        4, 
                        "TextButton", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            ClipsDescendants = true, 
                            Font = 3, 
                            Name = "Expand", 
                            Parent = {
                                2
                            }, 
                            Position = UDim2.new(0, -20, 0, 0), 
                            Size = UDim2.new(0, 20, 0, 20), 
                            Text = "", 
                            TextSize = 14
                        }
                    }, 
                    {
                        5, 
                        "ImageLabel", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            Image = "rbxassetid://5642383285", 
                            ImageRectOffset = Vector2.new(144, 16), 
                            ImageRectSize = Vector2.new(16, 16), 
                            Name = "Icon", 
                            Parent = {
                                4
                            }, 
                            Position = UDim2.new(0, 2, 0, 2), 
                            ScaleType = 4, 
                            Size = UDim2.new(0, 16, 0, 16)
                        }
                    }, 
                    {
                        6, 
                        "ImageLabel", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            Image = "rbxasset://textures/ClassImages.png", 
                            ImageRectOffset = Vector2.new(304, 0), 
                            ImageRectSize = Vector2.new(16, 16), 
                            Name = "Icon", 
                            Parent = {
                                2
                            }, 
                            Position = UDim2.new(0, 4, 0, 2), 
                            ScaleType = 4, 
                            Size = UDim2.new(0, 16, 0, 16)
                        }
                    }
                });
                local v509 = v4.ClickSystem.new();
                v509.AllowedButtons = {
                    1, 
                    2
                };
                v509.OnDown:Connect(function(v510, v511, v512) --[[ Line: 1903 ]]
                    local v513 = l_table_0.find(v23, v510);
                    if not v513 then
                        return;
                    else
                        local v514 = v22[v513 + v21.Index];
                        if not v514 then
                            return;
                        else
                            local __ = v23[v513];
                            if v512 == 1 then
                                if v511 == 2 then
                                    if v514.Obj:IsA("LuaSourceContainer") then
                                        v9.ViewScript(v514.Obj);
                                    elseif #v514 > 0 and v27[v514] ~= 0 then
                                        v27[v514] = not v27[v514];
                                        v21.Update();
                                    end;
                                end;
                                if v8.SelectObject(v514.Obj) then
                                    v509.IsRenaming = false;
                                    return;
                                else
                                    v509.IsRenaming = v1.Map[v514];
                                    if v4.IsShiftDown() then
                                        if not v1.Piviot then
                                            return;
                                        else
                                            local v516 = l_table_0.find(v22, v1.Piviot);
                                            local v517 = l_table_0.find(v22, v514);
                                            if not v516 or not v517 then
                                                return;
                                            else
                                                local v518 = l_math_0.min(v516, v517);
                                                v517 = l_math_0.max(v516, v517);
                                                v516 = v518;
                                                v518 = v1.List;
                                                for v519 = #v518, 1, -1 do
                                                    local v520 = v518[v519];
                                                    if v1.ShiftSet[v520] then
                                                        v1.Map[v520] = nil;
                                                        l_table_0.remove(v518, v519);
                                                    end;
                                                end;
                                                v1.ShiftSet = {};
                                                for v521 = v516, v517 do
                                                    local v522 = v22[v521];
                                                    if not v1.Map[v522] then
                                                        v1.ShiftSet[v522] = true;
                                                        v1.Map[v522] = true;
                                                        v518[#v518 + 1] = v522;
                                                    end;
                                                end;
                                                v1.Changed:Fire();
                                            end;
                                        end;
                                    elseif v4.IsCtrlDown() then
                                        v1.ShiftSet = {};
                                        if v1.Map[v514] then
                                            v1:Remove(v514);
                                        else
                                            v1:Add(v514);
                                        end;
                                        v1.Piviot = v514;
                                        v509.IsRenaming = false;
                                    elseif not v1.Map[v514] then
                                        v1.ShiftSet = {};
                                        v1:Set(v514);
                                        v1.Piviot = v514;
                                    end;
                                end;
                            elseif v512 == 2 then
                                if v8.SelectObject(v514.Obj) then
                                    return;
                                elseif not v4.IsCtrlDown() and not v1.Map[v514] then
                                    v1.ShiftSet = {};
                                    v1:Set(v514);
                                    v1.Piviot = v514;
                                    v21.Refresh();
                                end;
                            end;
                            v21.Refresh();
                            return;
                        end;
                    end;
                end);
                v509.OnRelease:Connect(function(v523, v524, v525) --[[ Line: 1980 ]]
                    local v526 = l_table_0.find(v23, v523);
                    if not v526 then
                        return;
                    else
                        local v527 = v22[v526 + v21.Index];
                        if not v527 then
                            return;
                        else
                            if v525 == 1 then
                                if v1.Map[v527] and not v4.IsShiftDown() and not v4.IsCtrlDown() then
                                    v1.ShiftSet = {};
                                    v1:Set(v527);
                                    v1.Piviot = v527;
                                    v21.Refresh();
                                end;
                                local l_ClickId_0 = v509.ClickId;
                                v4.FastWait(v509.ComboTime);
                                if v524 == 1 and l_ClickId_0 == v509.ClickId and v509.IsRenaming and v1.Map[v527] then
                                    v21.SetRenamingNode(v527);
                                    return;
                                end;
                            elseif v525 == 2 then
                                v21.ShowRightClick();
                            end;
                            return;
                        end;
                    end;
                end);
                v21.ClickSystem = v509;
            end;
            v21.InitDelCleaner = function() --[[ Line: 2006 ]]
                coroutine.wrap(function() --[[ Line: 2007 ]]
                    local l_FastWait_0 = v4.FastWait;
                    while true do
                        local v530 = false;
                        local v531 = 0;
                        for __, v533 in next, v0 do
                            if v533.HasDel then
                                local v534 = nil;
                                for v535 = 1, #v533 do
                                    if v533[v535].Del then
                                        v534 = v535;
                                        break;
                                    end;
                                end;
                                if v534 then
                                    for v536 = v534 + 1, #v533 do
                                        local v537 = v533[v536];
                                        if not v537.Del then
                                            v533[v534] = v537;
                                            v534 = v534 + 1;
                                        end;
                                    end;
                                    for v538 = v534, #v533 do
                                        v533[v538] = nil;
                                    end;
                                end;
                                v533.HasDel = false;
                                v530 = true;
                                l_FastWait_0();
                            end;
                            v531 = v531 + 1;
                            if v531 > 10000 then
                                v531 = 0;
                                l_FastWait_0();
                            end;
                        end;
                        if v530 and not v38 then
                            v21.PerformRefresh();
                        end;
                        l_FastWait_0(0.5);
                    end;
                end)();
            end;
            v21.UpdateSelectionVisuals = function() --[[ Line: 2049 ]]
                local l_SelectionVisualsHolder_0 = v21.SelectionVisualsHolder;
                local l_IsA_5 = game.IsA;
                local l_Clone_3 = game.Clone;
                if not l_SelectionVisualsHolder_0 then
                    l_SelectionVisualsHolder_0 = Instance.new("ScreenGui");
                    l_SelectionVisualsHolder_0.Name = "ExplorerSelections";
                    l_SelectionVisualsHolder_0.DisplayOrder = v3.DisplayOrders.Core;
                    v4.ShowGui(l_SelectionVisualsHolder_0);
                    v21.SelectionVisualsHolder = l_SelectionVisualsHolder_0;
                    v21.SelectionVisualCons = {};
                    v21.SelectionVisualGui = v16({
                        {
                            1, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BackgroundTransparency = 1, 
                                Size = UDim2.new(0, 100, 0, 100)
                            }
                        }, 
                        {
                            2, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(0.04313725605607, 0.35294118523598, 0.68627452850342), 
                                BorderSizePixel = 0, 
                                Parent = {
                                    1
                                }, 
                                Position = UDim2.new(0, -1, 0, -1), 
                                Size = UDim2.new(1, 2, 0, 1)
                            }
                        }, 
                        {
                            3, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(0.04313725605607, 0.35294118523598, 0.68627452850342), 
                                BorderSizePixel = 0, 
                                Parent = {
                                    1
                                }, 
                                Position = UDim2.new(0, -1, 1, 0), 
                                Size = UDim2.new(1, 2, 0, 1)
                            }
                        }, 
                        {
                            4, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(0.04313725605607, 0.35294118523598, 0.68627452850342), 
                                BorderSizePixel = 0, 
                                Parent = {
                                    1
                                }, 
                                Position = UDim2.new(0, -1, 0, 0), 
                                Size = UDim2.new(0, 1, 1, 0)
                            }
                        }, 
                        {
                            5, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(0.04313725605607, 0.35294118523598, 0.68627452850342), 
                                BorderSizePixel = 0, 
                                Parent = {
                                    1
                                }, 
                                Position = UDim2.new(1, 0, 0, 0), 
                                Size = UDim2.new(0, 1, 1, 0)
                            }
                        }
                    });
                    local l_SelectionBox_0 = Instance.new("SelectionBox");
                    l_SelectionBox_0.LineThickness = 0.03;
                    l_SelectionBox_0.Color3 = Color3.fromRGB(0, 170, 255);
                    v21.SelectionVisualBox = l_SelectionBox_0;
                end;
                l_SelectionVisualsHolder_0:ClearAllChildren();
                for __, v544 in pairs(v21.SelectionVisualGui:GetChildren()) do
                    v544.BackgroundColor3 = Color3.fromRGB(0, 170, 255);
                end;
                local l_SelectionVisualCons_0 = v21.SelectionVisualCons;
                for v546 = 1, #l_SelectionVisualCons_0 do
                    l_SelectionVisualCons_0[v546].Destroy();
                end;
                l_table_0.clear(l_SelectionVisualCons_0);
                local l_PartSelectionBox_0 = v6.Explorer.PartSelectionBox;
                local l_GuiSelectionBox_0 = v6.Explorer.GuiSelectionBox;
                if not l_PartSelectionBox_0 and not l_GuiSelectionBox_0 then
                    return;
                else
                    local l_SelectionVisualGui_0 = v21.SelectionVisualGui;
                    local l_SelectionVisualBox_0 = v21.SelectionVisualBox;
                    local l_AttachTo_0 = v4.AttachTo;
                    local l_List_19 = v1.List;
                    local v553 = 1;
                    local v554 = 0;
                    local v555 = v0[workspace];
                    for v556 = 1, #l_List_19 do
                        if v554 <= 1000 then
                            local v557 = l_List_19[v556];
                            local l_Obj_9 = v557.Obj;
                            if v557 ~= v555 then
                                if l_IsA_5(l_Obj_9, "GuiObject") and l_GuiSelectionBox_0 then
                                    local v559 = l_Clone_3(l_SelectionVisualGui_0);
                                    l_SelectionVisualCons_0[v553] = l_AttachTo_0(v559, {
                                        Target = l_Obj_9, 
                                        Resize = true
                                    });
                                    v553 = v553 + 1;
                                    v559.Parent = l_SelectionVisualsHolder_0;
                                    v554 = v554 + 1;
                                elseif l_IsA_5(l_Obj_9, "PVInstance") and l_PartSelectionBox_0 then
                                    local v560 = l_Clone_3(l_SelectionVisualBox_0);
                                    v560.Adornee = l_Obj_9;
                                    v560.Parent = l_SelectionVisualsHolder_0;
                                    v554 = v554 + 1;
                                end;
                            end;
                        else
                            break;
                        end;
                    end;
                    return;
                end;
            end;
            v21.Init = function() --[[ Line: 2121 ]]
                v21.ClassIcons = v4.IconMap.newLinear("rbxasset://textures/ClassImages.png", 16, 16);
                v21.MiscIcons = v3.MiscIcons;
                v43 = {};
                v1 = v4.Set.new();
                v1.ShiftSet = {};
                v1.Changed:Connect(v8.ShowExplorerProps);
                v21.Selection = v1;
                v21.InitRightClick();
                v21.InitInsertObject();
                v21.SetSortingEnabled(v6.Explorer.Sorting);
                v21.Expanded = setmetatable({}, {
                    __mode = "k"
                });
                v21.SearchExpanded = setmetatable({}, {
                    __mode = "k"
                });
                v27 = v21.Expanded;
                v39.Obj.Name = "Nil Instances";
                v39.Locked = true;
                local v561 = v16({
                    {
                        1, 
                        "Folder", 
                        {
                            Name = "ExplorerItems"
                        }
                    }, 
                    {
                        2, 
                        "Frame", 
                        {
                            BackgroundColor3 = Color3.new(0.20392157137394, 0.20392157137394, 0.20392157137394), 
                            BorderSizePixel = 0, 
                            Name = "ToolBar", 
                            Parent = {
                                1
                            }, 
                            Size = UDim2.new(1, 0, 0, 22)
                        }
                    }, 
                    {
                        3, 
                        "Frame", 
                        {
                            BackgroundColor3 = Color3.new(0.14901961386204, 0.14901961386204, 0.14901961386204), 
                            BorderColor3 = Color3.new(0.1176470592618, 0.1176470592618, 0.1176470592618), 
                            BorderSizePixel = 0, 
                            Name = "SearchFrame", 
                            Parent = {
                                2
                            }, 
                            Position = UDim2.new(0, 3, 0, 1), 
                            Size = UDim2.new(1, -6, 0, 18)
                        }
                    }, 
                    {
                        4, 
                        "TextBox", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            ClearTextOnFocus = false, 
                            Font = 3, 
                            Name = "SearchBox", 
                            Parent = {
                                3
                            }, 
                            PlaceholderColor3 = Color3.new(0.39215689897537, 0.39215689897537, 0.39215689897537), 
                            PlaceholderText = "Search workspace", 
                            Position = UDim2.new(0, 4, 0, 0), 
                            Size = UDim2.new(1, -24, 0, 18), 
                            Text = "", 
                            TextColor3 = Color3.new(1, 1, 1), 
                            TextSize = 14, 
                            TextXAlignment = 0
                        }
                    }, 
                    {
                        5, 
                        "UICorner", 
                        {
                            CornerRadius = UDim.new(0, 2), 
                            Parent = {
                                3
                            }
                        }
                    }, 
                    {
                        6, 
                        "TextButton", 
                        {
                            AutoButtonColor = false, 
                            BackgroundColor3 = Color3.new(0.12549020349979, 0.12549020349979, 0.12549020349979), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Font = 3, 
                            Name = "Reset", 
                            Parent = {
                                3
                            }, 
                            Position = UDim2.new(1, -17, 0, 1), 
                            Size = UDim2.new(0, 16, 0, 16), 
                            Text = "", 
                            TextColor3 = Color3.new(1, 1, 1), 
                            TextSize = 14
                        }
                    }, 
                    {
                        7, 
                        "ImageLabel", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            Image = "rbxassetid://5034718129", 
                            ImageColor3 = Color3.new(0.39215686917305, 0.39215686917305, 0.39215686917305), 
                            Parent = {
                                6
                            }, 
                            Size = UDim2.new(0, 16, 0, 16)
                        }
                    }, 
                    {
                        8, 
                        "TextButton", 
                        {
                            AutoButtonColor = false, 
                            BackgroundColor3 = Color3.new(0.12549020349979, 0.12549020349979, 0.12549020349979), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Font = 3, 
                            Name = "Refresh", 
                            Parent = {
                                2
                            }, 
                            Position = UDim2.new(1, -20, 0, 1), 
                            Size = UDim2.new(0, 18, 0, 18), 
                            Text = "", 
                            TextColor3 = Color3.new(1, 1, 1), 
                            TextSize = 14, 
                            Visible = false
                        }
                    }, 
                    {
                        9, 
                        "ImageLabel", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            Image = "rbxassetid://5642310344", 
                            Parent = {
                                8
                            }, 
                            Position = UDim2.new(0, 3, 0, 3), 
                            Size = UDim2.new(0, 12, 0, 12)
                        }
                    }, 
                    {
                        10, 
                        "Frame", 
                        {
                            BackgroundColor3 = Color3.new(0.15686275064945, 0.15686275064945, 0.15686275064945), 
                            BorderSizePixel = 0, 
                            Name = "ScrollCorner", 
                            Parent = {
                                1
                            }, 
                            Position = UDim2.new(1, -16, 1, -16), 
                            Size = UDim2.new(0, 16, 0, 16), 
                            Visible = false
                        }
                    }, 
                    {
                        11, 
                        "Frame", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            ClipsDescendants = true, 
                            Name = "List", 
                            Parent = {
                                1
                            }, 
                            Position = UDim2.new(0, 0, 0, 23), 
                            Size = UDim2.new(1, 0, 1, -23)
                        }
                    }
                });
                v30 = v561.ToolBar;
                v29 = v561.List;
                v21.GuiElems.ToolBar = v30;
                v21.GuiElems.TreeFrame = v29;
                v41 = v4.ScrollBar.new();
                v41.WheelIncrement = 3;
                v41.Gui.Position = UDim2.new(1, -16, 0, 23);
                v41:SetScrollFrame(v29);
                v41.Scrolled:Connect(function() --[[ Line: 2166 ]]
                    v21.Index = v41.Index;
                    v21.Refresh();
                end);
                v42 = v4.ScrollBar.new(true);
                v42.Increment = 5;
                v42.WheelIncrement = v21.EntryIndent;
                v42.Gui.Position = UDim2.new(0, 0, 1, -16);
                v42.Scrolled:Connect(function() --[[ Line: 2175 ]]
                    v21.Refresh();
                end);
                local v562 = v4.Window.new();
                v21.Window = v562;
                v562:SetTitle("Explorer");
                v562.GuiElems.Line.Position = UDim2.new(0, 0, 0, 22);
                v21.InitEntryTemplate();
                v30.Parent = v562.GuiElems.Content;
                v29.Parent = v562.GuiElems.Content;
                v561.ScrollCorner.Parent = v562.GuiElems.Content;
                v41.Gui.Parent = v562.GuiElems.Content;
                v42.Gui.Parent = v562.GuiElems.Content;
                v21.InitRenameBox();
                v21.InitSearch();
                v21.InitDelCleaner();
                v1.Changed:Connect(v21.UpdateSelectionVisuals);
                v562.GuiElems.Main:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 2198 ]]
                    if v21.Active then
                        v21.UpdateView();
                        v21.Refresh();
                    end;
                end);
                v562.OnActivate:Connect(function() --[[ Line: 2204 ]]
                    v21.Active = true;
                    v21.UpdateView();
                    v21.Update();
                    v21.Refresh();
                end);
                v562.OnRestore:Connect(function() --[[ Line: 2210 ]]
                    v21.Active = true;
                    v21.UpdateView();
                    v21.Update();
                    v21.Refresh();
                end);
                v562.OnDeactivate:Connect(function() --[[ Line: 2216 ]]
                    v21.Active = false;
                end);
                v562.OnMinimize:Connect(function() --[[ Line: 2217 ]]
                    v21.Active = false;
                end);
                v48 = v6.Explorer.AutoUpdateSearch;
                v0[game] = {
                    Obj = game
                };
                v27[v0[game]] = true;
                if v13.getnilinstances then
                    v0[v39.Obj] = v39;
                end;
                v21.SetupConnections();
                local v563 = l_GetDescendants_0(game);
                if v3.Elevated then
                    for v564 = 1, #v563 do
                        local v565 = v563[v564];
                        local v566 = v0[l_FindFirstAncestorWhichIsA_0(v565, "Instance")];
                        if v566 then
                            local v567 = {
                                Obj = v565, 
                                Parent = v566
                            };
                            v0[v565] = v567;
                            v566[#v566 + 1] = v567;
                        end;
                    end;
                    return;
                else
                    for v568 = 1, #v563 do
                        local v569 = v563[v568];
                        local __, l_result_4 = pcall(l_FindFirstAncestorWhichIsA_0, v569, "Instance");
                        local v572 = v0[l_result_4];
                        if v572 then
                            local v573 = {
                                Obj = v569, 
                                Parent = v572
                            };
                            v0[v569] = v573;
                            v572[#v572 + 1] = v573;
                        end;
                    end;
                    return;
                end;
            end;
            return v21;
        end;
        return {
            InitDeps = v19, 
            InitAfterMain = v20, 
            Main = v574
        };
    end, 
    Properties = function() --[[ Line: 2268 ]] --[[ Name: Properties ]]
        local v575 = nil;
        local v576 = nil;
        local v577 = nil;
        local v578 = nil;
        local v579 = nil;
        local v580 = nil;
        local v581 = nil;
        local v582 = nil;
        local v583 = nil;
        local v584 = nil;
        local v585 = nil;
        local v586 = nil;
        local v587 = nil;
        local v588 = nil;
        local v589 = nil;
        local function v591(v590) --[[ Line: 2280 ]] --[[ Name: initDeps ]]
            v575 = v590.Main;
            v576 = v590.Lib;
            v577 = v590.Apps;
            v578 = v590.Settings;
            v583 = v590.API;
            v584 = v590.RMD;
            v585 = v590.env;
            v586 = v590.service;
            v587 = v590.plr;
            v588 = v590.create;
            v589 = v590.createSimple;
        end;
        local function v592() --[[ Line: 2295 ]] --[[ Name: initAfterMain ]]
            v579 = v577.Explorer;
            v580 = v577.Properties;
            v581 = v577.ScriptViewer;
            v582 = v577.Notebook;
        end;
        local function v1058() --[[ Line: 2302 ]] --[[ Name: main ]]
            local v593 = {};
            local v594 = nil;
            local v595 = nil;
            local v596 = nil;
            local v597 = nil;
            local v598 = nil;
            local v599 = nil;
            local v600 = {};
            local v601 = {};
            local v602 = {};
            local v603 = {};
            local v604 = {};
            local v605 = {};
            local v606 = nil;
            local v607 = nil;
            local v608 = nil;
            local v609 = {};
            local v610 = {};
            local l_table_1 = table;
            local l_string_0 = string;
            local l_GetPropertyChangedSignal_0 = game.GetPropertyChangedSignal;
            local l_GetAttributeChangedSignal_0 = game.GetAttributeChangedSignal;
            local l_IsA_6 = game.IsA;
            local l_GetAttribute_0 = game.GetAttribute;
            local l_SetAttribute_0 = game.SetAttribute;
            v593.GuiElems = {};
            v593.Index = 0;
            v593.ViewWidth = 0;
            v593.MinInputWidth = 100;
            v593.EntryIndent = 16;
            v593.EntryOffset = 4;
            v593.NameWidthCache = {};
            v593.SubPropCache = {};
            v593.ClassLists = {};
            v593.SearchText = "";
            v593.AddAttributeProp = {
                Category = "Attributes", 
                Class = "", 
                Name = "", 
                SpecialRow = "AddAttribute", 
                Tags = {}
            };
            v593.SoundPreviewProp = {
                Category = "Data", 
                ValueType = {
                    Name = "SoundPlayer"
                }, 
                Class = "Sound", 
                Name = "Preview", 
                Tags = {}
            };
            v593.IgnoreProps = {
                DataModel = {
                    PrivateServerId = true, 
                    PrivateServerOwnerId = true, 
                    VIPServerId = true, 
                    VIPServerOwnerId = true
                }
            };
            v593.ExpandableTypes = {
                Vector2 = true, 
                Vector3 = true, 
                UDim = true, 
                UDim2 = true, 
                CFrame = true, 
                Rect = true, 
                PhysicalProperties = true, 
                Ray = true, 
                NumberRange = true, 
                Faces = true, 
                Axes = true
            };
            v593.ExpandableProps = {
                ["Sound.SoundId"] = true
            };
            v593.CollapsedCategories = {
                ["Surface Inputs"] = true, 
                Surface = true
            };
            v593.ConflictSubProps = {
                Vector2 = {
                    "X", 
                    "Y"
                }, 
                Vector3 = {
                    "X", 
                    "Y", 
                    "Z"
                }, 
                UDim = {
                    "Scale", 
                    "Offset"
                }, 
                UDim2 = {
                    "X", 
                    "X.Scale", 
                    "X.Offset", 
                    "Y", 
                    "Y.Scale", 
                    "Y.Offset"
                }, 
                CFrame = {
                    "Position", 
                    "Position.X", 
                    "Position.Y", 
                    "Position.Z", 
                    "RightVector", 
                    "RightVector.X", 
                    "RightVector.Y", 
                    "RightVector.Z", 
                    "UpVector", 
                    "UpVector.X", 
                    "UpVector.Y", 
                    "UpVector.Z", 
                    "LookVector", 
                    "LookVector.X", 
                    "LookVector.Y", 
                    "LookVector.Z"
                }, 
                Rect = {
                    "Min.X", 
                    "Min.Y", 
                    "Max.X", 
                    "Max.Y"
                }, 
                PhysicalProperties = {
                    "Density", 
                    "Elasticity", 
                    "ElasticityWeight", 
                    "Friction", 
                    "FrictionWeight"
                }, 
                Ray = {
                    "Origin", 
                    "Origin.X", 
                    "Origin.Y", 
                    "Origin.Z", 
                    "Direction", 
                    "Direction.X", 
                    "Direction.Y", 
                    "Direction.Z"
                }, 
                NumberRange = {
                    "Min", 
                    "Max"
                }, 
                Faces = {
                    "Back", 
                    "Bottom", 
                    "Front", 
                    "Left", 
                    "Right", 
                    "Top"
                }, 
                Axes = {
                    "X", 
                    "Y", 
                    "Z"
                }
            };
            v593.ConflictIgnore = {
                BasePart = {
                    ResizableFaces = true
                }
            };
            v593.RoundableTypes = {
                float = true, 
                double = true, 
                Color3 = true, 
                UDim = true, 
                UDim2 = true, 
                Vector2 = true, 
                Vector3 = true, 
                NumberRange = true, 
                Rect = true, 
                NumberSequence = true, 
                ColorSequence = true, 
                Ray = true, 
                CFrame = true
            };
            v593.TypeNameConvert = {
                number = "double", 
                boolean = "bool"
            };
            v593.ToNumberTypes = {
                int = true, 
                int64 = true, 
                float = true, 
                double = true
            };
            v593.DefaultPropValue = {
                string = "", 
                bool = false, 
                double = 0, 
                UDim = UDim.new(0, 0), 
                UDim2 = UDim2.new(0, 0, 0, 0), 
                BrickColor = BrickColor.new("Medium stone grey"), 
                Color3 = Color3.new(1, 1, 1), 
                Vector2 = Vector2.new(0, 0), 
                Vector3 = Vector3.new(0, 0, 0), 
                NumberSequence = NumberSequence.new(1), 
                ColorSequence = ColorSequence.new(Color3.new(1, 1, 1)), 
                NumberRange = NumberRange.new(0), 
                Rect = Rect.new(0, 0, 0, 0)
            };
            v593.AllowedAttributeTypes = {
                "string", 
                "boolean", 
                "number", 
                "UDim", 
                "UDim2", 
                "BrickColor", 
                "Color3", 
                "Vector2", 
                "Vector3", 
                "NumberSequence", 
                "ColorSequence", 
                "NumberRange", 
                "Rect"
            };
            v593.StringToValue = function(v618, v619) --[[ Line: 2433 ]]
                local l_Name_0 = v618.ValueType.Name;
                if l_Name_0 == "string" or l_Name_0 == "Content" then
                    return v619;
                elseif v593.ToNumberTypes[l_Name_0] then
                    return (tonumber(v619));
                else
                    if l_Name_0 == "Vector2" then
                        local v621 = v619:split(",");
                        local v622 = tonumber(v621[1]);
                        local v623 = tonumber(v621[2]);
                        if v622 and v623 and #v621 >= 2 then
                            return Vector2.new(v622, v623);
                        end;
                    elseif l_Name_0 == "Vector3" then
                        local v624 = v619:split(",");
                        local v625 = tonumber(v624[1]);
                        local v626 = tonumber(v624[2]);
                        local v627 = tonumber(v624[3]);
                        if v625 and v626 and v627 and #v624 >= 3 then
                            return Vector3.new(v625, v626, v627);
                        end;
                    elseif l_Name_0 == "UDim" then
                        local v628 = v619:split(",");
                        local v629 = tonumber(v628[1]);
                        local v630 = tonumber(v628[2]);
                        if v629 and v630 and #v628 >= 2 then
                            return UDim.new(v629, v630);
                        end;
                    elseif l_Name_0 == "UDim2" then
                        local v631 = v619:gsub("[{}]", ""):split(",");
                        local v632 = tonumber(v631[1]);
                        local v633 = tonumber(v631[2]);
                        local v634 = tonumber(v631[3]);
                        local v635 = tonumber(v631[4]);
                        if v632 and v633 and v634 and v635 and #v631 >= 4 then
                            return UDim2.new(v632, v633, v634, v635);
                        end;
                    elseif l_Name_0 == "CFrame" then
                        local v636 = v619:split(",");
                        local l_status_5, l_result_5 = pcall(CFrame.new, unpack(v636));
                        if l_status_5 and #v636 >= 12 then
                            return l_result_5;
                        end;
                    elseif l_Name_0 == "Rect" then
                        local v639 = v619:split(",");
                        local l_status_6, l_result_6 = pcall(Rect.new, unpack(v639));
                        if l_status_6 and #v639 >= 4 then
                            return l_result_6;
                        end;
                    elseif l_Name_0 == "Ray" then
                        local v642 = v619:gsub("[{}]", ""):split(",");
                        local l_status_7, l_result_7 = pcall(Vector3.new, unpack(v642, 1, 3));
                        local l_status_8, l_result_8 = pcall(Vector3.new, unpack(v642, 4, 6));
                        if l_status_7 and l_status_8 and #v642 >= 6 then
                            return Ray.new(l_result_7, l_result_8);
                        end;
                    elseif l_Name_0 == "NumberRange" then
                        local v647 = v619:split(",");
                        local l_status_9, l_result_9 = pcall(NumberRange.new, unpack(v647));
                        if l_status_9 and #v647 >= 1 then
                            return l_result_9;
                        end;
                    elseif l_Name_0 == "Color3" then
                        local v650 = v619:gsub("[{}]", ""):split(",");
                        local l_status_10, l_result_10 = pcall(Color3.fromRGB, unpack(v650));
                        if l_status_10 and #v650 >= 3 then
                            return l_result_10;
                        end;
                    end;
                    return nil;
                end;
            end;
            v593.ValueToString = function(v653, v654) --[[ Line: 2483 ]]
                local l_Name_1 = v653.ValueType.Name;
                if l_Name_1 == "Color3" then
                    return v576.ColorToBytes(v654);
                elseif l_Name_1 == "NumberRange" then
                    return v654.Min .. ", " .. v654.Max;
                else
                    return (tostring(v654));
                end;
            end;
            v593.GetIndexableProps = function(v656, v657) --[[ Line: 2496 ]]
                if not v575.Elevated and not pcall(function() --[[ Line: 2498 ]]
                    return v656.ClassName;
                end) then
                    return nil;
                else
                    local v658 = v593.IgnoreProps[v657.Name] or {};
                    local v659 = {};
                    local v660 = 1;
                    local l_Properties_0 = v657.Properties;
                    for v662 = 1, #l_Properties_0 do
                        local v663 = l_Properties_0[v662];
                        if not v658[v663.Name] and pcall(function() --[[ Line: 2509 ]]
                            return v656[v663.Name];
                        end) then
                            v659[v660] = v663;
                            v660 = v660 + 1;
                        end;
                    end;
                    return v659;
                end;
            end;
            v593.FindFirstObjWhichIsA = function(v664) --[[ Line: 2520 ]]
                local v665 = v593.ClassLists[v664] or {};
                if v665 and #v665 > 0 then
                    return v665[1];
                else
                    return nil;
                end;
            end;
            v593.ComputeConflicts = function(v666) --[[ Line: 2529 ]]
                local l_MaxConflictCheck_0 = v578.Properties.MaxConflictCheck;
                local l_List_20 = v579.Selection.List;
                local l_ClassLists_0 = v593.ClassLists;
                local l_split_0 = l_string_0.split;
                local l_clear_0 = l_table_1.clear;
                local l_ConflictIgnore_0 = v593.ConflictIgnore;
                local v673 = {};
                local v674 = v666 and {
                    v666
                } or v600;
                if v666 then
                    local v675 = v666.Class .. "." .. v666.Name;
                    v605[v675] = nil;
                    local v676 = v593.ConflictSubProps[v666.ValueType.Name] or {};
                    for v677 = 1, #v676 do
                        v605[v675 .. "." .. v676[v677]] = nil;
                    end;
                else
                    l_table_1.clear(v605);
                end;
                if #l_List_20 > 0 then
                    for v678 = 1, #v674 do
                        local v679 = v674[v678];
                        local l_Name_2 = v679.Name;
                        local l_Class_3 = v679.Class;
                        local l_Name_3 = (v679.RootType or v679.ValueType).Name;
                        local l_AttributeName_0 = v679.AttributeName;
                        local v684 = l_Class_3 .. "." .. l_Name_2;
                        local v685 = 0;
                        local v686 = v593.ConflictSubProps[l_Name_3] or {};
                        local v687 = #v686;
                        local v688 = v687 + 1;
                        local v689 = 0;
                        local v690 = {};
                        local v691 = l_ConflictIgnore_0[l_Class_3] and l_ConflictIgnore_0[l_Class_3][l_Name_2];
                        local v692 = l_Name_3 == "PhysicalProperties";
                        local l_IsAttribute_0 = v679.IsAttribute;
                        local l_MultiType_0 = v679.MultiType;
                        l_clear_0(v673);
                        if not l_MultiType_0 then
                            local v695 = nil;
                            local v696 = nil;
                            local v697 = nil;
                            local v698 = l_ClassLists_0[v679.Class] or {};
                            for v699 = 1, #v698 do
                                local v700 = v698[v699];
                                if not v697 then
                                    if l_IsAttribute_0 then
                                        v695 = l_GetAttribute_0(v700, l_AttributeName_0);
                                        if v695 ~= nil then
                                            v696 = v700;
                                            v697 = true;
                                        end;
                                    else
                                        v695 = v700[l_Name_2];
                                        v696 = v700;
                                        v697 = true;
                                    end;
                                    if v691 then
                                        break;
                                    end;
                                else
                                    local v701 = nil;
                                    local v702 = nil;
                                    if l_IsAttribute_0 then
                                        v701 = l_GetAttribute_0(v700, l_AttributeName_0);
                                        if v701 == nil then
                                            v702 = true;
                                        end;
                                    else
                                        v701 = v700[l_Name_2];
                                    end;
                                    if not v702 then
                                        if not v673[1] then
                                            if v692 then
                                                if (v695 and true or false) ~= (v701 and true or false) then
                                                    v673[1] = true;
                                                    v689 = v689 + 1;
                                                end;
                                            elseif v695 ~= v701 then
                                                v673[1] = true;
                                                v689 = v689 + 1;
                                            end;
                                        end;
                                        if v687 > 0 then
                                            for v703 = 1, v687 do
                                                local v704 = v690[v703];
                                                if not v704 then
                                                    v704 = l_split_0(v686[v703], ".");
                                                    v690[v703] = v704;
                                                end;
                                                local l_v695_0 = v695;
                                                local l_v701_0 = v701;
                                                for v707 = 1, #v704 do
                                                    if l_v695_0 and l_v701_0 then
                                                        local v708 = v704[v707];
                                                        l_v695_0 = l_v695_0[v708];
                                                        l_v701_0 = l_v701_0[v708];
                                                    else
                                                        break;
                                                    end;
                                                end;
                                                local v709 = v703 + 1;
                                                if not v673[v709] and l_v695_0 ~= l_v701_0 then
                                                    v673[v709] = true;
                                                    v689 = v689 + 1;
                                                end;
                                            end;
                                        end;
                                        if v689 == v688 then
                                            break;
                                        end;
                                    end;
                                end;
                                v685 = v685 + 1;
                                if v685 == l_MaxConflictCheck_0 then
                                    break;
                                end;
                            end;
                            if not v673[1] then
                                v605[v684] = v696;
                            end;
                            for v710 = 1, v687 do
                                if not v673[v710 + 1] then
                                    v605[v684 .. "." .. v686[v710]] = v696;
                                end;
                            end;
                        end;
                    end;
                end;
                if v666 then
                    v593.Refresh();
                end;
            end;
            v578.Properties.ShowAttributes = true;
            v593.ShowExplorerProps = function() --[[ Line: 2660 ]]
                local __ = v578.Properties.MaxConflictCheck;
                local l_List_21 = v579.Selection.List;
                local v713 = {};
                local v714 = 1;
                local __ = v575.Elevated;
                local l_ShowDeprecated_0 = v578.Properties.ShowDeprecated;
                local l_ShowHidden_0 = v578.Properties.ShowHidden;
                local l_Classes_1 = v583.Classes;
                local v719 = {};
                local l_lower_3 = l_string_0.lower;
                local l_PropertyOrders_0 = v584.PropertyOrders;
                local l_GetAttributes_0 = game.GetAttributes;
                local l_MaxAttributes_0 = v578.Properties.MaxAttributes;
                local l_ShowAttributes_0 = v578.Properties.ShowAttributes;
                local v725 = {};
                local v726 = 0;
                local l_typeof_0 = typeof;
                local l_TypeNameConvert_0 = v593.TypeNameConvert;
                l_table_1.clear(v600);
                for v729 = 1, #l_List_21 do
                    local v730 = l_List_21[v729];
                    local l_Obj_10 = v730.Obj;
                    local l_Class_4 = v730.Class;
                    if not l_Class_4 then
                        l_Class_4 = l_Obj_10.ClassName;
                        v730.Class = l_Class_4;
                    end;
                    local v733 = l_Classes_1[l_Class_4];
                    while v733 do
                        local l_Name_4 = v733.Name;
                        if not v713[l_Name_4] then
                            local v735 = v603[l_Name_4];
                            if not v735 then
                                v735 = v593.GetIndexableProps(l_Obj_10, v733);
                                v603[l_Name_4] = v735;
                            end;
                            for v736 = 1, #v735 do
                                local v737 = v735[v736];
                                local l_Tags_1 = v737.Tags;
                                if (not l_Tags_1.Deprecated or l_ShowDeprecated_0) and (not l_Tags_1.Hidden or l_ShowHidden_0) then
                                    v600[v714] = v737;
                                    v714 = v714 + 1;
                                end;
                            end;
                            v713[l_Name_4] = true;
                        end;
                        local v739 = v719[l_Name_4];
                        if not v739 then
                            v739 = {};
                            v719[l_Name_4] = v739;
                        end;
                        v739[#v739 + 1] = l_Obj_10;
                        v733 = v733.Superclass;
                    end;
                    if l_ShowAttributes_0 and v726 < l_MaxAttributes_0 then
                        local v740 = l_GetAttributes_0(l_Obj_10);
                        for v741, v742 in pairs(v740) do
                            local v743 = l_typeof_0(v742);
                            if not v725[v741] then
                                local v744 = v743 == "Instance" and "Class" or v743 == "EnumItem" and "Enum" or "Other";
                                local v745 = {
                                    Name = l_TypeNameConvert_0[v743] or v743, 
                                    Category = v744
                                };
                                local v746 = {
                                    IsAttribute = true, 
                                    Name = "ATTR_" .. v741, 
                                    AttributeName = v741, 
                                    DisplayName = v741, 
                                    Class = "Instance", 
                                    ValueType = v745, 
                                    Category = "Attributes", 
                                    Tags = {}
                                };
                                v600[v714] = v746;
                                v714 = v714 + 1;
                                v726 = v726 + 1;
                                v725[v741] = {
                                    v743, 
                                    v746
                                };
                                if v726 == l_MaxAttributes_0 then
                                    break;
                                end;
                            elseif v725[v741][1] ~= v743 then
                                v725[v741][2].MultiType = true;
                                v725[v741][2].Tags.ReadOnly = true;
                                v725[v741][2].ValueType = {
                                    Name = "string"
                                };
                            end;
                        end;
                    end;
                end;
                l_table_1.sort(v600, function(v747, v748) --[[ Line: 2734 ]]
                    if v747.Category ~= v748.Category then
                        return (v599[v747.Category] or 9999) < (v599[v748.Category] or 9999);
                    else
                        local v749 = l_PropertyOrders_0[v747.Class] and l_PropertyOrders_0[v747.Class][v747.Name] or 9999999;
                        local v750 = l_PropertyOrders_0[v748.Class] and l_PropertyOrders_0[v748.Class][v748.Name] or 9999999;
                        if v749 ~= v750 then
                            return v749 < v750;
                        else
                            return l_lower_3(v747.Name) < l_lower_3(v748.Name);
                        end;
                    end;
                end);
                v593.ClassLists = v719;
                v593.ComputeConflicts();
                if #v600 > 0 then
                    v600[#v600 + 1] = v593.AddAttributeProp;
                end;
                v593.Update();
                v593.Refresh();
            end;
            v593.UpdateView = function() --[[ Line: 2760 ]]
                local v751 = math.ceil(v596.AbsoluteSize.Y / 23);
                local l_X_3 = v596.AbsoluteSize.X;
                local v753 = v593.ViewWidth + v593.MinInputWidth;
                v597.VisibleSpace = v751;
                v597.TotalSpace = #v601 + 1;
                v598.VisibleSpace = l_X_3;
                v598.TotalSpace = v753;
                v597.Gui.Visible = v751 < #v601 + 1;
                local l_Gui_0 = v598.Gui;
                local v755 = false;
                if v578.Properties.ScaleType == 0 then
                    v755 = l_X_3 < v753;
                end;
                l_Gui_0.Visible = v755;
                l_Gui_0 = v596.Size;
                v596.Size = UDim2.new(1, v597.Gui.Visible and -16 or 0, 1, v598.Gui.Visible and -39 or -23);
                if l_Gui_0 ~= v596.Size then
                    v593.UpdateView();
                    return;
                else
                    v597:Update();
                    v598:Update();
                    if v597.Gui.Visible and v598.Gui.Visible then
                        v597.Gui.Size = UDim2.new(0, 16, 1, -39);
                        v598.Gui.Size = UDim2.new(1, -16, 0, 16);
                        v593.Window.GuiElems.Content.ScrollCorner.Visible = true;
                    else
                        v597.Gui.Size = UDim2.new(0, 16, 1, -23);
                        v598.Gui.Size = UDim2.new(1, 0, 0, 16);
                        v593.Window.GuiElems.Content.ScrollCorner.Visible = false;
                    end;
                    v593.Index = v597.Index;
                    return;
                end;
            end;
            v593.MakeSubProp = function(v756, v757, v758, v759) --[[ Line: 2795 ]]
                local v760 = {};
                for v761, v762 in pairs(v756) do
                    v760[v761] = v762;
                end;
                v760.RootType = v760.RootType or v760.ValueType;
                v760.ValueType = v758;
                v760.SubName = v760.SubName and v760.SubName .. v757 or v757;
                v760.DisplayName = v759;
                return v760;
            end;
            v593.GetExpandedProps = function(v763) --[[ Line: 2808 ]]
                local v764 = {};
                local l_Name_5 = v763.ValueType.Name;
                local l_MakeSubProp_0 = v593.MakeSubProp;
                if l_Name_5 == "Vector2" then
                    v764[1] = l_MakeSubProp_0(v763, ".X", {
                        Name = "float"
                    });
                    v764[2] = l_MakeSubProp_0(v763, ".Y", {
                        Name = "float"
                    });
                elseif l_Name_5 == "Vector3" then
                    v764[1] = l_MakeSubProp_0(v763, ".X", {
                        Name = "float"
                    });
                    v764[2] = l_MakeSubProp_0(v763, ".Y", {
                        Name = "float"
                    });
                    v764[3] = l_MakeSubProp_0(v763, ".Z", {
                        Name = "float"
                    });
                elseif l_Name_5 == "CFrame" then
                    v764[1] = l_MakeSubProp_0(v763, ".Position", {
                        Name = "Vector3"
                    });
                    v764[2] = l_MakeSubProp_0(v763, ".RightVector", {
                        Name = "Vector3"
                    });
                    v764[3] = l_MakeSubProp_0(v763, ".UpVector", {
                        Name = "Vector3"
                    });
                    v764[4] = l_MakeSubProp_0(v763, ".LookVector", {
                        Name = "Vector3"
                    });
                elseif l_Name_5 == "UDim" then
                    v764[1] = l_MakeSubProp_0(v763, ".Scale", {
                        Name = "float"
                    });
                    v764[2] = l_MakeSubProp_0(v763, ".Offset", {
                        Name = "int"
                    });
                elseif l_Name_5 == "UDim2" then
                    v764[1] = l_MakeSubProp_0(v763, ".X", {
                        Name = "UDim"
                    });
                    v764[2] = l_MakeSubProp_0(v763, ".Y", {
                        Name = "UDim"
                    });
                elseif l_Name_5 == "Rect" then
                    v764[1] = l_MakeSubProp_0(v763, ".Min.X", {
                        Name = "float"
                    }, "X0");
                    v764[2] = l_MakeSubProp_0(v763, ".Min.Y", {
                        Name = "float"
                    }, "Y0");
                    v764[3] = l_MakeSubProp_0(v763, ".Max.X", {
                        Name = "float"
                    }, "X1");
                    v764[4] = l_MakeSubProp_0(v763, ".Max.Y", {
                        Name = "float"
                    }, "Y1");
                elseif l_Name_5 == "PhysicalProperties" then
                    v764[1] = l_MakeSubProp_0(v763, ".Density", {
                        Name = "float"
                    });
                    v764[2] = l_MakeSubProp_0(v763, ".Elasticity", {
                        Name = "float"
                    });
                    v764[3] = l_MakeSubProp_0(v763, ".ElasticityWeight", {
                        Name = "float"
                    });
                    v764[4] = l_MakeSubProp_0(v763, ".Friction", {
                        Name = "float"
                    });
                    v764[5] = l_MakeSubProp_0(v763, ".FrictionWeight", {
                        Name = "float"
                    });
                elseif l_Name_5 == "Ray" then
                    v764[1] = l_MakeSubProp_0(v763, ".Origin", {
                        Name = "Vector3"
                    });
                    v764[2] = l_MakeSubProp_0(v763, ".Direction", {
                        Name = "Vector3"
                    });
                elseif l_Name_5 == "NumberRange" then
                    v764[1] = l_MakeSubProp_0(v763, ".Min", {
                        Name = "float"
                    });
                    v764[2] = l_MakeSubProp_0(v763, ".Max", {
                        Name = "float"
                    });
                elseif l_Name_5 == "Faces" then
                    v764[1] = l_MakeSubProp_0(v763, ".Back", {
                        Name = "bool"
                    });
                    v764[2] = l_MakeSubProp_0(v763, ".Bottom", {
                        Name = "bool"
                    });
                    v764[3] = l_MakeSubProp_0(v763, ".Front", {
                        Name = "bool"
                    });
                    v764[4] = l_MakeSubProp_0(v763, ".Left", {
                        Name = "bool"
                    });
                    v764[5] = l_MakeSubProp_0(v763, ".Right", {
                        Name = "bool"
                    });
                    v764[6] = l_MakeSubProp_0(v763, ".Top", {
                        Name = "bool"
                    });
                elseif l_Name_5 == "Axes" then
                    v764[1] = l_MakeSubProp_0(v763, ".X", {
                        Name = "bool"
                    });
                    v764[2] = l_MakeSubProp_0(v763, ".Y", {
                        Name = "bool"
                    });
                    v764[3] = l_MakeSubProp_0(v763, ".Z", {
                        Name = "bool"
                    });
                end;
                if v763.Name == "SoundId" and v763.Class == "Sound" then
                    v764[1] = v593.SoundPreviewProp;
                end;
                return v764;
            end;
            v593.Update = function() --[[ Line: 2869 ]]
                l_table_1.clear(v601);
                local l_NameWidthCache_0 = v593.NameWidthCache;
                local v768 = nil;
                local v769 = 1;
                local v770 = 0;
                local v771 = 1;
                local l_TextService_1 = v586.TextService;
                local l_GetTextSize_1 = l_TextService_1.GetTextSize;
                local l_SourceSans_1 = Enum.Font.SourceSans;
                local v775 = Vector2.new(math.huge, 20);
                local l_split_1 = l_string_0.split;
                local l_EntryIndent_0 = v593.EntryIndent;
                local v778 = v578.Properties.ScaleType == 0;
                local l_find_5 = l_string_0.find;
                local l_lower_4 = l_string_0.lower;
                local v781 = false;
                if #v593.SearchText > 0 then
                    v781 = l_lower_4(v593.SearchText);
                end;
                local function v782(v783, v784) --[[ Line: 2887 ]] --[[ Name: recur ]]
                    for v785 = 1, #v783 do
                        local v786 = v783[v785];
                        local l_Name_6 = v786.Name;
                        local l_SubName_0 = v786.SubName;
                        local l_Category_0 = v786.Category;
                        local v790 = nil;
                        if v781 and v784 == 1 then
                            if l_find_5(l_lower_4(l_Name_6), v781, 1, true) then
                                v790 = true;
                            end;
                        else
                            v790 = true;
                        end;
                        if v790 and v768 ~= l_Category_0 then
                            v601[v769] = {
                                CategoryName = l_Category_0
                            };
                            v769 = v769 + 1;
                            v768 = l_Category_0;
                        end;
                        if v602["CAT_" .. l_Category_0] and v790 or v786.SpecialRow then
                            if v784 > 1 then
                                v786.Depth = v784;
                                if v771 < v784 then
                                    v771 = v784;
                                end;
                            end;
                            if v778 then
                                local v791 = l_SubName_0 and l_split_1(l_SubName_0, ".");
                                local v792 = v786.DisplayName or v791 and v791[#v791] or l_Name_6;
                                local v793 = l_NameWidthCache_0[v792];
                                if not v793 then
                                    v793 = l_GetTextSize_1(l_TextService_1, v792, 14, l_SourceSans_1, v775).X;
                                    l_NameWidthCache_0[v792] = v793;
                                end;
                                local v794 = v793 + l_EntryIndent_0 * v784;
                                if v770 < v794 then
                                    v770 = v794;
                                end;
                            end;
                            v601[v769] = v786;
                            v769 = v769 + 1;
                            if v602[v786.Class .. "." .. v786.Name .. (v786.SubName or "")] then
                                local v795 = v784 + 1;
                                local v796 = v593.GetExpandedProps(v786);
                                if #v796 > 0 then
                                    v782(v796, v795);
                                end;
                            end;
                        end;
                    end;
                end;
                v782(v600, 1);
                v608 = nil;
                v593.ViewWidth = v770 + 9 + v593.EntryOffset;
                v593.UpdateView();
            end;
            v593.NewPropEntry = function(v797) --[[ Line: 2946 ]]
                local v798 = v593.EntryTemplate:Clone();
                local l_NameFrame_0 = v798.NameFrame;
                local l_ValueFrame_0 = v798.ValueFrame;
                local v801 = v576.Checkbox.new(1);
                v801.Gui.Position = UDim2.new(0, 3, 0, 3);
                v801.Gui.Parent = l_ValueFrame_0;
                v801.OnInput:Connect(function() --[[ Line: 2953 ]]
                    local v802 = v601[v797 + v593.Index];
                    if not v802 then
                        return;
                    elseif v802.ValueType.Name == "PhysicalProperties" then
                        v593.SetProp(v802, v801.Toggled and true or nil);
                        return;
                    else
                        v593.SetProp(v802, v801.Toggled);
                        return;
                    end;
                end);
                v609[v797] = v801;
                local l_Label_0 = v575.MiscIcons:GetLabel();
                l_Label_0.Position = UDim2.new(0, 2, 0, 3);
                l_Label_0.Parent = v798.ValueFrame.RightButton;
                v798.Position = UDim2.new(0, 0, 0, 23 * (v797 - 1));
                l_NameFrame_0.Expand.InputBegan:Connect(function(v804) --[[ Line: 2971 ]]
                    local v805 = v601[v797 + v593.Index];
                    if not v805 or v804.UserInputType ~= Enum.UserInputType.MouseMovement then
                        return;
                    else
                        local v806 = v805.CategoryName and "CAT_" .. v805.CategoryName or v805.Class .. "." .. v805.Name .. (v805.SubName or "");
                        v575.MiscIcons:DisplayByKey(v798.NameFrame.Expand.Icon, v602[v806] and "Collapse_Over" or "Expand_Over");
                        return;
                    end;
                end);
                l_NameFrame_0.Expand.InputEnded:Connect(function(v807) --[[ Line: 2980 ]]
                    local v808 = v601[v797 + v593.Index];
                    if not v808 or v807.UserInputType ~= Enum.UserInputType.MouseMovement then
                        return;
                    else
                        local v809 = v808.CategoryName and "CAT_" .. v808.CategoryName or v808.Class .. "." .. v808.Name .. (v808.SubName or "");
                        v575.MiscIcons:DisplayByKey(v798.NameFrame.Expand.Icon, v602[v809] and "Collapse" or "Expand");
                        return;
                    end;
                end);
                l_NameFrame_0.Expand.MouseButton1Down:Connect(function() --[[ Line: 2989 ]]
                    local v810 = v601[v797 + v593.Index];
                    if not v810 then
                        return;
                    else
                        local v811 = v810.CategoryName and "CAT_" .. v810.CategoryName or v810.Class .. "." .. v810.Name .. (v810.SubName or "");
                        if not v810.CategoryName and not v593.ExpandableTypes[v810.ValueType and v810.ValueType.Name] and not v593.ExpandableProps[v811] then
                            return;
                        else
                            v602[v811] = not v602[v811];
                            v593.Update();
                            v593.Refresh();
                            return;
                        end;
                    end;
                end);
                l_NameFrame_0.PropName.InputBegan:Connect(function(v812) --[[ Line: 3001 ]]
                    local v813 = v601[v797 + v593.Index];
                    if not v813 then
                        return;
                    else
                        if v812.UserInputType == Enum.UserInputType.MouseMovement and not l_NameFrame_0.PropName.TextFits then
                            local l_FullNameFrame_0 = v593.FullNameFrame;
                            local v815 = l_string_0.split(v813.Class .. "." .. v813.Name .. (v813.SubName or ""), ".");
                            local v816 = v813.DisplayName or v815[#v815];
                            local l_X_4 = v586.TextService:GetTextSize(v816, 14, Enum.Font.SourceSans, Vector2.new(math.huge, 20)).X;
                            l_FullNameFrame_0.TextLabel.Text = v816;
                            l_FullNameFrame_0.Size = UDim2.new(0, l_X_4 + 4, 0, 22);
                            l_FullNameFrame_0.Visible = true;
                            v593.FullNameFrameIndex = v797;
                            v593.FullNameFrameAttach.SetData(l_FullNameFrame_0, {
                                Target = l_NameFrame_0
                            });
                            v593.FullNameFrameAttach.Enable();
                        end;
                        return;
                    end;
                end);
                l_NameFrame_0.PropName.InputEnded:Connect(function(v818) --[[ Line: 3020 ]]
                    if v818.UserInputType == Enum.UserInputType.MouseMovement and v593.FullNameFrameIndex == v797 then
                        v593.FullNameFrame.Visible = false;
                        v593.FullNameFrameAttach.Disable();
                    end;
                end);
                l_ValueFrame_0.ValueBox.MouseButton1Down:Connect(function() --[[ Line: 3027 ]]
                    local v819 = v601[v797 + v593.Index];
                    if not v819 then
                        return;
                    else
                        v593.SetInputProp(v819, v797);
                        return;
                    end;
                end);
                l_ValueFrame_0.ColorButton.MouseButton1Down:Connect(function() --[[ Line: 3034 ]]
                    local v820 = v601[v797 + v593.Index];
                    if not v820 then
                        return;
                    else
                        v593.SetInputProp(v820, v797, "color");
                        return;
                    end;
                end);
                l_ValueFrame_0.RightButton.MouseButton1Click:Connect(function() --[[ Line: 3041 ]]
                    local v821 = v601[v797 + v593.Index];
                    if not v821 then
                        return;
                    elseif v821.Class .. "." .. v821.Name .. (v821.SubName or "") == (v608 and v608.Class .. "." .. v608.Name .. (v608.SubName or "")) and v608.ValueType.Category == "Class" then
                        v608 = nil;
                        v593.SetProp(v821, nil);
                        return;
                    else
                        v593.SetInputProp(v821, v797, "right");
                        return;
                    end;
                end);
                l_NameFrame_0.ToggleAttributes.MouseButton1Click:Connect(function() --[[ Line: 3056 ]]
                    v578.Properties.ShowAttributes = not v578.Properties.ShowAttributes;
                    v593.ShowExplorerProps();
                end);
                v798.RowButton.MouseButton1Click:Connect(function() --[[ Line: 3061 ]]
                    v593.DisplayAddAttributeWindow();
                end);
                v798.EditAttributeButton.MouseButton1Down:Connect(function() --[[ Line: 3065 ]]
                    local v822 = v601[v797 + v593.Index];
                    if not v822 then
                        return;
                    else
                        v593.DisplayAttributeContext(v822);
                        return;
                    end;
                end);
                l_ValueFrame_0.SoundPreview.ControlButton.MouseButton1Click:Connect(function() --[[ Line: 3072 ]]
                    if v593.PreviewSound and v593.PreviewSound.Playing then
                        v593.SetSoundPreview(false);
                        return;
                    else
                        local v823 = v593.FindFirstObjWhichIsA("Sound");
                        if v823 then
                            v593.SetSoundPreview(v823);
                        end;
                        return;
                    end;
                end);
                l_ValueFrame_0.SoundPreview.InputBegan:Connect(function(v824) --[[ Line: 3081 ]]
                    if v824.UserInputType ~= Enum.UserInputType.MouseButton1 then
                        return;
                    else
                        local v825 = nil;
                        local v826 = nil;
                        v825 = v586.UserInputService.InputEnded:Connect(function(v827) --[[ Line: 3085 ]]
                            if v827.UserInputType ~= Enum.UserInputType.MouseButton1 then
                                return;
                            else
                                v825:Disconnect();
                                v826:Disconnect();
                                return;
                            end;
                        end);
                        local l_TimeLine_0 = v798.ValueFrame.SoundPreview.TimeLine;
                        local v829 = v593.FindFirstObjWhichIsA("Sound");
                        if v829 then
                            v593.SetSoundPreview(v829, true);
                        end;
                        local function v836(v830) --[[ Line: 3095 ]] --[[ Name: update ]]
                            local l_PreviewSound_0 = v593.PreviewSound;
                            if not l_PreviewSound_0 or l_PreviewSound_0.TimeLength == 0 then
                                return;
                            else
                                local l_X_5 = v830.Position.X;
                                local l_AbsoluteSize_0 = l_TimeLine_0.AbsoluteSize;
                                local v834 = l_X_5 - l_TimeLine_0.AbsolutePosition.X;
                                if l_AbsoluteSize_0.X <= 1 then
                                    return;
                                else
                                    if v834 < 0 then
                                        v834 = 0;
                                    elseif l_AbsoluteSize_0.X <= v834 then
                                        v834 = l_AbsoluteSize_0.X - 1;
                                    end;
                                    local v835 = v834 / (l_AbsoluteSize_0.X - 1);
                                    l_PreviewSound_0.TimePosition = v835 * l_PreviewSound_0.TimeLength;
                                    l_TimeLine_0.Slider.Position = UDim2.new(v835, -4, 0, -8);
                                    return;
                                end;
                            end;
                        end;
                        v836(v824);
                        v826 = v586.UserInputService.InputChanged:Connect(function(v837) --[[ Line: 3112 ]]
                            if v837.UserInputType == Enum.UserInputType.MouseMovement then
                                v836(v837);
                            end;
                        end);
                        return;
                    end;
                end);
                v798.Parent = v596;
                return {
                    Gui = v798, 
                    GuiElems = {
                        NameFrame = l_NameFrame_0, 
                        ValueFrame = l_ValueFrame_0, 
                        PropName = l_NameFrame_0.PropName, 
                        ValueBox = l_ValueFrame_0.ValueBox, 
                        Expand = l_NameFrame_0.Expand, 
                        ColorButton = l_ValueFrame_0.ColorButton, 
                        ColorPreview = l_ValueFrame_0.ColorButton.ColorPreview, 
                        Gradient = l_ValueFrame_0.ColorButton.ColorPreview.UIGradient, 
                        EnumArrow = l_ValueFrame_0.EnumArrow, 
                        Checkbox = l_ValueFrame_0.Checkbox, 
                        RightButton = l_ValueFrame_0.RightButton, 
                        RightButtonIcon = l_Label_0, 
                        RowButton = v798.RowButton, 
                        EditAttributeButton = v798.EditAttributeButton, 
                        ToggleAttributes = l_NameFrame_0.ToggleAttributes, 
                        SoundPreview = l_ValueFrame_0.SoundPreview, 
                        SoundPreviewSlider = l_ValueFrame_0.SoundPreview.TimeLine.Slider
                    }
                };
            end;
            v593.GetSoundPreviewEntry = function() --[[ Line: 3145 ]]
                for v838 = 1, #v601 do
                    if v601[v838] == v593.SoundPreviewProp then
                        return v604[v838 - v593.Index];
                    end;
                end;
            end;
            v593.SetSoundPreview = function(v839, v840) --[[ Line: 3153 ]]
                local l_PreviewSound_1 = v593.PreviewSound;
                if not l_PreviewSound_1 then
                    l_PreviewSound_1 = Instance.new("Sound");
                    l_PreviewSound_1.Name = "Preview";
                    l_PreviewSound_1.Paused:Connect(function() --[[ Line: 3158 ]]
                        local v842 = v593.GetSoundPreviewEntry();
                        if v842 then
                            v575.MiscIcons:DisplayByKey(v842.GuiElems.SoundPreview.ControlButton.Icon, "Play");
                        end;
                    end);
                    l_PreviewSound_1.Resumed:Connect(function() --[[ Line: 3162 ]]
                        v593.Refresh();
                    end);
                    l_PreviewSound_1.Ended:Connect(function() --[[ Line: 3163 ]]
                        local v843 = v593.GetSoundPreviewEntry();
                        if v843 then
                            v843.GuiElems.SoundPreviewSlider.Position = UDim2.new(0, -4, 0, -8);
                        end;
                        v593.Refresh();
                    end);
                    l_PreviewSound_1.Parent = v594.Gui;
                    v593.PreviewSound = l_PreviewSound_1;
                end;
                if not v839 then
                    l_PreviewSound_1:Pause();
                else
                    local v844 = l_PreviewSound_1.SoundId ~= v839.SoundId;
                    l_PreviewSound_1.SoundId = v839.SoundId;
                    l_PreviewSound_1.PlaybackSpeed = v839.PlaybackSpeed;
                    l_PreviewSound_1.Volume = v839.Volume;
                    if v844 then
                        l_PreviewSound_1.TimePosition = 0;
                    end;
                    if not v840 then
                        l_PreviewSound_1:Resume();
                    end;
                    coroutine.wrap(function() --[[ Line: 3182 ]]
                        local v845 = tick();
                        v593.SoundPreviewTime = v845;
                        while v845 == v593.SoundPreviewTime and l_PreviewSound_1.Playing do
                            local v846 = v593.GetSoundPreviewEntry();
                            if v846 then
                                local l_TimeLength_0 = l_PreviewSound_1.TimeLength;
                                local v848 = l_PreviewSound_1.TimePosition / (l_TimeLength_0 == 0 and 1 or l_TimeLength_0);
                                v846.GuiElems.SoundPreviewSlider.Position = UDim2.new(v848, -4, 0, -8);
                            end;
                            v576.FastWait();
                        end;
                    end)();
                    v593.Refresh();
                end;
            end;
            v593.DisplayAttributeContext = function(v849) --[[ Line: 3199 ]]
                local l_AttributeContext_0 = v593.AttributeContext;
                if not l_AttributeContext_0 then
                    l_AttributeContext_0 = v576.ContextMenu.new();
                    l_AttributeContext_0.Iconless = true;
                    l_AttributeContext_0.Width = 80;
                end;
                l_AttributeContext_0:Clear();
                l_AttributeContext_0:Add({
                    Name = "Edit", 
                    OnClick = function() --[[ Line: 3208 ]] --[[ Name: OnClick ]]
                        v593.DisplayAddAttributeWindow(v849);
                    end
                });
                l_AttributeContext_0:Add({
                    Name = "Delete", 
                    OnClick = function() --[[ Line: 3211 ]] --[[ Name: OnClick ]]
                        v593.SetProp(v849, nil, true);
                        v593.ShowExplorerProps();
                    end
                });
                l_AttributeContext_0:Show();
            end;
            v593.DisplayAddAttributeWindow = function(v851) --[[ Line: 3219 ]]
                local l_AddAttributeWindow_0 = v593.AddAttributeWindow;
                if not l_AddAttributeWindow_0 then
                    l_AddAttributeWindow_0 = v576.Window.new();
                    l_AddAttributeWindow_0.Alignable = false;
                    l_AddAttributeWindow_0.Resizable = false;
                    l_AddAttributeWindow_0:SetTitle("Add Attribute");
                    l_AddAttributeWindow_0:SetSize(200, 130);
                    local v853 = v576.Button.new();
                    local v854 = v576.Label.new();
                    v854.Text = "Name";
                    v854.Position = UDim2.new(0, 30, 0, 10);
                    v854.Size = UDim2.new(0, 40, 0, 20);
                    l_AddAttributeWindow_0:Add(v854);
                    local v855 = v576.ViewportTextBox.new();
                    v855.Position = UDim2.new(0, 75, 0, 10);
                    v855.Size = UDim2.new(0, 120, 0, 20);
                    l_AddAttributeWindow_0:Add(v855, "NameBox");
                    local l_v855_0 = v855 --[[ copy: 4 -> 9 ]];
                    v855.TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 3239 ]]
                        v853:SetDisabled(#l_v855_0:GetText() == 0);
                    end);
                    local v857 = v576.Label.new();
                    v857.Text = "Type";
                    v857.Position = UDim2.new(0, 30, 0, 40);
                    v857.Size = UDim2.new(0, 40, 0, 20);
                    l_AddAttributeWindow_0:Add(v857);
                    local v858 = v576.DropDown.new();
                    v858.CanBeEmpty = false;
                    v858.Position = UDim2.new(0, 75, 0, 40);
                    v858.Size = UDim2.new(0, 120, 0, 20);
                    v858:SetOptions(v593.AllowedAttributeTypes);
                    l_AddAttributeWindow_0:Add(v858, "TypeChooser");
                    local v859 = v576.Label.new();
                    v859.Text = "";
                    v859.Position = UDim2.new(0, 5, 1, -45);
                    v859.Size = UDim2.new(1, -10, 0, 20);
                    v859.TextColor3 = v578.Theme.Important;
                    l_AddAttributeWindow_0.ErrorLabel = v859;
                    l_AddAttributeWindow_0:Add(v859, "Error");
                    local v860 = v576.Button.new();
                    v860.Text = "Cancel";
                    v860.Position = UDim2.new(1, -97, 1, -25);
                    v860.Size = UDim2.new(0, 92, 0, 20);
                    v860.OnClick:Connect(function() --[[ Line: 3268 ]]
                        l_AddAttributeWindow_0:Close();
                    end);
                    l_AddAttributeWindow_0:Add(v860);
                    v853.Text = "Save";
                    v853.Position = UDim2.new(0, 5, 1, -25);
                    v853.Size = UDim2.new(0, 92, 0, 20);
                    v853.OnClick:Connect(function() --[[ Line: 3276 ]]
                        local l_l_v855_0_Text_0 = l_v855_0:GetText();
                        if #l_l_v855_0_Text_0 > 100 then
                            v859.Text = "Error: Name over 100 chars";
                            return;
                        elseif l_l_v855_0_Text_0:sub(1, 3) == "RBX" then
                            v859.Text = "Error: Name begins with 'RBX'";
                            return;
                        else
                            local l_Selected_0 = v858.Selected;
                            local v863 = {
                                Name = v593.TypeNameConvert[l_Selected_0] or l_Selected_0, 
                                Category = "DataType"
                            };
                            local v864 = {
                                IsAttribute = true, 
                                Name = "ATTR_" .. l_l_v855_0_Text_0, 
                                AttributeName = l_l_v855_0_Text_0, 
                                DisplayName = l_l_v855_0_Text_0, 
                                Class = "Instance", 
                                ValueType = v863, 
                                Category = "Attributes", 
                                Tags = {}
                            };
                            v578.Properties.ShowAttributes = true;
                            v593.SetProp(v864, v593.DefaultPropValue[v863.Name], true, v593.EditingAttribute);
                            v593.ShowExplorerProps();
                            l_AddAttributeWindow_0:Close();
                            return;
                        end;
                    end);
                    l_AddAttributeWindow_0:Add(v853, "SaveButton");
                    v593.AddAttributeWindow = l_AddAttributeWindow_0;
                end;
                v593.EditingAttribute = v851;
                local v865 = v851 and "Edit Attribute " .. v851.AttributeName or "Add Attribute";
                l_AddAttributeWindow_0:SetTitle(v865);
                l_AddAttributeWindow_0.Elements.Error.Text = "";
                l_AddAttributeWindow_0.Elements.NameBox:SetText("");
                l_AddAttributeWindow_0.Elements.SaveButton:SetDisabled(true);
                l_AddAttributeWindow_0.Elements.TypeChooser:SetSelected(1);
                l_AddAttributeWindow_0:Show();
            end;
            v593.IsTextEditable = function(v866) --[[ Line: 3309 ]]
                local l_ValueType_0 = v866.ValueType;
                local l_Name_7 = l_ValueType_0.Name;
                local v869 = false;
                if l_Name_7 ~= "bool" then
                    v869 = false;
                    if l_ValueType_0.Category ~= "Enum" then
                        v869 = false;
                        if l_ValueType_0.Category ~= "Class" then
                            v869 = l_Name_7 ~= "BrickColor";
                        end;
                    end;
                end;
                return v869;
            end;
            v593.DisplayEnumDropdown = function(v870) --[[ Line: 3316 ]]
                local l_EnumContext_0 = v593.EnumContext;
                if not l_EnumContext_0 then
                    l_EnumContext_0 = v576.ContextMenu.new();
                    l_EnumContext_0.Iconless = true;
                    l_EnumContext_0.MaxHeight = 200;
                    l_EnumContext_0.ReverseYOffset = 22;
                    v593.EnumDropdown = l_EnumContext_0;
                end;
                if not v608 or v608.ValueType.Category ~= "Enum" then
                    return;
                else
                    local l_v608_0 = v608;
                    local l_ValueFrame_1 = v604[v870].GuiElems.ValueFrame;
                    local v874 = Enum[l_v608_0.ValueType.Name];
                    if not v874 then
                        return;
                    else
                        local v875 = {};
                        local l_next_0 = next;
                        local l_v874_EnumItems_0, v878 = v874:GetEnumItems();
                        for __, v880 in l_next_0, l_v874_EnumItems_0, v878 do
                            v875[#v875 + 1] = v880;
                        end;
                        l_table_1.sort(v875, function(v881, v882) --[[ Line: 3339 ]]
                            return v881.Name < v882.Name;
                        end);
                        l_EnumContext_0:Clear();
                        l_next_0 = function(v883) --[[ Line: 3343 ]] --[[ Name: onClick ]]
                            if l_v608_0 ~= v608 then
                                return;
                            else
                                local v884 = v874[v883];
                                v608 = nil;
                                v593.SetProp(l_v608_0, v884);
                                return;
                            end;
                        end;
                        for v885 = 1, #v875 do
                            l_EnumContext_0:Add({
                                Name = v875[v885].Name, 
                                OnClick = l_next_0
                            });
                        end;
                        l_EnumContext_0.Width = l_ValueFrame_1.AbsoluteSize.X;
                        l_EnumContext_0:Show(l_ValueFrame_1.AbsolutePosition.X, l_ValueFrame_1.AbsolutePosition.Y + 22);
                        return;
                    end;
                end;
            end;
            v593.DisplayBrickColorEditor = function(v886, v887, v888) --[[ Line: 3360 ]]
                local l_BrickColorEditor_0 = v593.BrickColorEditor;
                if not l_BrickColorEditor_0 then
                    l_BrickColorEditor_0 = v576.BrickColorPicker.new();
                    l_BrickColorEditor_0.Gui.DisplayOrder = v575.DisplayOrders.Menu;
                    l_BrickColorEditor_0.ReverseYOffset = 22;
                    l_BrickColorEditor_0.OnSelect:Connect(function(v890) --[[ Line: 3367 ]]
                        if not l_BrickColorEditor_0.CurrentProp or l_BrickColorEditor_0.CurrentProp.ValueType.Name ~= "BrickColor" then
                            return;
                        else
                            if l_BrickColorEditor_0.CurrentProp == v608 then
                                v608 = nil;
                            end;
                            v593.SetProp(l_BrickColorEditor_0.CurrentProp, BrickColor.new(v890));
                            return;
                        end;
                    end);
                    l_BrickColorEditor_0.OnMoreColors:Connect(function() --[[ Line: 3374 ]]
                        l_BrickColorEditor_0:Close();
                        local v891 = nil;
                        for __, v893 in pairs(v583.Classes.BasePart.Properties) do
                            if v893.Name == "Color" then
                                v891 = v893;
                                break;
                            end;
                        end;
                        v593.DisplayColorEditor(v891, l_BrickColorEditor_0.SavedColor.Color);
                    end);
                    v593.BrickColorEditor = l_BrickColorEditor_0;
                end;
                local l_ValueFrame_2 = v604[v887].GuiElems.ValueFrame;
                l_BrickColorEditor_0.CurrentProp = v886;
                l_BrickColorEditor_0.SavedColor = v888;
                if v886 and v886.Class == "BasePart" and v886.Name == "BrickColor" then
                    l_BrickColorEditor_0:SetMoreColorsVisible(true);
                else
                    l_BrickColorEditor_0:SetMoreColorsVisible(false);
                end;
                local l_X_6 = l_ValueFrame_2.AbsolutePosition.X;
                local v896 = l_ValueFrame_2.AbsolutePosition.Y + 22;
                l_BrickColorEditor_0:Show(l_X_6, v896);
            end;
            v593.DisplayColorEditor = function(v897, v898) --[[ Line: 3402 ]]
                local l_ColorEditor_0 = v593.ColorEditor;
                if not l_ColorEditor_0 then
                    l_ColorEditor_0 = v576.ColorPicker.new();
                    l_ColorEditor_0.OnSelect:Connect(function(v900) --[[ Line: 3407 ]]
                        if not l_ColorEditor_0.CurrentProp then
                            return;
                        else
                            local l_Name_8 = l_ColorEditor_0.CurrentProp.ValueType.Name;
                            if l_Name_8 ~= "Color3" and l_Name_8 ~= "BrickColor" then
                                return;
                            else
                                local v902 = l_Name_8 == "Color3" and v900 or BrickColor.new(v900);
                                if l_ColorEditor_0.CurrentProp == v608 then
                                    v608 = nil;
                                end;
                                v593.SetProp(l_ColorEditor_0.CurrentProp, v902);
                                return;
                            end;
                        end;
                    end);
                    v593.ColorEditor = l_ColorEditor_0;
                end;
                l_ColorEditor_0.CurrentProp = v897;
                if v898 then
                    l_ColorEditor_0:SetColor(v898);
                else
                    local v903 = v593.GetFirstPropVal(v897);
                    if v903 then
                        l_ColorEditor_0:SetColor(v903);
                    end;
                end;
                l_ColorEditor_0:Show();
            end;
            v593.DisplayNumberSequenceEditor = function(v904, v905) --[[ Line: 3431 ]]
                local l_NumberSequenceEditor_0 = v593.NumberSequenceEditor;
                if not l_NumberSequenceEditor_0 then
                    l_NumberSequenceEditor_0 = v576.NumberSequenceEditor.new();
                    l_NumberSequenceEditor_0.OnSelect:Connect(function(v907) --[[ Line: 3436 ]]
                        if not l_NumberSequenceEditor_0.CurrentProp or l_NumberSequenceEditor_0.CurrentProp.ValueType.Name ~= "NumberSequence" then
                            return;
                        else
                            if l_NumberSequenceEditor_0.CurrentProp == v608 then
                                v608 = nil;
                            end;
                            v593.SetProp(l_NumberSequenceEditor_0.CurrentProp, v907);
                            return;
                        end;
                    end);
                    v593.NumberSequenceEditor = l_NumberSequenceEditor_0;
                end;
                l_NumberSequenceEditor_0.CurrentProp = v904;
                if v905 then
                    l_NumberSequenceEditor_0:SetSequence(v905);
                else
                    local v908 = v593.GetFirstPropVal(v904);
                    if v908 then
                        l_NumberSequenceEditor_0:SetSequence(v908);
                    end;
                end;
                l_NumberSequenceEditor_0:Show();
            end;
            v593.DisplayColorSequenceEditor = function(v909, v910) --[[ Line: 3456 ]]
                local l_ColorSequenceEditor_0 = v593.ColorSequenceEditor;
                if not l_ColorSequenceEditor_0 then
                    l_ColorSequenceEditor_0 = v576.ColorSequenceEditor.new();
                    l_ColorSequenceEditor_0.OnSelect:Connect(function(v912) --[[ Line: 3461 ]]
                        if not l_ColorSequenceEditor_0.CurrentProp or l_ColorSequenceEditor_0.CurrentProp.ValueType.Name ~= "ColorSequence" then
                            return;
                        else
                            if l_ColorSequenceEditor_0.CurrentProp == v608 then
                                v608 = nil;
                            end;
                            v593.SetProp(l_ColorSequenceEditor_0.CurrentProp, v912);
                            return;
                        end;
                    end);
                    v593.ColorSequenceEditor = l_ColorSequenceEditor_0;
                end;
                l_ColorSequenceEditor_0.CurrentProp = v909;
                if v910 then
                    l_ColorSequenceEditor_0:SetSequence(v910);
                else
                    local v913 = v593.GetFirstPropVal(v909);
                    if v913 then
                        l_ColorSequenceEditor_0:SetSequence(v913);
                    end;
                end;
                l_ColorSequenceEditor_0:Show();
            end;
            v593.GetFirstPropVal = function(v914) --[[ Line: 3481 ]]
                local v915 = v593.FindFirstObjWhichIsA(v914.Class);
                if v915 then
                    return v593.GetPropVal(v914, v915);
                else
                    return;
                end;
            end;
            v593.GetPropVal = function(v916, v917) --[[ Line: 3488 ]]
                if v916.MultiType then
                    return "<Multiple Types>";
                elseif not v917 then
                    return;
                else
                    local v918 = nil;
                    if v916.IsAttribute then
                        v918 = l_GetAttribute_0(v917, v916.AttributeName);
                        if v918 == nil then
                            return nil;
                        else
                            local v919 = typeof(v918);
                            local v920 = v593.TypeNameConvert[v919] or v919;
                            if v916.RootType then
                                if v916.RootType.Name ~= v920 then
                                    return nil;
                                end;
                            elseif v916.ValueType.Name ~= v920 then
                                return nil;
                            end;
                        end;
                    else
                        v918 = v917[v916.Name];
                    end;
                    if v916.SubName then
                        local v921 = l_string_0.split(v916.SubName, ".");
                        for v922 = 1, #v921 do
                            local v923 = v921[v922];
                            if #v923 > 0 and v918 then
                                v918 = v918[v923];
                            end;
                        end;
                    end;
                    return v918;
                end;
            end;
            v593.SelectObject = function(v924) --[[ Line: 3522 ]]
                if v608 and v608.ValueType.Category == "Class" then
                    local l_v608_1 = v608;
                    v608 = nil;
                    if l_IsA_6(v924, l_v608_1.ValueType.Name) then
                        v593.SetProp(l_v608_1, v924);
                    else
                        v593.Refresh();
                    end;
                    return true;
                else
                    return false;
                end;
            end;
            v593.DisplayProp = function(v926, v927) --[[ Line: 3539 ]]
                local __ = v926.Name;
                local l_ValueType_1 = v926.ValueType;
                local l_Name_10 = l_ValueType_1.Name;
                local l_Tags_2 = v926.Tags;
                local v932 = v926.Class .. "." .. v926.Name .. (v926.SubName or "");
                local v933 = v605[v932];
                local v934 = v604[v927];
                local l_UDim2_0 = UDim2;
                local l_GuiElems_0 = v934.GuiElems;
                local __ = l_GuiElems_0.ValueFrame;
                local l_ValueBox_0 = l_GuiElems_0.ValueBox;
                local l_ColorButton_0 = l_GuiElems_0.ColorButton;
                local l_ColorPreview_0 = l_GuiElems_0.ColorPreview;
                local l_Gradient_0 = l_GuiElems_0.Gradient;
                local l_EnumArrow_0 = l_GuiElems_0.EnumArrow;
                local l_Checkbox_0 = l_GuiElems_0.Checkbox;
                local l_RightButton_0 = l_GuiElems_0.RightButton;
                local l_SoundPreview_0 = l_GuiElems_0.SoundPreview;
                local v946 = v593.GetPropVal(v926, v933);
                local v947 = v608 and v608.Class .. "." .. v608.Name .. (v608.SubName or "");
                local v948 = 4;
                local v949 = 6;
                if l_Name_10 == "Color3" or l_Name_10 == "BrickColor" or l_Name_10 == "ColorSequence" then
                    l_ColorButton_0.Visible = true;
                    l_EnumArrow_0.Visible = false;
                    if v946 then
                        l_Gradient_0.Color = l_Name_10 == "Color3" and ColorSequence.new(v946) or l_Name_10 == "BrickColor" and ColorSequence.new(v946.Color) or v946;
                    else
                        l_Gradient_0.Color = ColorSequence.new(Color3.new(1, 1, 1));
                    end;
                    l_ColorPreview_0.BorderColor3 = l_Name_10 == "ColorSequence" and Color3.new(1, 1, 1) or Color3.new(0, 0, 0);
                    v948 = 22;
                    v949 = 24 + (l_Name_10 == "ColorSequence" and 20 or 0);
                elseif l_ValueType_1.Category == "Enum" then
                    l_ColorButton_0.Visible = false;
                    l_EnumArrow_0.Visible = not v926.Tags.ReadOnly;
                    v949 = 22;
                elseif v932 == v947 and l_ValueType_1.Category == "Class" or l_Name_10 == "NumberSequence" then
                    l_ColorButton_0.Visible = false;
                    l_EnumArrow_0.Visible = false;
                    v949 = 26;
                else
                    l_ColorButton_0.Visible = false;
                    l_EnumArrow_0.Visible = false;
                end;
                l_ValueBox_0.Position = l_UDim2_0.new(0, v948, 0, 0);
                l_ValueBox_0.Size = l_UDim2_0.new(1, -v949, 1, 0);
                if v947 == v932 and l_ValueType_1.Category == "Class" then
                    v575.MiscIcons:DisplayByKey(l_GuiElems_0.RightButtonIcon, "Delete");
                    l_GuiElems_0.RightButtonIcon.Visible = true;
                    l_RightButton_0.Text = "";
                    l_RightButton_0.Visible = true;
                elseif l_Name_10 == "NumberSequence" or l_Name_10 == "ColorSequence" then
                    l_GuiElems_0.RightButtonIcon.Visible = false;
                    l_RightButton_0.Text = "...";
                    l_RightButton_0.Visible = true;
                else
                    l_RightButton_0.Visible = false;
                end;
                if l_Name_10 == "bool" or l_Name_10 == "PhysicalProperties" then
                    l_ValueBox_0.Visible = false;
                    l_Checkbox_0.Visible = true;
                    l_SoundPreview_0.Visible = false;
                    v609[v927].Disabled = l_Tags_2.ReadOnly;
                    if l_Name_10 == "PhysicalProperties" and v605[v932] then
                        v609[v927]:SetState(v946 and true or false);
                        return;
                    else
                        v609[v927]:SetState(v946);
                        return;
                    end;
                elseif l_Name_10 == "SoundPlayer" then
                    l_ValueBox_0.Visible = false;
                    l_Checkbox_0.Visible = false;
                    l_SoundPreview_0.Visible = true;
                    local v950 = v593.PreviewSound and v593.PreviewSound.Playing;
                    v575.MiscIcons:DisplayByKey(l_SoundPreview_0.ControlButton.Icon, v950 and "Pause" or "Play");
                    return;
                else
                    l_ValueBox_0.Visible = true;
                    l_Checkbox_0.Visible = false;
                    l_SoundPreview_0.Visible = false;
                    if v946 ~= nil then
                        if l_Name_10 == "Color3" then
                            l_ValueBox_0.Text = "[" .. v576.ColorToBytes(v946) .. "]";
                        elseif l_ValueType_1.Category == "Enum" then
                            l_ValueBox_0.Text = v946.Name;
                        elseif v593.RoundableTypes[l_Name_10] and v578.Properties.NumberRounding then
                            l_ValueBox_0.Text = v593.ValueToString(v926, v946):gsub("-?%d+%.%d+", function(v951) --[[ Line: 3637 ]]
                                return (tostring((tonumber(("%." .. v578.Properties.NumberRounding .. "f"):format(v951)))));
                            end);
                        else
                            l_ValueBox_0.Text = v593.ValueToString(v926, v946);
                        end;
                    else
                        l_ValueBox_0.Text = "";
                    end;
                    l_ValueBox_0.TextColor3 = l_Tags_2.ReadOnly and v578.Theme.PlaceholderText or v578.Theme.Text;
                    return;
                end;
            end;
            v593.Refresh = function() --[[ Line: 3651 ]]
                local v952 = math.max(math.ceil(v596.AbsoluteSize.Y / 23), 0);
                local l_X_7 = v596.AbsoluteSize.X;
                local v954 = math.max(v593.MinInputWidth, l_X_7 - v593.ViewWidth);
                local v955 = false;
                local __ = game.IsA;
                local l_UDim2_1 = UDim2;
                local l_split_2 = l_string_0.split;
                local l_ScaleType_0 = v578.Properties.ScaleType;
                for v960 = 1, #v610 do
                    v610[v960]:Disconnect();
                end;
                l_table_1.clear(v610);
                v593.FullNameFrame.Visible = false;
                v593.FullNameFrameAttach.Disable();
                for v961 = 1, v952 do
                    local v962 = v604[v961];
                    if not v604[v961] then
                        v962 = v593.NewPropEntry(v961);
                        v604[v961] = v962;
                    end;
                    local l_Gui_1 = v962.Gui;
                    local l_GuiElems_1 = v962.GuiElems;
                    local l_NameFrame_1 = l_GuiElems_1.NameFrame;
                    local l_PropName_0 = l_GuiElems_1.PropName;
                    local l_ValueFrame_4 = l_GuiElems_1.ValueFrame;
                    local l_Expand_0 = l_GuiElems_1.Expand;
                    local l_ValueBox_1 = l_GuiElems_1.ValueBox;
                    local l_PropName_1 = l_GuiElems_1.PropName;
                    local __ = l_GuiElems_1.RightButton;
                    local l_EditAttributeButton_0 = l_GuiElems_1.EditAttributeButton;
                    local l_ToggleAttributes_0 = l_GuiElems_1.ToggleAttributes;
                    local v974 = v601[v961 + v593.Index];
                    if v974 then
                        local v975 = l_ScaleType_0 == 0 and v598.Index or 0;
                        l_Gui_1.Visible = true;
                        l_Gui_1.Position = l_UDim2_1.new(0, -v975, 0, l_Gui_1.Position.Y.Offset);
                        l_Gui_1.Size = l_UDim2_1.new(l_ScaleType_0 == 0 and 0 or 1, l_ScaleType_0 == 0 and v593.ViewWidth + v954 or 0, 0, 22);
                        if v974.SpecialRow then
                            if v974.SpecialRow == "AddAttribute" then
                                l_NameFrame_1.Visible = false;
                                l_ValueFrame_4.Visible = false;
                                l_GuiElems_1.RowButton.Visible = true;
                            end;
                        else
                            l_NameFrame_1.Visible = true;
                            l_GuiElems_1.RowButton.Visible = false;
                            local v976 = v593.EntryIndent * (v974.Depth or 1) + v593.EntryOffset;
                            l_NameFrame_1.Position = l_UDim2_1.new(0, v976, 0, 0);
                            l_PropName_0.Size = l_UDim2_1.new(1, -2 - (l_ScaleType_0 == 0 and 0 or 6), 1, 0);
                            local v977 = v974.CategoryName and "CAT_" .. v974.CategoryName or v974.Class .. "." .. v974.Name .. (v974.SubName or "");
                            if v974.CategoryName then
                                l_Gui_1.BackgroundColor3 = v578.Theme.Main1;
                                l_ValueFrame_4.Visible = false;
                                l_PropName_1.Text = v974.CategoryName;
                                l_PropName_1.Font = Enum.Font.SourceSansBold;
                                l_Expand_0.Visible = true;
                                l_PropName_1.TextColor3 = v578.Theme.Text;
                                l_NameFrame_1.BackgroundTransparency = 1;
                                l_NameFrame_1.Size = l_UDim2_1.new(1, 0, 1, 0);
                                l_EditAttributeButton_0.Visible = false;
                                local l_ShowAttributes_1 = v578.Properties.ShowAttributes;
                                l_ToggleAttributes_0.Position = l_UDim2_1.new(1, -85 - v976, 0, 0);
                                l_ToggleAttributes_0.Text = l_ShowAttributes_1 and "[Setting: ON]" or "[Setting: OFF]";
                                l_ToggleAttributes_0.TextColor3 = v578.Theme.Text;
                                l_ToggleAttributes_0.Visible = v974.CategoryName == "Attributes";
                            else
                                local l_Name_11 = v974.Name;
                                local l_ValueType_2 = v974.ValueType;
                                local l_Name_12 = l_ValueType_2.Name;
                                local l_Tags_3 = v974.Tags;
                                local v983 = v605[v977];
                                local v984 = v974.IsAttribute and 20 or 0;
                                l_EditAttributeButton_0.Visible = v974.IsAttribute and not v974.RootType;
                                l_ToggleAttributes_0.Visible = false;
                                if l_ScaleType_0 == 0 then
                                    l_NameFrame_1.Size = l_UDim2_1.new(0, v593.ViewWidth - v976 - 1, 1, 0);
                                    l_ValueFrame_4.Position = l_UDim2_1.new(0, v593.ViewWidth, 0, 0);
                                    l_ValueFrame_4.Size = l_UDim2_1.new(0, v954 - v984, 1, 0);
                                else
                                    l_NameFrame_1.Size = l_UDim2_1.new(0.5, -v976 - 1, 1, 0);
                                    l_ValueFrame_4.Position = l_UDim2_1.new(0.5, 0, 0, 0);
                                    l_ValueFrame_4.Size = l_UDim2_1.new(0.5, -v984, 1, 0);
                                end;
                                local v985 = l_split_2(v977, ".");
                                l_PropName_1.Text = v974.DisplayName or v985[#v985];
                                l_PropName_1.Font = Enum.Font.SourceSans;
                                l_Gui_1.BackgroundColor3 = v578.Theme.Main2;
                                l_ValueFrame_4.Visible = true;
                                l_Expand_0.Visible = l_ValueType_2.Category == "DataType" and v593.ExpandableTypes[l_Name_12] or v593.ExpandableProps[v977];
                                l_PropName_1.TextColor3 = l_Tags_3.ReadOnly and v578.Theme.PlaceholderText or v578.Theme.Text;
                                v593.DisplayProp(v974, v961);
                                if v983 then
                                    if v974.IsAttribute then
                                        v610[#v610 + 1] = l_GetAttributeChangedSignal_0(v983, v974.AttributeName):Connect(function() --[[ Line: 3764 ]]
                                            v593.DisplayProp(v974, v961);
                                        end);
                                    else
                                        v610[#v610 + 1] = l_GetPropertyChangedSignal_0(v983, l_Name_11):Connect(function() --[[ Line: 3768 ]]
                                            v593.DisplayProp(v974, v961);
                                        end);
                                    end;
                                end;
                                local l_Visible_0 = l_ValueBox_1.Visible;
                                if v977 == (v608 and v608.Class .. "." .. v608.Name .. (v608.SubName or "")) then
                                    l_NameFrame_1.BackgroundColor3 = v578.Theme.ListSelection;
                                    l_NameFrame_1.BackgroundTransparency = 0;
                                    if l_ValueType_2.Category == "Class" or l_ValueType_2.Category == "Enum" or l_Name_12 == "BrickColor" then
                                        l_ValueFrame_4.BackgroundColor3 = v578.Theme.TextBox;
                                        l_ValueFrame_4.BackgroundTransparency = 0;
                                        l_ValueBox_1.Visible = true;
                                    else
                                        v955 = true;
                                        local v987 = l_ScaleType_0 == 0 and 0 or 0.5;
                                        local v988 = l_ScaleType_0 == 0 and v593.ViewWidth - v598.Index or 0;
                                        local v989 = 0;
                                        if l_Name_12 == "Color3" or l_Name_12 == "ColorSequence" then
                                            v988 = v988 + 22;
                                        end;
                                        if l_Name_12 == "NumberSequence" or l_Name_12 == "ColorSequence" then
                                            v989 = 20;
                                        end;
                                        v606.Position = l_UDim2_1.new(v987, v988, 0, l_Gui_1.Position.Y.Offset);
                                        v606.Size = l_UDim2_1.new(1 - v987, -v988 - v989 - v984, 0, 22);
                                        v606.Visible = true;
                                        l_ValueBox_1.Visible = false;
                                    end;
                                else
                                    l_NameFrame_1.BackgroundColor3 = v578.Theme.Main1;
                                    l_NameFrame_1.BackgroundTransparency = 1;
                                    l_ValueFrame_4.BackgroundColor3 = v578.Theme.Main1;
                                    l_ValueFrame_4.BackgroundTransparency = 1;
                                    l_ValueBox_1.Visible = l_Visible_0;
                                end;
                            end;
                            if v974.CategoryName or v593.ExpandableTypes[v974.ValueType and v974.ValueType.Name] or v593.ExpandableProps[v977] then
                                if v576.CheckMouseInGui(l_Expand_0) then
                                    v575.MiscIcons:DisplayByKey(l_Expand_0.Icon, v602[v977] and "Collapse_Over" or "Expand_Over");
                                else
                                    v575.MiscIcons:DisplayByKey(l_Expand_0.Icon, v602[v977] and "Collapse" or "Expand");
                                end;
                                l_Expand_0.Visible = true;
                            else
                                l_Expand_0.Visible = false;
                            end;
                        end;
                        l_Gui_1.Visible = true;
                    else
                        l_Gui_1.Visible = false;
                    end;
                end;
                if not v955 then
                    v606.Visible = false;
                end;
                for v990 = v952 + 1, #v604 do
                    v604[v990].Gui:Destroy();
                    v604[v990] = nil;
                    v609[v990] = nil;
                end;
            end;
            v593.SetProp = function(v991, v992, v993, v994) --[[ Line: 3841 ]]
                local l_List_22 = v579.Selection.List;
                local l_Name_13 = v991.Name;
                local l_SubName_1 = v991.SubName;
                local l_Class_5 = v991.Class;
                local l_Name_14 = v991.ValueType.Name;
                local l_AttributeName_1 = v991.AttributeName;
                local l_RootType_0 = v991.RootType;
                local v1002 = l_RootType_0 and l_RootType_0.Name;
                local __ = v991.Class .. "." .. v991.Name .. (v991.SubName or "");
                local l_Vector3_0 = Vector3;
                for v1005 = 1, #l_List_22 do
                    local l_Obj_11 = l_List_22[v1005].Obj;
                    if l_IsA_6(l_Obj_11, l_Class_5) then
                        pcall(function() --[[ Line: 3859 ]]
                            local l_v992_0 = v992;
                            local v1008 = nil;
                            v1008 = if v991.IsAttribute then l_GetAttribute_0(l_Obj_11, l_AttributeName_1) else l_Obj_11[l_Name_13];
                            if v994 then
                                if v994.ValueType.Name == l_Name_14 then
                                    l_v992_0 = l_GetAttribute_0(l_Obj_11, v994.AttributeName) or l_v992_0;
                                end;
                                l_SetAttribute_0(l_Obj_11, v994.AttributeName, nil);
                            end;
                            if v1002 then
                                if v1002 == "Vector2" then
                                    l_v992_0 = Vector2.new(l_SubName_1 == ".X" and l_v992_0 or v1008.X, l_SubName_1 == ".Y" and l_v992_0 or v1008.Y);
                                elseif v1002 == "Vector3" then
                                    l_v992_0 = l_Vector3_0.new(l_SubName_1 == ".X" and l_v992_0 or v1008.X, l_SubName_1 == ".Y" and l_v992_0 or v1008.Y, l_SubName_1 == ".Z" and l_v992_0 or v1008.Z);
                                elseif v1002 == "UDim" then
                                    l_v992_0 = UDim.new(l_SubName_1 == ".Scale" and l_v992_0 or v1008.Scale, l_SubName_1 == ".Offset" and l_v992_0 or v1008.Offset);
                                elseif v1002 == "UDim2" then
                                    local l_X_8 = v1008.X;
                                    local l_Y_2 = v1008.Y;
                                    local v1011 = l_SubName_1 == ".X" and l_v992_0 or UDim.new(l_SubName_1 == ".X.Scale" and l_v992_0 or l_X_8.Scale, l_SubName_1 == ".X.Offset" and l_v992_0 or l_X_8.Offset);
                                    local v1012 = l_SubName_1 == ".Y" and l_v992_0 or UDim.new(l_SubName_1 == ".Y.Scale" and l_v992_0 or l_Y_2.Scale, l_SubName_1 == ".Y.Offset" and l_v992_0 or l_Y_2.Offset);
                                    l_v992_0 = UDim2.new(v1011, v1012);
                                elseif v1002 == "CFrame" then
                                    local l_Position_0 = v1008.Position;
                                    local l_RightVector_0 = v1008.RightVector;
                                    local l_UpVector_0 = v1008.UpVector;
                                    local l_LookVector_0 = v1008.LookVector;
                                    local v1017 = l_SubName_1 == ".Position" and l_v992_0 or l_Vector3_0.new(l_SubName_1 == ".Position.X" and l_v992_0 or l_Position_0.X, l_SubName_1 == ".Position.Y" and l_v992_0 or l_Position_0.Y, l_SubName_1 == ".Position.Z" and l_v992_0 or l_Position_0.Z);
                                    local v1018 = l_SubName_1 == ".RightVector" and l_v992_0 or l_Vector3_0.new(l_SubName_1 == ".RightVector.X" and l_v992_0 or l_RightVector_0.X, l_SubName_1 == ".RightVector.Y" and l_v992_0 or l_RightVector_0.Y, l_SubName_1 == ".RightVector.Z" and l_v992_0 or l_RightVector_0.Z);
                                    local v1019 = l_SubName_1 == ".UpVector" and l_v992_0 or l_Vector3_0.new(l_SubName_1 == ".UpVector.X" and l_v992_0 or l_UpVector_0.X, l_SubName_1 == ".UpVector.Y" and l_v992_0 or l_UpVector_0.Y, l_SubName_1 == ".UpVector.Z" and l_v992_0 or l_UpVector_0.Z);
                                    local v1020 = l_SubName_1 == ".LookVector" and l_v992_0 or l_Vector3_0.new(l_SubName_1 == ".LookVector.X" and l_v992_0 or l_LookVector_0.X, l_SubName_1 == ".RightVector.Y" and l_v992_0 or l_LookVector_0.Y, l_SubName_1 == ".RightVector.Z" and l_v992_0 or l_LookVector_0.Z);
                                    l_v992_0 = CFrame.fromMatrix(v1017, v1018, v1019, -v1020);
                                elseif v1002 == "Rect" then
                                    local l_Min_0 = v1008.Min;
                                    local l_Max_0 = v1008.Max;
                                    local v1023 = Vector2.new(l_SubName_1 == ".Min.X" and l_v992_0 or l_Min_0.X, l_SubName_1 == ".Min.Y" and l_v992_0 or l_Min_0.Y);
                                    local v1024 = Vector2.new(l_SubName_1 == ".Max.X" and l_v992_0 or l_Max_0.X, l_SubName_1 == ".Max.Y" and l_v992_0 or l_Max_0.Y);
                                    l_v992_0 = Rect.new(v1023, v1024);
                                elseif v1002 == "PhysicalProperties" then
                                    local v1025 = PhysicalProperties.new(l_Obj_11.Material);
                                    local v1026 = l_SubName_1 == ".Density" and l_v992_0 or v1008 and v1008.Density or v1025.Density;
                                    local v1027 = l_SubName_1 == ".Friction" and l_v992_0 or v1008 and v1008.Friction or v1025.Friction;
                                    local v1028 = l_SubName_1 == ".Elasticity" and l_v992_0 or v1008 and v1008.Elasticity or v1025.Elasticity;
                                    local v1029 = l_SubName_1 == ".FrictionWeight" and l_v992_0 or v1008 and v1008.FrictionWeight or v1025.FrictionWeight;
                                    local v1030 = l_SubName_1 == ".ElasticityWeight" and l_v992_0 or v1008 and v1008.ElasticityWeight or v1025.ElasticityWeight;
                                    l_v992_0 = PhysicalProperties.new(v1026, v1027, v1028, v1029, v1030);
                                elseif v1002 == "Ray" then
                                    local l_Origin_0 = v1008.Origin;
                                    local l_Direction_0 = v1008.Direction;
                                    local v1033 = l_SubName_1 == ".Origin" and l_v992_0 or l_Vector3_0.new(l_SubName_1 == ".Origin.X" and l_v992_0 or l_Origin_0.X, l_SubName_1 == ".Origin.Y" and l_v992_0 or l_Origin_0.Y, l_SubName_1 == ".Origin.Z" and l_v992_0 or l_Origin_0.Z);
                                    local v1034 = l_SubName_1 == ".Direction" and l_v992_0 or l_Vector3_0.new(l_SubName_1 == ".Direction.X" and l_v992_0 or l_Direction_0.X, l_SubName_1 == ".Direction.Y" and l_v992_0 or l_Direction_0.Y, l_SubName_1 == ".Direction.Z" and l_v992_0 or l_Direction_0.Z);
                                    l_v992_0 = Ray.new(v1033, v1034);
                                elseif v1002 == "Faces" then
                                    local v1035 = {};
                                    for __, v1037 in pairs({
                                        "Back", 
                                        "Bottom", 
                                        "Front", 
                                        "Left", 
                                        "Right", 
                                        "Top"
                                    }) do
                                        local __ = nil;
                                        if if l_SubName_1 == "." .. v1037 then l_v992_0 else v1008[v1037] then
                                            v1035[#v1035 + 1] = Enum.NormalId[v1037];
                                        end;
                                    end;
                                    l_v992_0 = Faces.new(unpack(v1035));
                                elseif v1002 == "Axes" then
                                    local v1039 = {};
                                    for __, v1041 in pairs({
                                        "X", 
                                        "Y", 
                                        "Z"
                                    }) do
                                        local __ = nil;
                                        if if l_SubName_1 == "." .. v1041 then l_v992_0 else v1008[v1041] then
                                            v1039[#v1039 + 1] = Enum.Axis[v1041];
                                        end;
                                    end;
                                    l_v992_0 = Axes.new(unpack(v1039));
                                elseif v1002 == "NumberRange" then
                                    l_v992_0 = NumberRange.new(l_SubName_1 == ".Min" and l_v992_0 or v1008.Min, l_SubName_1 == ".Max" and l_v992_0 or v1008.Max);
                                end;
                            end;
                            if l_Name_14 == "PhysicalProperties" and l_v992_0 then
                                l_v992_0 = v1008 or PhysicalProperties.new(l_Obj_11.Material);
                            end;
                            if v991.IsAttribute then
                                l_SetAttribute_0(l_Obj_11, l_AttributeName_1, l_v992_0);
                                return;
                            else
                                l_Obj_11[l_Name_13] = l_v992_0;
                                return;
                            end;
                        end);
                    end;
                end;
                if not v993 then
                    v593.ComputeConflicts(v991);
                end;
            end;
            v593.InitInputBox = function() --[[ Line: 3961 ]]
                v606 = v588({
                    {
                        1, 
                        "Frame", 
                        {
                            BackgroundColor3 = Color3.new(0.14901961386204, 0.14901961386204, 0.14901961386204), 
                            BorderSizePixel = 0, 
                            Name = "InputBox", 
                            Size = UDim2.new(0, 200, 0, 22), 
                            Visible = false, 
                            ZIndex = 2
                        }
                    }, 
                    {
                        2, 
                        "TextBox", 
                        {
                            BackgroundColor3 = Color3.new(0.17647059261799, 0.17647059261799, 0.17647059261799), 
                            BackgroundTransparency = 1, 
                            BorderColor3 = Color3.new(0.062745101749897, 0.51764708757401, 1), 
                            BorderSizePixel = 0, 
                            ClearTextOnFocus = false, 
                            Font = 3, 
                            Parent = {
                                1
                            }, 
                            PlaceholderColor3 = Color3.new(0.69803923368454, 0.69803923368454, 0.69803923368454), 
                            Position = UDim2.new(0, 3, 0, 0), 
                            Size = UDim2.new(1, -6, 1, 0), 
                            Text = "", 
                            TextColor3 = Color3.new(1, 1, 1), 
                            TextSize = 14, 
                            TextXAlignment = 0, 
                            ZIndex = 2
                        }
                    }
                });
                v607 = v606.TextBox;
                v606.BackgroundColor3 = v578.Theme.TextBox;
                v606.Parent = v593.Window.GuiElems.Content.List;
                v607.FocusLost:Connect(function() --[[ Line: 3970 ]]
                    if not v608 then
                        return;
                    else
                        local l_v608_2 = v608;
                        v608 = nil;
                        local v1044 = v593.StringToValue(l_v608_2, v607.Text);
                        if v1044 then
                            v593.SetProp(l_v608_2, v1044);
                            return;
                        else
                            v593.Refresh();
                            return;
                        end;
                    end;
                end);
                v607.Focused:Connect(function() --[[ Line: 3979 ]]
                    v607.SelectionStart = 1;
                    v607.CursorPosition = #v607.Text + 1;
                end);
                v576.ViewportTextBox.convert(v607);
            end;
            v593.SetInputProp = function(v1045, v1046, v1047) --[[ Line: 3987 ]]
                local l_ValueType_3 = v1045.ValueType;
                local l_Name_15 = l_ValueType_3.Name;
                local v1050 = v605[v1045.Class .. "." .. v1045.Name .. (v1045.SubName or "")];
                local v1051 = v593.GetPropVal(v1045, v1050);
                if v1045.Tags.ReadOnly then
                    return;
                else
                    v608 = v1045;
                    if v1047 then
                        if v1047 == "color" then
                            if l_Name_15 == "Color3" then
                                v607.Text = v1051 and v593.ValueToString(v1045, v1051) or "";
                                v593.DisplayColorEditor(v1045, v1051);
                            elseif l_Name_15 == "BrickColor" then
                                v593.DisplayBrickColorEditor(v1045, v1046, v1051);
                            elseif l_Name_15 == "ColorSequence" then
                                v607.Text = v1051 and v593.ValueToString(v1045, v1051) or "";
                                v593.DisplayColorSequenceEditor(v1045, v1051);
                            end;
                        elseif v1047 == "right" then
                            if l_Name_15 == "NumberSequence" then
                                v607.Text = v1051 and v593.ValueToString(v1045, v1051) or "";
                                v593.DisplayNumberSequenceEditor(v1045, v1051);
                            elseif l_Name_15 == "ColorSequence" then
                                v607.Text = v1051 and v593.ValueToString(v1045, v1051) or "";
                                v593.DisplayColorSequenceEditor(v1045, v1051);
                            end;
                        end;
                    elseif v593.IsTextEditable(v1045) then
                        v607.Text = v1051 and v593.ValueToString(v1045, v1051) or "";
                        v607:CaptureFocus();
                    elseif l_ValueType_3.Category == "Enum" then
                        v593.DisplayEnumDropdown(v1046);
                    elseif l_Name_15 == "BrickColor" then
                        v593.DisplayBrickColorEditor(v1045, v1046, v1051);
                    end;
                    v593.Refresh();
                    return;
                end;
            end;
            v593.InitSearch = function() --[[ Line: 4030 ]]
                local l_SearchBox_1 = v593.GuiElems.ToolBar.SearchFrame.SearchBox;
                v576.ViewportTextBox.convert(l_SearchBox_1);
                l_SearchBox_1:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 4035 ]]
                    v593.SearchText = l_SearchBox_1.Text;
                    v593.Update();
                    v593.Refresh();
                end);
            end;
            v593.InitEntryStuff = function() --[[ Line: 4042 ]]
                v593.EntryTemplate = v588({
                    {
                        1, 
                        "TextButton", 
                        {
                            AutoButtonColor = false, 
                            BackgroundColor3 = Color3.new(0.17647059261799, 0.17647059261799, 0.17647059261799), 
                            BorderColor3 = Color3.new(0.1294117718935, 0.1294117718935, 0.1294117718935), 
                            Font = 3, 
                            Name = "Entry", 
                            Position = UDim2.new(0, 1, 0, 1), 
                            Size = UDim2.new(0, 250, 0, 22), 
                            Text = "", 
                            TextSize = 14
                        }
                    }, 
                    {
                        2, 
                        "Frame", 
                        {
                            BackgroundColor3 = Color3.new(0.04313725605607, 0.35294118523598, 0.68627452850342), 
                            BackgroundTransparency = 1, 
                            BorderColor3 = Color3.new(0.33725491166115, 0.49019610881805, 0.73725491762161), 
                            BorderSizePixel = 0, 
                            Name = "NameFrame", 
                            Parent = {
                                1
                            }, 
                            Position = UDim2.new(0, 20, 0, 0), 
                            Size = UDim2.new(1, -40, 1, 0)
                        }
                    }, 
                    {
                        3, 
                        "TextLabel", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            Font = 3, 
                            Name = "PropName", 
                            Parent = {
                                2
                            }, 
                            Position = UDim2.new(0, 2, 0, 0), 
                            Size = UDim2.new(1, -2, 1, 0), 
                            Text = "Anchored", 
                            TextColor3 = Color3.new(1, 1, 1), 
                            TextSize = 14, 
                            TextTransparency = 0.10000000149012, 
                            TextTruncate = 1, 
                            TextXAlignment = 0
                        }
                    }, 
                    {
                        4, 
                        "TextButton", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            ClipsDescendants = true, 
                            Font = 3, 
                            Name = "Expand", 
                            Parent = {
                                2
                            }, 
                            Position = UDim2.new(0, -20, 0, 1), 
                            Size = UDim2.new(0, 20, 0, 20), 
                            Text = "", 
                            TextSize = 14, 
                            Visible = false
                        }
                    }, 
                    {
                        5, 
                        "ImageLabel", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            Image = "rbxassetid://5642383285", 
                            ImageRectOffset = Vector2.new(144, 16), 
                            ImageRectSize = Vector2.new(16, 16), 
                            Name = "Icon", 
                            Parent = {
                                4
                            }, 
                            Position = UDim2.new(0, 2, 0, 2), 
                            ScaleType = 4, 
                            Size = UDim2.new(0, 16, 0, 16)
                        }
                    }, 
                    {
                        6, 
                        "TextButton", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Font = 4, 
                            Name = "ToggleAttributes", 
                            Parent = {
                                2
                            }, 
                            Position = UDim2.new(1, -85, 0, 0), 
                            Size = UDim2.new(0, 85, 0, 22), 
                            Text = "[SETTING: OFF]", 
                            TextColor3 = Color3.new(1, 1, 1), 
                            TextSize = 14, 
                            TextTransparency = 0.10000000149012, 
                            Visible = false
                        }
                    }, 
                    {
                        7, 
                        "Frame", 
                        {
                            BackgroundColor3 = Color3.new(0.04313725605607, 0.35294118523598, 0.68627452850342), 
                            BackgroundTransparency = 1, 
                            BorderColor3 = Color3.new(0.33725491166115, 0.49019607901573, 0.73725491762161), 
                            BorderSizePixel = 0, 
                            Name = "ValueFrame", 
                            Parent = {
                                1
                            }, 
                            Position = UDim2.new(1, -100, 0, 0), 
                            Size = UDim2.new(0, 80, 1, 0)
                        }
                    }, 
                    {
                        8, 
                        "Frame", 
                        {
                            BackgroundColor3 = Color3.new(0.14117647707462, 0.14117647707462, 0.14117647707462), 
                            BorderColor3 = Color3.new(0.33725491166115, 0.49019610881805, 0.73725491762161), 
                            BorderSizePixel = 0, 
                            Name = "Line", 
                            Parent = {
                                7
                            }, 
                            Position = UDim2.new(0, -1, 0, 0), 
                            Size = UDim2.new(0, 1, 1, 0)
                        }
                    }, 
                    {
                        9, 
                        "TextButton", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Font = 3, 
                            Name = "ColorButton", 
                            Parent = {
                                7
                            }, 
                            Size = UDim2.new(0, 20, 0, 22), 
                            Text = "", 
                            TextColor3 = Color3.new(1, 1, 1), 
                            TextSize = 14, 
                            Visible = false
                        }
                    }, 
                    {
                        10, 
                        "Frame", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BorderColor3 = Color3.new(0, 0, 0), 
                            Name = "ColorPreview", 
                            Parent = {
                                9
                            }, 
                            Position = UDim2.new(0, 5, 0, 6), 
                            Size = UDim2.new(0, 10, 0, 10)
                        }
                    }, 
                    {
                        11, 
                        "UIGradient", 
                        {
                            Parent = {
                                10
                            }
                        }
                    }, 
                    {
                        12, 
                        "Frame", 
                        {
                            BackgroundTransparency = 1, 
                            Name = "EnumArrow", 
                            Parent = {
                                7
                            }, 
                            Position = UDim2.new(1, -16, 0, 3), 
                            Size = UDim2.new(0, 16, 0, 16), 
                            Visible = false
                        }
                    }, 
                    {
                        13, 
                        "Frame", 
                        {
                            BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                            BorderSizePixel = 0, 
                            Parent = {
                                12
                            }, 
                            Position = UDim2.new(0, 8, 0, 9), 
                            Size = UDim2.new(0, 1, 0, 1)
                        }
                    }, 
                    {
                        14, 
                        "Frame", 
                        {
                            BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                            BorderSizePixel = 0, 
                            Parent = {
                                12
                            }, 
                            Position = UDim2.new(0, 7, 0, 8), 
                            Size = UDim2.new(0, 3, 0, 1)
                        }
                    }, 
                    {
                        15, 
                        "Frame", 
                        {
                            BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                            BorderSizePixel = 0, 
                            Parent = {
                                12
                            }, 
                            Position = UDim2.new(0, 6, 0, 7), 
                            Size = UDim2.new(0, 5, 0, 1)
                        }
                    }, 
                    {
                        16, 
                        "TextButton", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            Font = 3, 
                            Name = "ValueBox", 
                            Parent = {
                                7
                            }, 
                            Position = UDim2.new(0, 4, 0, 0), 
                            Size = UDim2.new(1, -8, 1, 0), 
                            Text = "", 
                            TextColor3 = Color3.new(1, 1, 1), 
                            TextSize = 14, 
                            TextTransparency = 0.10000000149012, 
                            TextTruncate = 1, 
                            TextXAlignment = 0
                        }
                    }, 
                    {
                        17, 
                        "TextButton", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Font = 3, 
                            Name = "RightButton", 
                            Parent = {
                                7
                            }, 
                            Position = UDim2.new(1, -20, 0, 0), 
                            Size = UDim2.new(0, 20, 0, 22), 
                            Text = "...", 
                            TextColor3 = Color3.new(1, 1, 1), 
                            TextSize = 14, 
                            Visible = false
                        }
                    }, 
                    {
                        18, 
                        "TextButton", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Font = 3, 
                            Name = "SettingsButton", 
                            Parent = {
                                7
                            }, 
                            Position = UDim2.new(1, -20, 0, 0), 
                            Size = UDim2.new(0, 20, 0, 22), 
                            Text = "", 
                            TextColor3 = Color3.new(1, 1, 1), 
                            TextSize = 14, 
                            Visible = false
                        }
                    }, 
                    {
                        19, 
                        "Frame", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            Name = "SoundPreview", 
                            Parent = {
                                7
                            }, 
                            Size = UDim2.new(1, 0, 1, 0), 
                            Visible = false
                        }
                    }, 
                    {
                        20, 
                        "TextButton", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Font = 3, 
                            Name = "ControlButton", 
                            Parent = {
                                19
                            }, 
                            Size = UDim2.new(0, 20, 0, 22), 
                            Text = "", 
                            TextColor3 = Color3.new(1, 1, 1), 
                            TextSize = 14
                        }
                    }, 
                    {
                        21, 
                        "ImageLabel", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            Image = "rbxassetid://5642383285", 
                            ImageRectOffset = Vector2.new(144, 16), 
                            ImageRectSize = Vector2.new(16, 16), 
                            Name = "Icon", 
                            Parent = {
                                20
                            }, 
                            Position = UDim2.new(0, 2, 0, 3), 
                            ScaleType = 4, 
                            Size = UDim2.new(0, 16, 0, 16)
                        }
                    }, 
                    {
                        22, 
                        "Frame", 
                        {
                            BackgroundColor3 = Color3.new(0.3137255012989, 0.3137255012989, 0.3137255012989), 
                            BorderSizePixel = 0, 
                            Name = "TimeLine", 
                            Parent = {
                                19
                            }, 
                            Position = UDim2.new(0, 26, 0.5, -1), 
                            Size = UDim2.new(1, -34, 0, 2)
                        }
                    }, 
                    {
                        23, 
                        "Frame", 
                        {
                            BackgroundColor3 = Color3.new(0.2352941185236, 0.2352941185236, 0.2352941185236), 
                            BorderColor3 = Color3.new(0.1294117718935, 0.1294117718935, 0.1294117718935), 
                            Name = "Slider", 
                            Parent = {
                                22
                            }, 
                            Position = UDim2.new(0, -4, 0, -8), 
                            Size = UDim2.new(0, 8, 0, 18)
                        }
                    }, 
                    {
                        24, 
                        "TextButton", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Font = 3, 
                            Name = "EditAttributeButton", 
                            Parent = {
                                1
                            }, 
                            Position = UDim2.new(1, -20, 0, 0), 
                            Size = UDim2.new(0, 20, 0, 22), 
                            Text = "", 
                            TextColor3 = Color3.new(1, 1, 1), 
                            TextSize = 14
                        }
                    }, 
                    {
                        25, 
                        "ImageLabel", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            Image = "rbxassetid://5034718180", 
                            ImageTransparency = 0.20000000298023, 
                            Name = "Icon", 
                            Parent = {
                                24
                            }, 
                            Position = UDim2.new(0, 2, 0, 3), 
                            Size = UDim2.new(0, 16, 0, 16)
                        }
                    }, 
                    {
                        26, 
                        "TextButton", 
                        {
                            AutoButtonColor = false, 
                            BackgroundColor3 = Color3.new(0.2352941185236, 0.2352941185236, 0.2352941185236), 
                            BorderSizePixel = 0, 
                            Font = 3, 
                            Name = "RowButton", 
                            Parent = {
                                1
                            }, 
                            Size = UDim2.new(1, 0, 1, 0), 
                            Text = "Add Attribute", 
                            TextColor3 = Color3.new(1, 1, 1), 
                            TextSize = 14, 
                            TextTransparency = 0.10000000149012, 
                            Visible = false
                        }
                    }
                });
                local v1053 = v576.Frame.new();
                local v1054 = v576.Label.new();
                v1054.Parent = v1053.Gui;
                v1054.Position = UDim2.new(0, 2, 0, 0);
                v1054.Size = UDim2.new(1, -4, 1, 0);
                v1053.Visible = false;
                v1053.Parent = v594.Gui;
                v593.FullNameFrame = v1053;
                v593.FullNameFrameAttach = v576.AttachTo(v1053);
            end;
            v593.Init = function() --[[ Line: 4084 ]]
                local v1055 = v588({
                    {
                        1, 
                        "Folder", 
                        {
                            Name = "Items"
                        }
                    }, 
                    {
                        2, 
                        "Frame", 
                        {
                            BackgroundColor3 = Color3.new(0.20392157137394, 0.20392157137394, 0.20392157137394), 
                            BorderSizePixel = 0, 
                            Name = "ToolBar", 
                            Parent = {
                                1
                            }, 
                            Size = UDim2.new(1, 0, 0, 22)
                        }
                    }, 
                    {
                        3, 
                        "Frame", 
                        {
                            BackgroundColor3 = Color3.new(0.14901961386204, 0.14901961386204, 0.14901961386204), 
                            BorderColor3 = Color3.new(0.1176470592618, 0.1176470592618, 0.1176470592618), 
                            BorderSizePixel = 0, 
                            Name = "SearchFrame", 
                            Parent = {
                                2
                            }, 
                            Position = UDim2.new(0, 3, 0, 1), 
                            Size = UDim2.new(1, -6, 0, 18)
                        }
                    }, 
                    {
                        4, 
                        "TextBox", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            ClearTextOnFocus = false, 
                            Font = 3, 
                            Name = "SearchBox", 
                            Parent = {
                                3
                            }, 
                            PlaceholderColor3 = Color3.new(0.39215689897537, 0.39215689897537, 0.39215689897537), 
                            PlaceholderText = "Search properties", 
                            Position = UDim2.new(0, 4, 0, 0), 
                            Size = UDim2.new(1, -24, 0, 18), 
                            Text = "", 
                            TextColor3 = Color3.new(1, 1, 1), 
                            TextSize = 14, 
                            TextXAlignment = 0
                        }
                    }, 
                    {
                        5, 
                        "UICorner", 
                        {
                            CornerRadius = UDim.new(0, 2), 
                            Parent = {
                                3
                            }
                        }
                    }, 
                    {
                        6, 
                        "TextButton", 
                        {
                            AutoButtonColor = false, 
                            BackgroundColor3 = Color3.new(0.12549020349979, 0.12549020349979, 0.12549020349979), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Font = 3, 
                            Name = "Reset", 
                            Parent = {
                                3
                            }, 
                            Position = UDim2.new(1, -17, 0, 1), 
                            Size = UDim2.new(0, 16, 0, 16), 
                            Text = "", 
                            TextColor3 = Color3.new(1, 1, 1), 
                            TextSize = 14
                        }
                    }, 
                    {
                        7, 
                        "ImageLabel", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            Image = "rbxassetid://5034718129", 
                            ImageColor3 = Color3.new(0.39215686917305, 0.39215686917305, 0.39215686917305), 
                            Parent = {
                                6
                            }, 
                            Size = UDim2.new(0, 16, 0, 16)
                        }
                    }, 
                    {
                        8, 
                        "TextButton", 
                        {
                            AutoButtonColor = false, 
                            BackgroundColor3 = Color3.new(0.12549020349979, 0.12549020349979, 0.12549020349979), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Font = 3, 
                            Name = "Refresh", 
                            Parent = {
                                2
                            }, 
                            Position = UDim2.new(1, -20, 0, 1), 
                            Size = UDim2.new(0, 18, 0, 18), 
                            Text = "", 
                            TextColor3 = Color3.new(1, 1, 1), 
                            TextSize = 14, 
                            Visible = false
                        }
                    }, 
                    {
                        9, 
                        "ImageLabel", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            Image = "rbxassetid://5642310344", 
                            Parent = {
                                8
                            }, 
                            Position = UDim2.new(0, 3, 0, 3), 
                            Size = UDim2.new(0, 12, 0, 12)
                        }
                    }, 
                    {
                        10, 
                        "Frame", 
                        {
                            BackgroundColor3 = Color3.new(0.15686275064945, 0.15686275064945, 0.15686275064945), 
                            BorderSizePixel = 0, 
                            Name = "ScrollCorner", 
                            Parent = {
                                1
                            }, 
                            Position = UDim2.new(1, -16, 1, -16), 
                            Size = UDim2.new(0, 16, 0, 16), 
                            Visible = false
                        }
                    }, 
                    {
                        11, 
                        "Frame", 
                        {
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BackgroundTransparency = 1, 
                            ClipsDescendants = true, 
                            Name = "List", 
                            Parent = {
                                1
                            }, 
                            Position = UDim2.new(0, 0, 0, 23), 
                            Size = UDim2.new(1, 0, 1, -23)
                        }
                    }
                });
                v599 = v583.CategoryOrder;
                for v1056, __ in next, v599 do
                    if not v593.CollapsedCategories[v1056] then
                        v602["CAT_" .. v1056] = true;
                    end;
                end;
                v602["Sound.SoundId"] = true;
                v594 = v576.Window.new();
                v593.Window = v594;
                v594:SetTitle("Properties");
                v595 = v1055.ToolBar;
                v596 = v1055.List;
                v593.GuiElems.ToolBar = v595;
                v593.GuiElems.PropsFrame = v596;
                v593.InitEntryStuff();
                v594.GuiElems.Main:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 4122 ]]
                    if v593.Window:IsContentVisible() then
                        v593.UpdateView();
                        v593.Refresh();
                    end;
                end);
                v594.OnActivate:Connect(function() --[[ Line: 4128 ]]
                    v593.UpdateView();
                    v593.Update();
                    v593.Refresh();
                end);
                v594.OnRestore:Connect(function() --[[ Line: 4133 ]]
                    v593.UpdateView();
                    v593.Update();
                    v593.Refresh();
                end);
                v597 = v576.ScrollBar.new();
                v597.WheelIncrement = 3;
                v597.Gui.Position = UDim2.new(1, -16, 0, 23);
                v597:SetScrollFrame(v596);
                v597.Scrolled:Connect(function() --[[ Line: 4144 ]]
                    v593.Index = v597.Index;
                    v593.Refresh();
                end);
                v598 = v576.ScrollBar.new(true);
                v598.Increment = 5;
                v598.WheelIncrement = 20;
                v598.Gui.Position = UDim2.new(0, 0, 1, -16);
                v598.Scrolled:Connect(function() --[[ Line: 4153 ]]
                    v593.Refresh();
                end);
                v594.GuiElems.Line.Position = UDim2.new(0, 0, 0, 22);
                v595.Parent = v594.GuiElems.Content;
                v596.Parent = v594.GuiElems.Content;
                v1055.ScrollCorner.Parent = v594.GuiElems.Content;
                v597.Gui.Parent = v594.GuiElems.Content;
                v598.Gui.Parent = v594.GuiElems.Content;
                v593.InitInputBox();
                v593.InitSearch();
            end;
            return v593;
        end;
        return {
            InitDeps = v591, 
            InitAfterMain = v592, 
            Main = v1058
        };
    end, 
    ScriptViewer = function() --[[ Line: 4173 ]] --[[ Name: ScriptViewer ]]
        local v1059 = nil;
        local v1060 = nil;
        local v1061 = nil;
        local v1062 = nil;
        local v1063 = nil;
        local v1064 = nil;
        local v1065 = nil;
        local v1066 = nil;
        local v1067 = nil;
        local v1068 = nil;
        local v1069 = nil;
        local v1070 = nil;
        local v1071 = nil;
        local v1072 = nil;
        local v1073 = nil;
        local function v1075(v1074) --[[ Line: 4185 ]] --[[ Name: initDeps ]]
            v1059 = v1074.Main;
            v1060 = v1074.Lib;
            v1061 = v1074.Apps;
            v1062 = v1074.Settings;
            v1067 = v1074.API;
            v1068 = v1074.RMD;
            v1069 = v1074.env;
            v1070 = v1074.service;
            v1071 = v1074.plr;
            v1072 = v1074.create;
            v1073 = v1074.createSimple;
        end;
        local function v1076() --[[ Line: 4200 ]] --[[ Name: initAfterMain ]]
            v1063 = v1061.Explorer;
            v1064 = v1061.Properties;
            v1065 = v1061.ScriptViewer;
            v1066 = v1061.Notebook;
        end;
        local function v1125() --[[ Line: 4207 ]] --[[ Name: main ]]
            local v1077 = {};
            local v1078 = nil;
            local v1079 = nil;
            local v1080 = nil;
            v1077.ViewScript = function(v1081) --[[ Line: 4212 ]]
                local l_status_11, l_result_11 = pcall(v1069.decompile or function() --[[ Line: 4213 ]]

                end, v1081);
                if not l_status_11 or not l_result_11 then
                    l_result_11 = "-- DEX - Source failed to decompile";
                    v1080 = nil;
                else
                    v1080 = v1081;
                end;
                v1079:SetText(l_result_11:gsub("\000", "\\0"));
                v1078:Show();
            end;
            v1077.Init = function() --[[ Line: 4219 ]]
                v1078 = v1060.Window.new();
                v1078:SetTitle("Script Viewer");
                v1078:Resize(500, 400);
                v1077.Window = v1078;
                v1079 = v1060.CodeFrame.new();
                v1079.Frame.Position = UDim2.new(0, 0, 0, 20);
                v1079.Frame.Size = UDim2.new(1, 0, 1, -20);
                v1079.Frame.Parent = v1078.GuiElems.Content;
                local v1084 = Instance.new("TextButton", v1078.GuiElems.Content);
                v1084.BackgroundTransparency = 1;
                v1084.Size = UDim2.new(0.5, 0, 0, 20);
                v1084.Text = "Copy to Clipboard";
                v1084.TextColor3 = Color3.new(1, 1, 1);
                v1084.MouseButton1Click:Connect(function() --[[ Line: 4237 ]]
                    local l_v1079_Text_0 = v1079:GetText();
                    v1069.setclipboard(l_v1079_Text_0);
                end);
                local v1086 = Instance.new("TextButton", v1078.GuiElems.Content);
                v1086.BackgroundTransparency = 1;
                v1086.Position = UDim2.new(0.35, 0, 0, 0);
                v1086.Size = UDim2.new(0.3, 0, 0, 20);
                v1086.Text = "Save to File";
                v1086.TextColor3 = Color3.new(1, 1, 1);
                v1086.MouseButton1Click:Connect(function() --[[ Line: 4249 ]]
                    local l_v1079_Text_1 = v1079:GetText();
                    local v1088 = "Place_" .. game.PlaceId .. "_Script_" .. os.time() .. ".txt";
                    v1069.writefile(v1088, l_v1079_Text_1);
                    if v1069.movefileas then
                        v1069.movefileas(v1088, ".txt");
                    end;
                end);
                local v1089 = Instance.new("TextButton", v1078.GuiElems.Content);
                v1089.BackgroundTransparency = 1;
                v1089.Position = UDim2.new(0.7, 0, 0, 0);
                v1089.Size = UDim2.new(0.3, 0, 0, 20);
                v1089.Text = "Dump Functions";
                v1089.TextColor3 = Color3.new(1, 1, 1);
                v1089.MouseButton1Click:Connect(function() --[[ Line: 4266 ]]
                    if v1080 ~= nil then
                        pcall(function() --[[ Line: 4268 ]]
                            local v1090 = getgc or get_gc_objects;
                            local v1091 = debug and debug.getupvalues or getupvalues or getupvals;
                            local v1092 = debug and debug.getconstants or getconstants or getconsts;
                            local v1093 = debug and (debug.getinfo or debug.info) or getinfo;
                            local v1094 = ("\n-- // Function Dumper made by King.Kevin\n-- // Script Path: %s\n\n--[["):format(v1080:GetFullName());
                            local l_v1094_0 = v1094;
                            local v1096 = {};
                            local __ = 0;
                            local v1098 = {};
                            v1096.add_to_dump = function(__, v1100, v1101, v1102) --[[ Line: 4277 ]] --[[ Name: add_to_dump ]]
                                local v1103 = v1102 or true;
                                l_v1094_0 = l_v1094_0 .. ("%s%s%s"):format(string.rep("    ", v1101), tostring(v1100), v1103 and "\n" or "");
                            end;
                            v1096.get_function_name = function(__, v1105) --[[ Line: 4281 ]] --[[ Name: get_function_name ]]
                                local l_name_0 = v1093(v1105).name;
                                return l_name_0 ~= "" and l_name_0 or "Unknown Name";
                            end;
                            v1096.dump_table = function(__, v1108, v1109, v1110) --[[ Line: 4285 ]] --[[ Name: dump_table ]]
                                local v1111 = v1109 < 0 and 0 or v1109;
                                v1096:add_to_dump(("%s [%s] %s"):format(tostring(v1110), tostring((typeof(v1108))), (tostring(v1108))), v1111 - 1);
                                local v1112 = 0;
                                for v1113, v1114 in pairs(v1108) do
                                    v1112 = v1112 + 1;
                                    if type(v1114) == "function" then
                                        v1096:add_to_dump(("%d [function] = %s"):format(v1112, v1096:get_function_name(v1114)), v1111);
                                    elseif type(v1114) == "table" then
                                        if not v1098[v1114] then
                                            v1098[v1114] = true;
                                            v1096:add_to_dump(("%d [table]:"):format(v1112), v1111);
                                            v1096:dump_table(v1114, v1111 + 1, v1113);
                                        else
                                            v1096:add_to_dump(("%d [table] (Recursive table detected)"):format(v1112), v1111);
                                        end;
                                    else
                                        v1096:add_to_dump(("%d [%s] = %s"):format(v1112, tostring((typeof(v1114))), (tostring(v1114))), v1111);
                                    end;
                                end;
                            end;
                            v1096.dump_function = function(__, v1116, v1117) --[[ Line: 4306 ]] --[[ Name: dump_function ]]
                                v1096:add_to_dump(("\nFunction Dump: %s"):format(v1096:get_function_name(v1116)), v1117);
                                v1096:add_to_dump(("\nFunction Upvalues: %s"):format(v1096:get_function_name(v1116)), v1117);
                                for v1118, v1119 in pairs(v1091(v1116)) do
                                    if type(v1119) == "function" then
                                        v1096:add_to_dump(("%d [function] = %s"):format(v1118, v1096:get_function_name(v1119)), v1117 + 1);
                                    elseif type(v1119) == "table" then
                                        if not v1098[v1119] then
                                            v1098[v1119] = true;
                                            v1096:add_to_dump(("%d [table]:"):format(v1118), v1117 + 1);
                                            v1096:dump_table(v1119, v1117 + 2, v1118);
                                        else
                                            v1096:add_to_dump(("%d [table] (Recursive table detected)"):format(v1118), v1117 + 1);
                                        end;
                                    else
                                        v1096:add_to_dump(("%d [%s] = %s"):format(v1118, tostring((typeof(v1119))), (tostring(v1119))), v1117 + 1);
                                    end;
                                end;
                                v1096:add_to_dump(("\nFunction Constants: %s"):format(v1096:get_function_name(v1116)), v1117);
                                for v1120, v1121 in pairs(v1092(v1116)) do
                                    if type(v1121) == "function" then
                                        v1096:add_to_dump(("%d [function] = %s"):format(v1120, v1096:get_function_name(v1121)), v1117 + 1);
                                    elseif type(v1121) == "table" then
                                        if not v1098[v1121] then
                                            v1098[v1121] = true;
                                            v1096:add_to_dump(("%d [table]:"):format(v1120), v1117 + 1);
                                            v1096:dump_table(v1121, v1117 + 2, v1120);
                                        else
                                            v1096:add_to_dump(("%d [table] (Recursive table detected)"):format(v1120), v1117 + 1);
                                        end;
                                    else
                                        v1096:add_to_dump(("%d [%s] = %s"):format(v1120, tostring((typeof(v1121))), (tostring(v1121))), v1117 + 1);
                                    end;
                                end;
                            end;
                            for __, v1123 in pairs(v1090()) do
                                if typeof(v1123) == "function" and getfenv(v1123).script and getfenv(v1123).script == v1080 then
                                    v1096:dump_function(v1123, 0);
                                    v1096:add_to_dump("\n" .. ("="):rep(100), 0, false);
                                end;
                            end;
                            local l_v1079_Text_2 = v1079:GetText();
                            if l_v1094_0 ~= v1094 then
                                l_v1079_Text_2 = l_v1079_Text_2 .. l_v1094_0 .. "]]";
                            end;
                            v1079:SetText(l_v1079_Text_2);
                        end);
                    end;
                end);
            end;
            return v1077;
        end;
        return {
            InitDeps = v1075, 
            InitAfterMain = v1076, 
            Main = v1125
        };
    end, 
    Lib = function() --[[ Line: 4360 ]] --[[ Name: Lib ]]
        local v1126 = nil;
        local v1127 = nil;
        local v1128 = nil;
        local v1129 = nil;
        local v1130 = nil;
        local v1131 = nil;
        local v1132 = nil;
        local v1133 = nil;
        local v1134 = nil;
        local v1135 = nil;
        local v1136 = nil;
        local v1137 = nil;
        local v1138 = nil;
        local v1139 = nil;
        local v1140 = nil;
        local function v1142(v1141) --[[ Line: 4372 ]] --[[ Name: initDeps ]]
            v1126 = v1141.Main;
            v1127 = v1141.Lib;
            v1128 = v1141.Apps;
            v1129 = v1141.Settings;
            v1134 = v1141.API;
            v1135 = v1141.RMD;
            v1136 = v1141.env;
            v1137 = v1141.service;
            v1138 = v1141.plr;
            v1139 = v1141.create;
            v1140 = v1141.createSimple;
        end;
        local function v1143() --[[ Line: 4387 ]] --[[ Name: initAfterMain ]]
            v1130 = v1128.Explorer;
            v1131 = v1128.Properties;
            v1132 = v1128.ScriptViewer;
            v1133 = v1128.Notebook;
        end;
        local function v2740() --[[ Line: 4394 ]] --[[ Name: main ]]
            local v1144 = {};
            local l_RenderStepped_0 = v1137.RunService.RenderStepped;
            local l_wait_0 = l_RenderStepped_0.wait;
            local v1147 = newproxy();
            local v1148 = newproxy();
            local function v1157(v1149, v1150) --[[ Line: 4403 ]] --[[ Name: initObj ]]
                local l_type_0 = type;
                local function v1152(v1153) --[[ Line: 4405 ]] --[[ Name: copy ]]
                    local v1154 = {};
                    for v1155, v1156 in pairs(v1153) do
                        if v1156 == v1148 then
                            v1154[v1155] = v1144.Signal.new();
                        elseif l_type_0(v1156) == "table" then
                            v1154[v1155] = v1152(v1156);
                        else
                            v1154[v1155] = v1156;
                        end;
                    end;
                    return v1154;
                end;
                return (setmetatable(v1152(v1149), v1150));
            end;
            local function v1165(v1158, v1159) --[[ Line: 4423 ]] --[[ Name: getGuiMT ]]
                return {
                    __index = function(v1160, v1161) --[[ Line: 4424 ]] --[[ Name: __index ]]
                        if not v1158[v1161] then
                            return v1159[v1161] or v1160.Gui[v1161];
                        else
                            return;
                        end;
                    end, 
                    __newindex = function(v1162, v1163, v1164) --[[ Line: 4425 ]] --[[ Name: __newindex ]]
                        if not v1158[v1163] then
                            v1162.Gui[v1163] = v1164;
                            return;
                        else
                            rawset(v1162, v1163, v1164);
                            return;
                        end;
                    end
                };
            end;
            v1144.FormatLuaString = (function() --[[ Line: 4430 ]]
                local l_string_1 = string;
                local l_gsub_1 = l_string_1.gsub;
                local l_format_0 = l_string_1.format;
                local l_char_0 = l_string_1.char;
                local v1170 = {
                    ["\""] = "\\\"", 
                    ["\\"] = "\\\\"
                };
                for v1171 = 0, 31 do
                    v1170[l_char_0(v1171)] = "\\" .. l_format_0("%03d", v1171);
                end;
                for v1172 = 127, 255 do
                    v1170[l_char_0(v1172)] = "\\" .. l_format_0("%03d", v1172);
                end;
                return function(v1173) --[[ Line: 4443 ]]
                    return l_gsub_1(v1173, "[\"\\\000-\031\127-\255]", v1170);
                end;
            end)();
            v1144.CheckMouseInGui = function(v1174) --[[ Line: 4448 ]]
                if v1174 == nil then
                    return false;
                else
                    local l_Mouse_1 = v1126.Mouse;
                    local l_AbsolutePosition_0 = v1174.AbsolutePosition;
                    local l_AbsoluteSize_1 = v1174.AbsoluteSize;
                    local v1178 = false;
                    if l_Mouse_1.X >= l_AbsolutePosition_0.X then
                        v1178 = false;
                        if l_Mouse_1.X < l_AbsolutePosition_0.X + l_AbsoluteSize_1.X then
                            v1178 = false;
                            if l_Mouse_1.Y >= l_AbsolutePosition_0.Y then
                                v1178 = l_Mouse_1.Y < l_AbsolutePosition_0.Y + l_AbsoluteSize_1.Y;
                            end;
                        end;
                    end;
                    return v1178;
                end;
            end;
            v1144.IsShiftDown = function() --[[ Line: 4457 ]]
                return v1137.UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or v1137.UserInputService:IsKeyDown(Enum.KeyCode.RightShift);
            end;
            v1144.IsCtrlDown = function() --[[ Line: 4461 ]]
                return v1137.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or v1137.UserInputService:IsKeyDown(Enum.KeyCode.RightControl);
            end;
            v1144.CreateArrow = function(v1179, v1180, v1181) --[[ Line: 4465 ]]
                local v1182 = v1140("Frame", {
                    BackgroundTransparency = 1, 
                    Name = "Arrow", 
                    Size = UDim2.new(0, v1179, 0, v1179)
                });
                if v1181 == "up" then
                    for v1183 = 1, v1180 do
                        local __ = v1140("Frame", {
                            BackgroundColor3 = Color3.new(0.8627450980392157, 0.8627450980392157, 0.8627450980392157), 
                            BorderSizePixel = 0, 
                            Position = UDim2.new(0, math.floor(v1179 / 2) - (v1183 - 1), 0, math.floor(v1179 / 2) + v1183 - math.floor(v1180 / 2) - 1), 
                            Size = UDim2.new(0, v1183 + (v1183 - 1), 0, 1), 
                            Parent = v1182
                        });
                    end;
                    return v1182;
                elseif v1181 == "down" then
                    for v1185 = 1, v1180 do
                        local __ = v1140("Frame", {
                            BackgroundColor3 = Color3.new(0.8627450980392157, 0.8627450980392157, 0.8627450980392157), 
                            BorderSizePixel = 0, 
                            Position = UDim2.new(0, math.floor(v1179 / 2) - (v1185 - 1), 0, math.floor(v1179 / 2) - v1185 + math.floor(v1180 / 2) + 1), 
                            Size = UDim2.new(0, v1185 + (v1185 - 1), 0, 1), 
                            Parent = v1182
                        });
                    end;
                    return v1182;
                elseif v1181 == "left" then
                    for v1187 = 1, v1180 do
                        local __ = v1140("Frame", {
                            BackgroundColor3 = Color3.new(0.8627450980392157, 0.8627450980392157, 0.8627450980392157), 
                            BorderSizePixel = 0, 
                            Position = UDim2.new(0, math.floor(v1179 / 2) + v1187 - math.floor(v1180 / 2) - 1, 0, math.floor(v1179 / 2) - (v1187 - 1)), 
                            Size = UDim2.new(0, 1, 0, v1187 + (v1187 - 1)), 
                            Parent = v1182
                        });
                    end;
                    return v1182;
                elseif v1181 == "right" then
                    for v1189 = 1, v1180 do
                        local __ = v1140("Frame", {
                            BackgroundColor3 = Color3.new(0.8627450980392157, 0.8627450980392157, 0.8627450980392157), 
                            BorderSizePixel = 0, 
                            Position = UDim2.new(0, math.floor(v1179 / 2) - v1189 + math.floor(v1180 / 2) + 1, 0, math.floor(v1179 / 2) - (v1189 - 1)), 
                            Size = UDim2.new(0, 1, 0, v1189 + (v1189 - 1)), 
                            Parent = v1182
                        });
                    end;
                    return v1182;
                else
                    error("r u ok");
                    return;
                end;
            end;
            v1144.ParseXML = (function() --[[ Line: 4520 ]]
                local function v1234() --[[ Line: 4521 ]]
                    local l_string_2 = string;
                    local __ = print;
                    local l_pairs_0 = pairs;
                    local function __(v1194) --[[ Line: 4528 ]]
                        local v1195 = v1194:match("^%s*()");
                        if #v1194 < v1195 then
                            return "";
                        else
                            return (v1194:match(".*%S", v1195));
                        end;
                    end;
                    local __ = l_string_2.byte(">", 1);
                    local v1198 = l_string_2.byte("/", 1);
                    local __ = l_string_2.byte("D", 1);
                    local v1200 = l_string_2.byte("E", 1);
                    parse = function(v1201, v1202) --[[ Line: 4538 ]] --[[ Name: parse ]]
                        v1201 = v1201:gsub("<!%-%-(.-)%-%->", "");
                        local v1203 = {};
                        local v1204 = nil;
                        if v1202 then
                            local v1205 = v1201:find("<[_%w]");
                            if v1205 then
                                v1201:sub(1, v1205):gsub("<!ENTITY%s+([_%w]+)%s+(.)(.-)%2", function(v1206, __, v1208) --[[ Line: 4547 ]]
                                    v1203[#v1203 + 1] = {
                                        name = v1206, 
                                        value = v1208
                                    };
                                end);
                                v1204 = createEntityTable(v1203);
                                v1201 = replaceEntities(v1201:sub(v1205), v1204);
                            end;
                        end;
                        local v1209 = {};
                        local v1210 = {};
                        local function v1212(v1211) --[[ Line: 4557 ]]
                            v1211 = v1211:match("^%s*(.*%S)") or "";
                            if #v1211 ~= 0 then
                                v1209[#v1209 + 1] = {
                                    text = v1211
                                };
                            end;
                        end;
                        v1201:gsub("<([?!/]?)([-:_%w]+)%s*(/?>?)([^<]*)", function(v1213, v1214, v1215, v1216) --[[ Line: 4564 ]]
                            if #v1213 == 0 then
                                local v1217 = {};
                                if #v1215 == 0 then
                                    local v1218 = 0;
                                    for v1219, v1220, __, v1222, v1223 in l_string_2.gmatch(v1216, "(.-([-_%w]+)%s*=%s*(.)(.-)%3%s*(/?>?))") do
                                        v1218 = v1218 + #v1219;
                                        v1217[v1220] = v1222;
                                        if #v1223 ~= 0 then
                                            v1216 = v1216:sub(v1218 + 1);
                                            v1215 = v1223;
                                            break;
                                        end;
                                    end;
                                end;
                                v1209[#v1209 + 1] = {
                                    tag = v1214, 
                                    attrs = v1217, 
                                    children = {}
                                };
                                if v1215:byte(1) ~= v1198 then
                                    v1210[#v1210 + 1] = v1209;
                                    v1209 = v1209[#v1209].children;
                                end;
                                v1212(v1216);
                                return;
                            elseif v1213 == "/" then
                                v1209 = v1210[#v1210];
                                v1210[#v1210] = nil;
                                v1212(v1216);
                                return;
                            else
                                if v1213 == "!" and v1200 == v1214:byte(1) then
                                    v1216:gsub("([_%w]+)%s+(.)(.-)%2", function(v1224, __, v1226) --[[ Line: 4597 ]]
                                        v1203[#v1203 + 1] = {
                                            name = v1224, 
                                            value = v1226
                                        };
                                    end, 1);
                                end;
                                return;
                            end;
                        end);
                        return {
                            children = v1209, 
                            entities = v1203, 
                            tentities = v1204
                        };
                    end;
                    parseText = function(v1227) --[[ Line: 4613 ]] --[[ Name: parseText ]]
                        return parse(v1227);
                    end;
                    defaultEntityTable = function() --[[ Line: 4617 ]] --[[ Name: defaultEntityTable ]]
                        return {
                            quot = "\"", 
                            apos = "'", 
                            lt = "<", 
                            gt = ">", 
                            amp = "&", 
                            tab = "\t", 
                            nbsp = " "
                        };
                    end;
                    replaceEntities = function(v1228, v1229) --[[ Line: 4621 ]] --[[ Name: replaceEntities ]]
                        return v1228:gsub("&([^;]+);", v1229);
                    end;
                    createEntityTable = function(v1230, v1231) --[[ Line: 4625 ]] --[[ Name: createEntityTable ]]
                        entities = v1231 or defaultEntityTable();
                        for __, v1233 in l_pairs_0(v1230) do
                            v1233.value = replaceEntities(v1233.value, entities);
                            entities[v1233.name] = v1233.value;
                        end;
                        return entities;
                    end;
                    return parseText;
                end;
                local v1235 = setmetatable({}, {
                    __index = getfenv()
                });
                setfenv(v1234, v1235);
                return v1234();
            end)();
            v1144.FastWait = function(v1236) --[[ Line: 4641 ]]
                if not v1236 then
                    return l_wait_0(l_RenderStepped_0);
                else
                    local v1237 = tick();
                    while tick() - v1237 < v1236 do
                        l_wait_0(l_RenderStepped_0);
                    end;
                    return;
                end;
            end;
            v1144.ButtonAnim = function(v1238, v1239) --[[ Line: 4647 ]]
                local v1240 = false;
                local v1241 = false;
                local v1242 = v1239 and v1239.Mode or 1;
                local v1243 = {};
                if v1242 == 2 then
                    local v1244 = v1239.LerpTo or Color3.new(0, 0, 0);
                    local v1245 = v1239.LerpDelta or 0.2;
                    v1243.StartColor = v1239.StartColor or v1238.BackgroundColor3;
                    v1243.PressColor = v1239.PressColor or v1243.StartColor:lerp(v1244, v1245);
                    v1243.HoverColor = v1239.HoverColor or v1243.StartColor:lerp(v1243.PressColor, 0.6);
                    v1243.OutlineColor = v1239.OutlineColor;
                end;
                v1238.InputBegan:Connect(function(v1246) --[[ Line: 4662 ]]
                    if v1241 then
                        return;
                    else
                        if v1246.UserInputType == Enum.UserInputType.MouseMovement and not v1240 then
                            if v1242 == 1 then
                                v1238.BackgroundTransparency = 0.4;
                                return;
                            elseif v1242 == 2 then
                                v1238.BackgroundColor3 = v1243.HoverColor;
                                return;
                            end;
                        elseif v1246.UserInputType == Enum.UserInputType.MouseButton1 then
                            v1240 = true;
                            if v1242 == 1 then
                                v1238.BackgroundTransparency = 0;
                                return;
                            elseif v1242 == 2 then
                                v1238.BackgroundColor3 = v1243.PressColor;
                                if v1243.OutlineColor then
                                    v1238.BorderColor3 = v1243.PressColor;
                                end;
                            end;
                        end;
                        return;
                    end;
                end);
                v1238.InputEnded:Connect(function(v1247) --[[ Line: 4681 ]]
                    if v1241 then
                        return;
                    else
                        if v1247.UserInputType == Enum.UserInputType.MouseMovement and not v1240 then
                            if v1242 == 1 then
                                v1238.BackgroundTransparency = 1;
                                return;
                            elseif v1242 == 2 then
                                v1238.BackgroundColor3 = v1243.StartColor;
                                return;
                            end;
                        elseif v1247.UserInputType == Enum.UserInputType.MouseButton1 then
                            v1240 = false;
                            if v1242 == 1 then
                                v1238.BackgroundTransparency = v1144.CheckMouseInGui(v1238) and 0.4 or 1;
                                return;
                            elseif v1242 == 2 then
                                v1238.BackgroundColor3 = v1144.CheckMouseInGui(v1238) and v1243.HoverColor or v1243.StartColor;
                                if v1243.OutlineColor then
                                    v1238.BorderColor3 = v1243.OutlineColor;
                                end;
                            end;
                        end;
                        return;
                    end;
                end);
                v1243.Disable = function() --[[ Line: 4700 ]]
                    v1241 = true;
                    v1240 = false;
                    if v1242 == 1 then
                        v1238.BackgroundTransparency = 1;
                        return;
                    else
                        if v1242 == 2 then
                            v1238.BackgroundColor3 = v1243.StartColor;
                        end;
                        return;
                    end;
                end;
                v1243.Enable = function() --[[ Line: 4711 ]]
                    v1241 = false;
                end;
                return v1243;
            end;
            v1144.FindAndRemove = function(v1248, v1249) --[[ Line: 4718 ]]
                local v1250 = table.find(v1248, v1249);
                if v1250 then
                    table.remove(v1248, v1250);
                end;
            end;
            v1144.AttachTo = function(v1251, v1252) --[[ Line: 4723 ]]
                local v1253 = nil;
                local v1254 = nil;
                local v1255 = nil;
                local v1256 = nil;
                local v1257 = nil;
                local v1258 = nil;
                local v1259 = nil;
                local v1260 = false;
                local function v1263() --[[ Line: 4727 ]] --[[ Name: update ]]
                    if not v1251 or not v1253 then
                        return;
                    else
                        local l_AbsolutePosition_1 = v1253.AbsolutePosition;
                        local l_AbsoluteSize_2 = v1253.AbsoluteSize;
                        v1251.Position = UDim2.new(0, l_AbsolutePosition_1.X + v1254, 0, l_AbsolutePosition_1.Y + v1255);
                        if v1258 then
                            v1251.Size = UDim2.new(0, l_AbsoluteSize_2.X + v1256, 0, l_AbsoluteSize_2.Y + v1257);
                        end;
                        return;
                    end;
                end;
                local function v1267(v1264, v1265) --[[ Line: 4736 ]] --[[ Name: setup ]]
                    v1251 = v1264;
                    v1265 = v1265 or {};
                    v1253 = v1265.Target;
                    v1254 = v1265.PosOffX or 0;
                    v1255 = v1265.PosOffY or 0;
                    v1256 = v1265.SizeOffX or 0;
                    v1257 = v1265.SizeOffY or 0;
                    v1258 = v1265.Resize or false;
                    if v1259 then
                        v1259:Disconnect();
                        v1259 = nil;
                    end;
                    if v1253 then
                        v1259 = v1253.Changed:Connect(function(v1266) --[[ Line: 4748 ]]
                            if not v1260 and v1266 == "AbsolutePosition" or v1266 == "AbsoluteSize" then
                                v1263();
                            end;
                        end);
                    end;
                    v1263();
                end;
                v1267(v1251, v1252);
                return {
                    SetData = function(v1268, v1269) --[[ Line: 4760 ]] --[[ Name: SetData ]]
                        v1267(v1268, v1269);
                    end, 
                    Enable = function() --[[ Line: 4763 ]] --[[ Name: Enable ]]
                        v1260 = false;
                        v1263();
                    end, 
                    Disable = function() --[[ Line: 4767 ]] --[[ Name: Disable ]]
                        v1260 = true;
                    end, 
                    Destroy = function() --[[ Line: 4770 ]] --[[ Name: Destroy ]]
                        v1259:Disconnect();
                        v1259 = nil;
                    end
                };
            end;
            v1144.ProtectedGuis = {};
            v1144.ShowGui = function(v1270) --[[ Line: 4779 ]]
                if v1136.gethui then
                    v1270.Parent = v1136.gethui();
                    return;
                elseif v1136.protectgui then
                    v1136.protectgui(v1270);
                    v1270.Parent = v1126.GuiHolder;
                    return;
                else
                    v1270.Parent = v1126.GuiHolder;
                    return;
                end;
            end;
            v1144.ColorToBytes = function(v1271) --[[ Line: 4790 ]]
                local l_round_0 = math.round;
                return string.format("%d, %d, %d", l_round_0(v1271.r * 255), l_round_0(v1271.g * 255), (l_round_0(v1271.b * 255)));
            end;
            v1144.ReadFile = function(v1273) --[[ Line: 4795 ]]
                if not v1136.readfile then
                    return;
                else
                    local l_status_12, l_result_12 = pcall(v1136.readfile, v1273);
                    if l_status_12 and l_result_12 then
                        return l_result_12;
                    else
                        return;
                    end;
                end;
            end;
            v1144.DeferFunc = function(v1276, ...) --[[ Line: 4802 ]]
                l_wait_0(l_RenderStepped_0);
                return v1276(...);
            end;
            v1144.LoadCustomAsset = function(v1277) --[[ Line: 4807 ]]
                if not v1136.getcustomasset or not v1136.isfile or not v1136.isfile(v1277) then
                    return;
                else
                    return v1136.getcustomasset(v1277);
                end;
            end;
            v1144.FetchCustomAsset = function(v1278, v1279) --[[ Line: 4813 ]]
                if not v1136.writefile then
                    return;
                else
                    local l_status_13, l_result_13 = pcall(game.HttpGet, game, v1278);
                    if not l_status_13 then
                        return;
                    else
                        v1136.writefile(v1279, l_result_13);
                        return v1144.LoadCustomAsset(v1279);
                    end;
                end;
            end;
            v1144.Signal = (function() --[[ Line: 4825 ]]
                local v1282 = {};
                local function v1285(v1283) --[[ Line: 4828 ]]
                    local v1284 = table.find(v1283.Signal.Connections, v1283);
                    if v1284 then
                        table.remove(v1283.Signal.Connections, v1284);
                    end;
                end;
                v1282.Connect = function(v1286, v1287) --[[ Line: 4833 ]]
                    if type(v1287) ~= "function" then
                        error("Attempt to connect a non-function");
                    end;
                    local v1288 = {
                        Signal = v1286, 
                        Func = v1287, 
                        Disconnect = v1285
                    };
                    v1286.Connections[#v1286.Connections + 1] = v1288;
                    return v1288;
                end;
                v1282.Fire = function(v1289, ...) --[[ Line: 4844 ]]
                    for __, v1291 in next, v1289.Connections do
                        xpcall(coroutine.wrap(v1291.Func), function(v1292) --[[ Line: 4846 ]]
                            warn(v1292 .. "\n" .. debug.traceback());
                        end, ...);
                    end;
                end;
                local v1294 = {
                    __index = v1282, 
                    __tostring = function(v1293) --[[ Line: 4852 ]] --[[ Name: __tostring ]]
                        return "Signal: " .. tostring(#v1293.Connections) .. " Connections";
                    end
                };
                return {
                    new = function() --[[ Line: 4857 ]] --[[ Name: new ]]
                        return (setmetatable({
                            Connections = {}
                        }, v1294));
                    end
                };
            end)();
            v1144.Set = (function() --[[ Line: 4867 ]]
                local v1326 = {
                    __index = {
                        Add = function(v1295, v1296) --[[ Line: 4870 ]]
                            if v1295.Map[v1296] then
                                return;
                            else
                                local l_List_23 = v1295.List;
                                l_List_23[#l_List_23 + 1] = v1296;
                                v1295.Map[v1296] = true;
                                v1295.Changed:Fire();
                                return;
                            end;
                        end, 
                        AddTable = function(v1298, v1299) --[[ Line: 4879 ]]
                            local v1300 = nil;
                            local l_List_24 = v1298.List;
                            local l_Map_1 = v1298.Map;
                            for v1303 = 1, #v1299 do
                                local v1304 = v1299[v1303];
                                if not l_Map_1[v1304] then
                                    l_List_24[#l_List_24 + 1] = v1304;
                                    l_Map_1[v1304] = true;
                                    v1300 = true;
                                end;
                            end;
                            if v1300 then
                                v1298.Changed:Fire();
                            end;
                        end, 
                        Remove = function(v1305, v1306) --[[ Line: 4893 ]]
                            if not v1305.Map[v1306] then
                                return;
                            else
                                local l_List_25 = v1305.List;
                                local v1308 = table.find(l_List_25, v1306);
                                if v1308 then
                                    table.remove(l_List_25, v1308);
                                end;
                                v1305.Map[v1306] = nil;
                                v1305.Changed:Fire();
                                return;
                            end;
                        end, 
                        RemoveTable = function(v1309, v1310) --[[ Line: 4903 ]]
                            local v1311 = nil;
                            local l_List_26 = v1309.List;
                            local l_Map_2 = v1309.Map;
                            local v1314 = {};
                            for v1315 = 1, #v1310 do
                                local v1316 = v1310[v1315];
                                l_Map_2[v1316] = nil;
                                v1314[v1316] = true;
                            end;
                            for v1317 = #l_List_26, 1, -1 do
                                if v1314[l_List_26[v1317]] then
                                    table.remove(l_List_26, v1317);
                                    v1311 = true;
                                end;
                            end;
                            if v1311 then
                                v1309.Changed:Fire();
                            end;
                        end, 
                        Set = function(v1318, v1319) --[[ Line: 4923 ]]
                            if #v1318.List == 1 and v1318.List[1] == v1319 then
                                return;
                            else
                                v1318.List = {
                                    v1319
                                };
                                v1318.Map = {
                                    [v1319] = true
                                };
                                v1318.Changed:Fire();
                                return;
                            end;
                        end, 
                        SetTable = function(v1320, v1321) --[[ Line: 4931 ]]
                            local v1322 = {};
                            local v1323 = {};
                            v1320.List = v1322;
                            v1320.Map = v1323;
                            table.move(v1321, 1, #v1321, 1, v1322);
                            for v1324 = 1, #v1321 do
                                v1323[v1321[v1324]] = true;
                            end;
                            v1320.Changed:Fire();
                        end, 
                        Clear = function(v1325) --[[ Line: 4941 ]]
                            if #v1325.List == 0 then
                                return;
                            else
                                v1325.List = {};
                                v1325.Map = {};
                                v1325.Changed:Fire();
                                return;
                            end;
                        end
                    }
                };
                return {
                    new = function() --[[ Line: 4950 ]] --[[ Name: new ]]
                        return (setmetatable({
                            List = {}, 
                            Map = {}, 
                            Changed = v1144.Signal.new()
                        }, v1326));
                    end
                };
            end)();
            v1144.IconMap = (function() --[[ Line: 4963 ]]
                local v1339 = {
                    __index = {
                        GetLabel = function(v1327) --[[ Line: 4966 ]]
                            local l_ImageLabel_0 = Instance.new("ImageLabel");
                            v1327:SetupLabel(l_ImageLabel_0);
                            return l_ImageLabel_0;
                        end, 
                        SetupLabel = function(v1329, v1330) --[[ Line: 4972 ]]
                            v1330.BackgroundTransparency = 1;
                            v1330.ImageRectOffset = Vector2.new(0, 0);
                            v1330.ImageRectSize = Vector2.new(v1329.IconSizeX, v1329.IconSizeY);
                            v1330.ScaleType = Enum.ScaleType.Crop;
                            v1330.Size = UDim2.new(0, v1329.IconSizeX, 0, v1329.IconSizeY);
                        end, 
                        Display = function(v1331, v1332, v1333) --[[ Line: 4980 ]]
                            v1332.Image = v1331.MapId;
                            if not v1331.NumX then
                                v1332.ImageRectOffset = Vector2.new(v1331.IconSizeX * v1333, 0);
                                return;
                            else
                                v1332.ImageRectOffset = Vector2.new(v1331.IconSizeX * (v1333 % v1331.NumX), v1331.IconSizeY * math.floor(v1333 / v1331.NumX));
                                return;
                            end;
                        end, 
                        DisplayByKey = function(v1334, v1335, v1336) --[[ Line: 4989 ]]
                            if v1334.IndexDict[v1336] then
                                v1334:Display(v1335, v1334.IndexDict[v1336]);
                            end;
                        end, 
                        SetDict = function(v1337, v1338) --[[ Line: 4995 ]]
                            v1337.IndexDict = v1338;
                        end
                    }
                };
                return {
                    new = function(v1340, v1341, v1342, v1343, v1344) --[[ Line: 5002 ]] --[[ Name: new ]]
                        return (setmetatable({
                            MapId = v1340, 
                            MapSizeX = v1341, 
                            MapSizeY = v1342, 
                            IconSizeX = v1343, 
                            IconSizeY = v1344, 
                            NumX = v1341 / v1343, 
                            IndexDict = {}
                        }, v1339));
                    end, 
                    newLinear = function(v1345, v1346, v1347) --[[ Line: 5015 ]] --[[ Name: newLinear ]]
                        return (setmetatable({
                            MapId = v1345, 
                            IconSizeX = v1346, 
                            IconSizeY = v1347, 
                            IndexDict = {}
                        }, v1339));
                    end
                };
            end)();
            v1144.ScrollBar = (function() --[[ Line: 5028 ]]
                local v1348 = {};
                local l_UserInputService_1 = v1137.UserInputService;
                local l_v1138_Mouse_0 = v1138:GetMouse();
                local l_CheckMouseInGui_0 = v1144.CheckMouseInGui;
                local l_CreateArrow_0 = v1144.CreateArrow;
                local function v1363(v1353) --[[ Line: 5035 ]] --[[ Name: drawThumb ]]
                    local l_TotalSpace_0 = v1353.TotalSpace;
                    local l_VisibleSpace_1 = v1353.VisibleSpace;
                    local __ = v1353.Index;
                    local l_ScrollThumb_0 = v1353.GuiElems.ScrollThumb;
                    local l_ScrollThumbFrame_0 = v1353.GuiElems.ScrollThumbFrame;
                    if not v1353:CanScrollUp() and not v1353:CanScrollDown() then
                        l_ScrollThumb_0.Visible = false;
                    else
                        l_ScrollThumb_0.Visible = true;
                    end;
                    if v1353.Horizontal then
                        l_ScrollThumb_0.Size = UDim2.new(l_VisibleSpace_1 / l_TotalSpace_0, 0, 1, 0);
                        if l_ScrollThumb_0.AbsoluteSize.X < 16 then
                            l_ScrollThumb_0.Size = UDim2.new(0, 16, 1, 0);
                        end;
                        local l_X_9 = l_ScrollThumbFrame_0.AbsoluteSize.X;
                        local l_X_10 = l_ScrollThumb_0.AbsoluteSize.X;
                        l_ScrollThumb_0.Position = UDim2.new(v1353:GetScrollPercent() * (l_X_9 - l_X_10) / l_X_9, 0, 0, 0);
                        return;
                    else
                        l_ScrollThumb_0.Size = UDim2.new(1, 0, l_VisibleSpace_1 / l_TotalSpace_0, 0);
                        if l_ScrollThumb_0.AbsoluteSize.Y < 16 then
                            l_ScrollThumb_0.Size = UDim2.new(1, 0, 0, 16);
                        end;
                        local l_Y_3 = l_ScrollThumbFrame_0.AbsoluteSize.Y;
                        local l_Y_4 = l_ScrollThumb_0.AbsoluteSize.Y;
                        l_ScrollThumb_0.Position = UDim2.new(0, 0, v1353:GetScrollPercent() * (l_Y_3 - l_Y_4) / l_Y_3, 0);
                        return;
                    end;
                end;
                local function v1404(v1364) --[[ Line: 5067 ]] --[[ Name: createFrame ]]
                    local v1365 = v1140("Frame", {
                        Style = 0, 
                        Active = true, 
                        AnchorPoint = Vector2.new(0, 0), 
                        BackgroundColor3 = Color3.new(0.35294118523598, 0.35294118523598, 0.35294118523598), 
                        BackgroundTransparency = 0, 
                        BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881), 
                        BorderSizePixel = 0, 
                        ClipsDescendants = false, 
                        Draggable = false, 
                        Position = UDim2.new(1, -16, 0, 0), 
                        Rotation = 0, 
                        Selectable = false, 
                        Size = UDim2.new(0, 16, 1, 0), 
                        SizeConstraint = 0, 
                        Visible = true, 
                        ZIndex = 1, 
                        Name = "ScrollBar"
                    });
                    local v1366 = nil;
                    local v1367 = nil;
                    if v1364.Horizontal then
                        v1365.Size = UDim2.new(1, 0, 0, 16);
                        v1366 = v1140("ImageButton", {
                            Parent = v1365, 
                            Name = "Left", 
                            Size = UDim2.new(0, 16, 0, 16), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            AutoButtonColor = false
                        });
                        l_CreateArrow_0(16, 4, "left").Parent = v1366;
                        v1367 = v1140("ImageButton", {
                            Parent = v1365, 
                            Name = "Right", 
                            Position = UDim2.new(1, -16, 0, 0), 
                            Size = UDim2.new(0, 16, 0, 16), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            AutoButtonColor = false
                        });
                        l_CreateArrow_0(16, 4, "right").Parent = v1367;
                    else
                        v1365.Size = UDim2.new(0, 16, 1, 0);
                        v1366 = v1140("ImageButton", {
                            Parent = v1365, 
                            Name = "Up", 
                            Size = UDim2.new(0, 16, 0, 16), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            AutoButtonColor = false
                        });
                        l_CreateArrow_0(16, 4, "up").Parent = v1366;
                        v1367 = v1140("ImageButton", {
                            Parent = v1365, 
                            Name = "Down", 
                            Position = UDim2.new(0, 0, 1, -16), 
                            Size = UDim2.new(0, 16, 0, 16), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            AutoButtonColor = false
                        });
                        l_CreateArrow_0(16, 4, "down").Parent = v1367;
                    end;
                    local v1368 = v1140("Frame", {
                        BackgroundTransparency = 1, 
                        Parent = v1365
                    });
                    if v1364.Horizontal then
                        v1368.Position = UDim2.new(0, 16, 0, 0);
                        v1368.Size = UDim2.new(1, -32, 1, 0);
                    else
                        v1368.Position = UDim2.new(0, 0, 0, 16);
                        v1368.Size = UDim2.new(1, 0, 1, -32);
                    end;
                    local v1369 = v1140("Frame", {
                        BackgroundColor3 = Color3.new(0.47058823529411764, 0.47058823529411764, 0.47058823529411764), 
                        BorderSizePixel = 0, 
                        Parent = v1368
                    });
                    local v1370 = v1140("Frame", {
                        BackgroundTransparency = 1, 
                        Name = "Markers", 
                        Size = UDim2.new(1, 0, 1, 0), 
                        Parent = v1368
                    });
                    local v1371 = false;
                    local v1372 = false;
                    local v1373 = false;
                    v1366.InputBegan:Connect(function(v1374) --[[ Line: 5147 ]]
                        if v1374.UserInputType == Enum.UserInputType.MouseMovement and not v1371 and v1364:CanScrollUp() then
                            v1366.BackgroundTransparency = 0.8;
                        end;
                        if v1374.UserInputType ~= Enum.UserInputType.MouseButton1 or not v1364:CanScrollUp() then
                            return;
                        else
                            v1371 = true;
                            v1366.BackgroundTransparency = 0.5;
                            if v1364:CanScrollUp() then
                                v1364:ScrollUp();
                                v1364.Scrolled:Fire();
                            end;
                            local v1375 = tick();
                            local v1376 = nil;
                            v1376 = l_UserInputService_1.InputEnded:Connect(function(v1377) --[[ Line: 5155 ]]
                                if v1377.UserInputType ~= Enum.UserInputType.MouseButton1 then
                                    return;
                                else
                                    v1376:Disconnect();
                                    if l_CheckMouseInGui_0(v1366) and v1364:CanScrollUp() then
                                        v1366.BackgroundTransparency = 0.8;
                                    else
                                        v1366.BackgroundTransparency = 1;
                                    end;
                                    v1371 = false;
                                    return;
                                end;
                            end);
                            while v1371 do
                                if tick() - v1375 >= 0.3 and v1364:CanScrollUp() then
                                    v1364:ScrollUp();
                                    v1364.Scrolled:Fire();
                                end;
                                wait();
                            end;
                            return;
                        end;
                    end);
                    v1366.InputEnded:Connect(function(v1378) --[[ Line: 5169 ]]
                        if v1378.UserInputType == Enum.UserInputType.MouseMovement and not v1371 then
                            v1366.BackgroundTransparency = 1;
                        end;
                    end);
                    v1367.InputBegan:Connect(function(v1379) --[[ Line: 5172 ]]
                        if v1379.UserInputType == Enum.UserInputType.MouseMovement and not v1371 and v1364:CanScrollDown() then
                            v1367.BackgroundTransparency = 0.8;
                        end;
                        if v1379.UserInputType ~= Enum.UserInputType.MouseButton1 or not v1364:CanScrollDown() then
                            return;
                        else
                            v1371 = true;
                            v1367.BackgroundTransparency = 0.5;
                            if v1364:CanScrollDown() then
                                v1364:ScrollDown();
                                v1364.Scrolled:Fire();
                            end;
                            local v1380 = tick();
                            local v1381 = nil;
                            v1381 = l_UserInputService_1.InputEnded:Connect(function(v1382) --[[ Line: 5180 ]]
                                if v1382.UserInputType ~= Enum.UserInputType.MouseButton1 then
                                    return;
                                else
                                    v1381:Disconnect();
                                    if l_CheckMouseInGui_0(v1367) and v1364:CanScrollDown() then
                                        v1367.BackgroundTransparency = 0.8;
                                    else
                                        v1367.BackgroundTransparency = 1;
                                    end;
                                    v1371 = false;
                                    return;
                                end;
                            end);
                            while v1371 do
                                if tick() - v1380 >= 0.3 and v1364:CanScrollDown() then
                                    v1364:ScrollDown();
                                    v1364.Scrolled:Fire();
                                end;
                                wait();
                            end;
                            return;
                        end;
                    end);
                    v1367.InputEnded:Connect(function(v1383) --[[ Line: 5194 ]]
                        if v1383.UserInputType == Enum.UserInputType.MouseMovement and not v1371 then
                            v1367.BackgroundTransparency = 1;
                        end;
                    end);
                    v1369.InputBegan:Connect(function(v1384) --[[ Line: 5198 ]]
                        if v1384.UserInputType == Enum.UserInputType.MouseMovement and not v1372 then
                            v1369.BackgroundTransparency = 0.2;
                            v1369.BackgroundColor3 = v1364.ThumbSelectColor;
                        end;
                        if v1384.UserInputType ~= Enum.UserInputType.MouseButton1 then
                            return;
                        else
                            local v1385 = v1364.Horizontal and "X" or "Y";
                            local v1386 = nil;
                            v1371 = false;
                            v1373 = false;
                            v1372 = true;
                            v1369.BackgroundTransparency = 0;
                            local v1387 = l_v1138_Mouse_0[v1385] - v1369.AbsolutePosition[v1385];
                            local __ = l_v1138_Mouse_0[v1385];
                            local v1389 = nil;
                            local v1390 = nil;
                            v1389 = l_UserInputService_1.InputEnded:Connect(function(v1391) --[[ Line: 5213 ]]
                                if v1391.UserInputType ~= Enum.UserInputType.MouseButton1 then
                                    return;
                                else
                                    v1389:Disconnect();
                                    if v1390 then
                                        v1390:Disconnect();
                                    end;
                                    if l_CheckMouseInGui_0(v1369) then
                                        v1369.BackgroundTransparency = 0.2;
                                    else
                                        v1369.BackgroundTransparency = 0;
                                        v1369.BackgroundColor3 = v1364.ThumbColor;
                                    end;
                                    v1372 = false;
                                    return;
                                end;
                            end);
                            v1364:Update();
                            v1390 = l_UserInputService_1.InputChanged:Connect(function(v1392) --[[ Line: 5222 ]]
                                if v1392.UserInputType == Enum.UserInputType.MouseMovement and v1372 and v1389.Connected then
                                    local v1393 = v1368.AbsoluteSize[v1385] - v1369.AbsoluteSize[v1385];
                                    local v1394 = l_v1138_Mouse_0[v1385] - v1368.AbsolutePosition[v1385] - v1387;
                                    if v1393 < v1394 then
                                        v1394 = v1393;
                                    elseif v1394 < 0 then
                                        v1394 = 0;
                                    end;
                                    if v1386 ~= v1394 then
                                        v1386 = v1394;
                                        v1364:ScrollTo((math.floor(0.5 + v1394 / v1393 * (v1364.TotalSpace - v1364.VisibleSpace))));
                                    end;
                                    wait();
                                end;
                            end);
                            return;
                        end;
                    end);
                    v1369.InputEnded:Connect(function(v1395) --[[ Line: 5239 ]]
                        if v1395.UserInputType == Enum.UserInputType.MouseMovement and not v1372 then
                            v1369.BackgroundTransparency = 0;
                            v1369.BackgroundColor3 = v1364.ThumbColor;
                        end;
                    end);
                    v1368.InputBegan:Connect(function(v1396) --[[ Line: 5242 ]]
                        if v1396.UserInputType ~= Enum.UserInputType.MouseButton1 or l_CheckMouseInGui_0(v1369) then
                            return;
                        else
                            local v1397 = v1364.Horizontal and "X" or "Y";
                            local v1398 = 0;
                            if l_v1138_Mouse_0[v1397] >= v1369.AbsolutePosition[v1397] + v1369.AbsoluteSize[v1397] then
                                v1398 = 1;
                            end;
                            local function v1400() --[[ Line: 5251 ]] --[[ Name: doTick ]]
                                local v1399 = v1364.VisibleSpace - 1;
                                if v1398 == 0 and l_v1138_Mouse_0[v1397] < v1369.AbsolutePosition[v1397] then
                                    v1364:ScrollTo(v1364.Index - v1399);
                                    return;
                                else
                                    if v1398 == 1 and l_v1138_Mouse_0[v1397] >= v1369.AbsolutePosition[v1397] + v1369.AbsoluteSize[v1397] then
                                        v1364:ScrollTo(v1364.Index + v1399);
                                    end;
                                    return;
                                end;
                            end;
                            v1372 = false;
                            v1373 = true;
                            v1400();
                            local v1401 = tick();
                            local v1402 = nil;
                            v1402 = l_UserInputService_1.InputEnded:Connect(function(v1403) --[[ Line: 5265 ]]
                                if v1403.UserInputType ~= Enum.UserInputType.MouseButton1 then
                                    return;
                                else
                                    v1402:Disconnect();
                                    v1373 = false;
                                    return;
                                end;
                            end);
                            while v1373 do
                                if tick() - v1401 >= 0.3 and l_CheckMouseInGui_0(v1368) then
                                    v1400();
                                end;
                                wait();
                            end;
                            return;
                        end;
                    end);
                    v1365.MouseWheelForward:Connect(function() --[[ Line: 5278 ]]
                        v1364:ScrollTo(v1364.Index - v1364.WheelIncrement);
                    end);
                    v1365.MouseWheelBackward:Connect(function() --[[ Line: 5282 ]]
                        v1364:ScrollTo(v1364.Index + v1364.WheelIncrement);
                    end);
                    v1364.GuiElems.ScrollThumb = v1369;
                    v1364.GuiElems.ScrollThumbFrame = v1368;
                    v1364.GuiElems.Button1 = v1366;
                    v1364.GuiElems.Button2 = v1367;
                    v1364.GuiElems.MarkerFrame = v1370;
                    return v1365;
                end;
                v1348.Update = function(v1405, __) --[[ Line: 5295 ]]
                    local l_TotalSpace_1 = v1405.TotalSpace;
                    local l_VisibleSpace_2 = v1405.VisibleSpace;
                    local __ = v1405.Index;
                    local l_Button1_0 = v1405.GuiElems.Button1;
                    local l_Button2_0 = v1405.GuiElems.Button2;
                    v1405.Index = math.clamp(v1405.Index, 0, (math.max(0, l_TotalSpace_1 - l_VisibleSpace_2)));
                    if v1405.LastTotalSpace ~= v1405.TotalSpace then
                        v1405.LastTotalSpace = v1405.TotalSpace;
                        v1405:UpdateMarkers();
                    end;
                    if v1405:CanScrollUp() then
                        for __, v1413 in pairs(l_Button1_0.Arrow:GetChildren()) do
                            v1413.BackgroundTransparency = 0;
                        end;
                    else
                        l_Button1_0.BackgroundTransparency = 1;
                        for __, v1415 in pairs(l_Button1_0.Arrow:GetChildren()) do
                            v1415.BackgroundTransparency = 0.5;
                        end;
                    end;
                    if v1405:CanScrollDown() then
                        for __, v1417 in pairs(l_Button2_0.Arrow:GetChildren()) do
                            v1417.BackgroundTransparency = 0;
                        end;
                    else
                        l_Button2_0.BackgroundTransparency = 1;
                        for __, v1419 in pairs(l_Button2_0.Arrow:GetChildren()) do
                            v1419.BackgroundTransparency = 0.5;
                        end;
                    end;
                    v1363(v1405);
                end;
                v1348.UpdateMarkers = function(v1420) --[[ Line: 5333 ]]
                    local l_MarkerFrame_0 = v1420.GuiElems.MarkerFrame;
                    l_MarkerFrame_0:ClearAllChildren();
                    for v1422, v1423 in pairs(v1420.Markers) do
                        if v1422 < v1420.TotalSpace then
                            v1140("Frame", {
                                BackgroundTransparency = 0, 
                                BackgroundColor3 = v1423, 
                                BorderSizePixel = 0, 
                                Position = v1420.Horizontal and UDim2.new(v1422 / v1420.TotalSpace, 0, 1, -6) or UDim2.new(1, -6, v1422 / v1420.TotalSpace, 0), 
                                Size = v1420.Horizontal and UDim2.new(0, 1, 0, 6) or UDim2.new(0, 6, 0, 1), 
                                Name = "Marker" .. tostring(v1422), 
                                Parent = l_MarkerFrame_0
                            });
                        end;
                    end;
                end;
                v1348.AddMarker = function(v1424, v1425, v1426) --[[ Line: 5352 ]]
                    v1424.Markers[v1425] = v1426 or Color3.new(0, 0, 0);
                end;
                v1348.ScrollTo = function(v1427, v1428, v1429) --[[ Line: 5355 ]]
                    v1427.Index = v1428;
                    v1427:Update();
                    if not v1429 then
                        v1427.Scrolled:Fire();
                    end;
                end;
                v1348.ScrollUp = function(v1430) --[[ Line: 5362 ]]
                    v1430.Index = v1430.Index - v1430.Increment;
                    v1430:Update();
                end;
                v1348.ScrollDown = function(v1431) --[[ Line: 5366 ]]
                    v1431.Index = v1431.Index + v1431.Increment;
                    v1431:Update();
                end;
                v1348.CanScrollUp = function(v1432) --[[ Line: 5370 ]]
                    return v1432.Index > 0;
                end;
                v1348.CanScrollDown = function(v1433) --[[ Line: 5373 ]]
                    return v1433.Index + v1433.VisibleSpace < v1433.TotalSpace;
                end;
                v1348.GetScrollPercent = function(v1434) --[[ Line: 5376 ]]
                    return v1434.Index / (v1434.TotalSpace - v1434.VisibleSpace);
                end;
                v1348.SetScrollPercent = function(v1435, v1436) --[[ Line: 5379 ]]
                    v1435.Index = math.floor(v1436 * (v1435.TotalSpace - v1435.VisibleSpace));
                    v1435:Update();
                end;
                v1348.Texture = function(v1437, v1438) --[[ Line: 5384 ]]
                    v1437.ThumbColor = v1438.ThumbColor or Color3.new(0, 0, 0);
                    v1437.ThumbSelectColor = v1438.ThumbSelectColor or Color3.new(0, 0, 0);
                    v1437.GuiElems.ScrollThumb.BackgroundColor3 = v1438.ThumbColor or Color3.new(0, 0, 0);
                    v1437.Gui.BackgroundColor3 = v1438.FrameColor or Color3.new(0, 0, 0);
                    v1437.GuiElems.Button1.BackgroundColor3 = v1438.ButtonColor or Color3.new(0, 0, 0);
                    v1437.GuiElems.Button2.BackgroundColor3 = v1438.ButtonColor or Color3.new(0, 0, 0);
                    for __, v1440 in pairs(v1437.GuiElems.Button1.Arrow:GetChildren()) do
                        v1440.BackgroundColor3 = v1438.ArrowColor or Color3.new(0, 0, 0);
                    end;
                    for __, v1442 in pairs(v1437.GuiElems.Button2.Arrow:GetChildren()) do
                        v1442.BackgroundColor3 = v1438.ArrowColor or Color3.new(0, 0, 0);
                    end;
                end;
                v1348.SetScrollFrame = function(v1443, v1444) --[[ Line: 5399 ]]
                    if v1443.ScrollUpEvent then
                        v1443.ScrollUpEvent:Disconnect();
                        v1443.ScrollUpEvent = nil;
                    end;
                    if v1443.ScrollDownEvent then
                        v1443.ScrollDownEvent:Disconnect();
                        v1443.ScrollDownEvent = nil;
                    end;
                    if v1443.ScrollTouchBegin then
                        v1443.ScrollTouchBegin:Disconnect();
                        v1443.ScrollTouchBegin = nil;
                    end;
                    if v1443.ScrollTouchChange then
                        v1443.ScrollTouchChange:Disconnect();
                        v1443.ScrollTouchChange = nil;
                    end;
                    if v1443.ScrollTouchEnd then
                        v1443.ScrollTouchEnd:Disconnect();
                        v1443.ScrollTouchEnd = nil;
                    end;
                    v1443.ScrollUpEvent = v1444.MouseWheelForward:Connect(function() --[[ Line: 5402 ]]
                        v1443:ScrollTo(v1443.Index - v1443.WheelIncrement);
                    end);
                    v1443.ScrollDownEvent = v1444.MouseWheelBackward:Connect(function() --[[ Line: 5403 ]]
                        v1443:ScrollTo(v1443.Index + v1443.WheelIncrement);
                    end);
                    local v1445 = nil;
                    local v1446 = nil;
                    v1443.ScrollTouchBegin = v1444.InputBegan:Connect(function(v1447) --[[ Line: 5406 ]]
                        if v1447.UserInputType == Enum.UserInputType.Touch then
                            v1445 = v1447;
                            v1446 = {
                                Pos = v1447.Position, 
                                Index = v1443.Index
                            };
                        end;
                    end);
                    v1443.ScrollTouchChange = v1444.InputChanged:Connect(function(v1448) --[[ Line: 5415 ]]
                        if v1448.UserInputType ~= Enum.UserInputType.Touch then
                            return;
                        end;
                        if not v1446 or (v1445 and v1448 ~= v1445) then
                            return;
                        end;
                        local v1449 = v1443.Horizontal and "X" or "Y";
                        local v1450 = v1444.AbsoluteSize[v1449];
                        local v1451 = math.max(0, v1443.TotalSpace - v1443.VisibleSpace);
                        if v1450 <= 0 or v1451 <= 0 then
                            return;
                        end;
                        local v1452 = v1448.Position[v1449] - v1446.Pos[v1449];
                        local v1453 = v1450 / v1451;
                        if v1453 <= 0 then
                            return;
                        end;
                        local v1454 = math.floor(v1446.Index - v1452 / v1453 + 0.5);
                        if v1454 ~= v1443.Index then
                            v1443:ScrollTo(v1454);
                        end;
                    end);
                    v1443.ScrollTouchEnd = v1444.InputEnded:Connect(function(v1455) --[[ Line: 5437 ]]
                        if v1455.UserInputType == Enum.UserInputType.Touch and (not v1445 or v1455 == v1445) then
                            v1445 = nil;
                            v1446 = nil;
                        end;
                    end);
                end;
                local v1445 = {
                    __index = v1348
                };
                return {
                    new = function(v1446) --[[ Line: 5409 ]] --[[ Name: new ]]
                        local v1447 = setmetatable({
                            Index = 0, 
                            VisibleSpace = 0, 
                            TotalSpace = 0, 
                            Increment = 1, 
                            WheelIncrement = 1, 
                            Markers = {}, 
                            GuiElems = {}, 
                            Horizontal = v1446, 
                            LastTotalSpace = 0, 
                            Scrolled = v1144.Signal.new()
                        }, v1445);
                        v1447.Gui = v1404(v1447);
                        v1447:Texture({
                            ThumbColor = Color3.fromRGB(60, 60, 60), 
                            ThumbSelectColor = Color3.fromRGB(75, 75, 75), 
                            ArrowColor = Color3.new(1, 1, 1), 
                            FrameColor = Color3.fromRGB(40, 40, 40), 
                            ButtonColor = Color3.fromRGB(75, 75, 75)
                        });
                        return v1447;
                    end
                };
            end)();
            v1144.Window = (function() --[[ Line: 5436 ]]
                local v1448 = {};
                local v1449 = {
                    MinWidth = 200, 
                    FreeWidth = 200
                };
                local l_v1138_Mouse_1 = v1138:GetMouse();
                local v1451 = nil;
                local v1452 = nil;
                local v1453 = {};
                local v1454 = {
                    Width = 300, 
                    Windows = {}, 
                    ResizeCons = {}, 
                    Hidden = true
                };
                local v1455 = {
                    Width = 300, 
                    Windows = {}, 
                    ResizeCons = {}, 
                    Hidden = true
                };
                local v1456 = nil;
                local v1457 = nil;
                local v1458 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v1459 = {};
                local l_IsA_8 = game.IsA;
                local v1461 = {
                    MainColor1 = Color3.fromRGB(52, 52, 52), 
                    MainColor2 = Color3.fromRGB(45, 45, 45), 
                    Button = Color3.fromRGB(60, 60, 60)
                };
                local function v1463() --[[ Line: 5457 ]] --[[ Name: stopTweens ]]
                    for v1462 = 1, #v1459 do
                        v1459[v1462]:Cancel();
                    end;
                    v1459 = {};
                end;
                local function v1484(v1464, v1465, v1466) --[[ Line: 5464 ]] --[[ Name: resizeHook ]]
                    local l_Main_0 = v1464.GuiElems.Main;
                    v1465.InputBegan:Connect(function(v1468) --[[ Line: 5466 ]]
                        if not v1464.Dragging and not v1464.Resizing and v1464.Resizable and v1464.ResizableInternal then
                            local v1469 = v1466:find("[WE]") and true;
                            local v1470 = v1466:find("[NS]") and true;
                            local v1471 = v1466:find("W", 1, true) and -1 or 1;
                            local v1472 = v1466:find("N", 1, true) and -1 or 1;
                            if v1464.Minimized and v1470 then
                                return;
                            elseif v1468.UserInputType == Enum.UserInputType.MouseMovement then
                                v1465.BackgroundTransparency = 0.5;
                                return;
                            elseif v1468.UserInputType == Enum.UserInputType.MouseButton1 then
                                local v1473 = nil;
                                local v1474 = nil;
                                local v1475 = l_v1138_Mouse_1.X - v1465.AbsolutePosition.X;
                                local v1476 = l_v1138_Mouse_1.Y - v1465.AbsolutePosition.Y;
                                v1464.Resizing = v1465;
                                v1465.BackgroundTransparency = 1;
                                do
                                    local l_v1473_0, l_v1474_0 = v1473, v1474;
                                    l_v1473_0 = v1137.UserInputService.InputEnded:Connect(function(v1479) --[[ Line: 5486 ]]
                                        if v1479.UserInputType == Enum.UserInputType.MouseButton1 then
                                            l_v1473_0:Disconnect();
                                            l_v1474_0:Disconnect();
                                            v1464.Resizing = false;
                                            v1465.BackgroundTransparency = 1;
                                        end;
                                    end);
                                    l_v1474_0 = v1137.UserInputService.InputChanged:Connect(function(v1480) --[[ Line: 5495 ]]
                                        if v1464.Resizable and v1464.ResizableInternal and v1480.UserInputType == Enum.UserInputType.MouseMovement then
                                            v1464:StopTweens();
                                            local v1481 = v1480.Position.X - v1465.AbsolutePosition.X - v1475;
                                            local v1482 = v1480.Position.Y - v1465.AbsolutePosition.Y - v1476;
                                            if l_Main_0.AbsoluteSize.X + v1481 * v1471 < v1464.MinX then
                                                v1481 = v1471 * (v1464.MinX - l_Main_0.AbsoluteSize.X);
                                            end;
                                            if l_Main_0.AbsoluteSize.Y + v1482 * v1472 < v1464.MinY then
                                                v1482 = v1472 * (v1464.MinY - l_Main_0.AbsoluteSize.Y);
                                            end;
                                            if v1472 < 0 and l_Main_0.AbsolutePosition.Y + v1482 < 0 then
                                                v1482 = -l_Main_0.AbsolutePosition.Y;
                                            end;
                                            l_Main_0.Position = l_Main_0.Position + UDim2.new(0, v1471 < 0 and v1481 or 0, 0, v1472 < 0 and v1482 or 0);
                                            v1464.SizeX = v1464.SizeX + (v1469 and v1481 * v1471 or 0);
                                            v1464.SizeY = v1464.SizeY + (v1470 and v1482 * v1472 or 0);
                                            l_Main_0.Size = UDim2.new(0, v1464.SizeX, 0, v1464.Minimized and 20 or v1464.SizeY);
                                        end;
                                    end);
                                end;
                            end;
                        end;
                    end);
                    v1465.InputEnded:Connect(function(v1483) --[[ Line: 5518 ]]
                        if v1483.UserInputType == Enum.UserInputType.MouseMovement and v1464.Resizing ~= v1465 then
                            v1465.BackgroundTransparency = 1;
                        end;
                    end);
                end;
                local v1485 = nil;
                local function v1488(v1486) --[[ Line: 5527 ]] --[[ Name: moveToTop ]]
                    local v1487 = table.find(v1453, v1486);
                    if v1487 then
                        table.remove(v1453, v1487);
                        table.insert(v1453, 1, v1486);
                        v1485();
                    end;
                end;
                local function v1495(v1489, v1490) --[[ Line: 5536 ]] --[[ Name: sideHasRoom ]]
                    local v1491 = v1451.AbsoluteSize.Y - math.max(0, #v1489.Windows - 1) * 4;
                    local v1492 = 0;
                    for __, v1494 in pairs(v1489.Windows) do
                        v1492 = v1492 + (v1494.MinY or 100);
                        if v1491 - v1490 < v1492 then
                            return false;
                        end;
                    end;
                    return true;
                end;
                local function v1503(v1496, v1497) --[[ Line: 5547 ]] --[[ Name: getSideInsertPos ]]
                    local v1498 = #v1496.Windows + 1;
                    local v1499 = {
                        0, 
                        v1451.AbsoluteSize.Y
                    };
                    for v1500, v1501 in pairs(v1496.Windows) do
                        local v1502 = v1501.PosY + v1501.SizeY / 2;
                        if v1497 <= v1502 then
                            v1498 = v1500;
                            v1499[2] = v1502;
                            return v1498, v1499;
                        else
                            v1499[1] = v1502;
                        end;
                    end;
                    return v1498, v1499;
                end;
                local function v1506(v1504, v1505) --[[ Line: 5565 ]] --[[ Name: focusInput ]]
                    if l_IsA_8(v1505, "GuiButton") then
                        v1505.MouseButton1Down:Connect(function() --[[ Line: 5567 ]]
                            v1488(v1504);
                        end);
                        return;
                    else
                        if l_IsA_8(v1505, "TextBox") then
                            v1505.Focused:Connect(function() --[[ Line: 5571 ]]
                                v1488(v1504);
                            end);
                        end;
                        return;
                    end;
                end;
                local function v1544(v1507) --[[ Line: 5577 ]]
                    local v1508 = v1139({
                        {
                            1, 
                            "ScreenGui", 
                            {
                                Name = "Window"
                            }
                        }, 
                        {
                            2, 
                            "Frame", 
                            {
                                Active = true, 
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                Name = "Main", 
                                Parent = {
                                    1
                                }, 
                                Position = UDim2.new(0.40000000596046, 0, 0.40000000596046, 0), 
                                Size = UDim2.new(0, 300, 0, 300)
                            }
                        }, 
                        {
                            3, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(0.17647059261799, 0.17647059261799, 0.17647059261799), 
                                BorderSizePixel = 0, 
                                Name = "Content", 
                                Parent = {
                                    2
                                }, 
                                Position = UDim2.new(0, 0, 0, 20), 
                                Size = UDim2.new(1, 0, 1, -20), 
                                ClipsDescendants = true
                            }
                        }, 
                        {
                            4, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.fromRGB(33, 33, 33), 
                                BorderSizePixel = 0, 
                                Name = "Line", 
                                Parent = {
                                    3
                                }, 
                                Size = UDim2.new(1, 0, 0, 1)
                            }
                        }, 
                        {
                            5, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(0.20392157137394, 0.20392157137394, 0.20392157137394), 
                                BorderSizePixel = 0, 
                                Name = "TopBar", 
                                Parent = {
                                    2
                                }, 
                                Size = UDim2.new(1, 0, 0, 20)
                            }
                        }, 
                        {
                            6, 
                            "TextLabel", 
                            {
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BackgroundTransparency = 1, 
                                Font = 3, 
                                Name = "Title", 
                                Parent = {
                                    5
                                }, 
                                Position = UDim2.new(0, 5, 0, 0), 
                                Size = UDim2.new(1, -10, 0, 20), 
                                Text = "Window", 
                                TextColor3 = Color3.new(1, 1, 1), 
                                TextSize = 14, 
                                TextXAlignment = 0
                            }
                        }, 
                        {
                            7, 
                            "TextButton", 
                            {
                                AutoButtonColor = false, 
                                BackgroundColor3 = Color3.new(0.12549020349979, 0.12549020349979, 0.12549020349979), 
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                Font = 3, 
                                Name = "Close", 
                                Parent = {
                                    5
                                }, 
                                Position = UDim2.new(1, -18, 0, 2), 
                                Size = UDim2.new(0, 16, 0, 16), 
                                Text = "", 
                                TextColor3 = Color3.new(1, 1, 1), 
                                TextSize = 14
                            }
                        }, 
                        {
                            8, 
                            "ImageLabel", 
                            {
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BackgroundTransparency = 1, 
                                Image = "rbxassetid://5054663650", 
                                Parent = {
                                    7
                                }, 
                                Position = UDim2.new(0, 3, 0, 3), 
                                Size = UDim2.new(0, 10, 0, 10)
                            }
                        }, 
                        {
                            9, 
                            "UICorner", 
                            {
                                CornerRadius = UDim.new(0, 4), 
                                Parent = {
                                    7
                                }
                            }
                        }, 
                        {
                            10, 
                            "TextButton", 
                            {
                                AutoButtonColor = false, 
                                BackgroundColor3 = Color3.new(0.12549020349979, 0.12549020349979, 0.12549020349979), 
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                Font = 3, 
                                Name = "Minimize", 
                                Parent = {
                                    5
                                }, 
                                Position = UDim2.new(1, -36, 0, 2), 
                                Size = UDim2.new(0, 16, 0, 16), 
                                Text = "", 
                                TextColor3 = Color3.new(1, 1, 1), 
                                TextSize = 14
                            }
                        }, 
                        {
                            11, 
                            "ImageLabel", 
                            {
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BackgroundTransparency = 1, 
                                Image = "rbxassetid://5034768003", 
                                Parent = {
                                    10
                                }, 
                                Position = UDim2.new(0, 3, 0, 3), 
                                Size = UDim2.new(0, 10, 0, 10)
                            }
                        }, 
                        {
                            12, 
                            "UICorner", 
                            {
                                CornerRadius = UDim.new(0, 4), 
                                Parent = {
                                    10
                                }
                            }
                        }, 
                        {
                            13, 
                            "ImageLabel", 
                            {
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                Image = "rbxassetid://1427967925", 
                                Name = "Outlines", 
                                Parent = {
                                    2
                                }, 
                                Position = UDim2.new(0, -5, 0, -5), 
                                ScaleType = 1, 
                                Size = UDim2.new(1, 10, 1, 10), 
                                SliceCenter = Rect.new(6, 6, 25, 25), 
                                TileSize = UDim2.new(0, 20, 0, 20)
                            }
                        }, 
                        {
                            14, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BackgroundTransparency = 1, 
                                Name = "ResizeControls", 
                                Parent = {
                                    2
                                }, 
                                Position = UDim2.new(0, -5, 0, -5), 
                                Size = UDim2.new(1, 10, 1, 10)
                            }
                        }, 
                        {
                            15, 
                            "TextButton", 
                            {
                                AutoButtonColor = false, 
                                BackgroundColor3 = Color3.new(0.27450981736183, 0.27450981736183, 0.27450981736183), 
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                Font = 3, 
                                Name = "North", 
                                Parent = {
                                    14
                                }, 
                                Position = UDim2.new(0, 5, 0, 0), 
                                Size = UDim2.new(1, -10, 0, 5), 
                                Text = "", 
                                TextColor3 = Color3.new(0, 0, 0), 
                                TextSize = 14
                            }
                        }, 
                        {
                            16, 
                            "TextButton", 
                            {
                                AutoButtonColor = false, 
                                BackgroundColor3 = Color3.new(0.27450981736183, 0.27450981736183, 0.27450981736183), 
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                Font = 3, 
                                Name = "South", 
                                Parent = {
                                    14
                                }, 
                                Position = UDim2.new(0, 5, 1, -5), 
                                Size = UDim2.new(1, -10, 0, 5), 
                                Text = "", 
                                TextColor3 = Color3.new(0, 0, 0), 
                                TextSize = 14
                            }
                        }, 
                        {
                            17, 
                            "TextButton", 
                            {
                                AutoButtonColor = false, 
                                BackgroundColor3 = Color3.new(0.27450981736183, 0.27450981736183, 0.27450981736183), 
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                Font = 3, 
                                Name = "NorthEast", 
                                Parent = {
                                    14
                                }, 
                                Position = UDim2.new(1, -5, 0, 0), 
                                Size = UDim2.new(0, 5, 0, 5), 
                                Text = "", 
                                TextColor3 = Color3.new(0, 0, 0), 
                                TextSize = 14
                            }
                        }, 
                        {
                            18, 
                            "TextButton", 
                            {
                                AutoButtonColor = false, 
                                BackgroundColor3 = Color3.new(0.27450981736183, 0.27450981736183, 0.27450981736183), 
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                Font = 3, 
                                Name = "East", 
                                Parent = {
                                    14
                                }, 
                                Position = UDim2.new(1, -5, 0, 5), 
                                Size = UDim2.new(0, 5, 1, -10), 
                                Text = "", 
                                TextColor3 = Color3.new(0, 0, 0), 
                                TextSize = 14
                            }
                        }, 
                        {
                            19, 
                            "TextButton", 
                            {
                                AutoButtonColor = false, 
                                BackgroundColor3 = Color3.new(0.27450981736183, 0.27450981736183, 0.27450981736183), 
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                Font = 3, 
                                Name = "West", 
                                Parent = {
                                    14
                                }, 
                                Position = UDim2.new(0, 0, 0, 5), 
                                Size = UDim2.new(0, 5, 1, -10), 
                                Text = "", 
                                TextColor3 = Color3.new(0, 0, 0), 
                                TextSize = 14
                            }
                        }, 
                        {
                            20, 
                            "TextButton", 
                            {
                                AutoButtonColor = false, 
                                BackgroundColor3 = Color3.new(0.27450981736183, 0.27450981736183, 0.27450981736183), 
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                Font = 3, 
                                Name = "SouthEast", 
                                Parent = {
                                    14
                                }, 
                                Position = UDim2.new(1, -5, 1, -5), 
                                Size = UDim2.new(0, 5, 0, 5), 
                                Text = "", 
                                TextColor3 = Color3.new(0, 0, 0), 
                                TextSize = 14
                            }
                        }, 
                        {
                            21, 
                            "TextButton", 
                            {
                                AutoButtonColor = false, 
                                BackgroundColor3 = Color3.new(0.27450981736183, 0.27450981736183, 0.27450981736183), 
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                Font = 3, 
                                Name = "NorthWest", 
                                Parent = {
                                    14
                                }, 
                                Size = UDim2.new(0, 5, 0, 5), 
                                Text = "", 
                                TextColor3 = Color3.new(0, 0, 0), 
                                TextSize = 14
                            }
                        }, 
                        {
                            22, 
                            "TextButton", 
                            {
                                AutoButtonColor = false, 
                                BackgroundColor3 = Color3.new(0.27450981736183, 0.27450981736183, 0.27450981736183), 
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                Font = 3, 
                                Name = "SouthWest", 
                                Parent = {
                                    14
                                }, 
                                Position = UDim2.new(0, 0, 1, -5), 
                                Size = UDim2.new(0, 5, 0, 5), 
                                Text = "", 
                                TextColor3 = Color3.new(0, 0, 0), 
                                TextSize = 14
                            }
                        }
                    });
                    local l_Main_1 = v1508.Main;
                    local l_TopBar_0 = l_Main_1.TopBar;
                    local l_ResizeControls_0 = l_Main_1.ResizeControls;
                    v1507.GuiElems.Main = l_Main_1;
                    v1507.GuiElems.TopBar = l_Main_1.TopBar;
                    v1507.GuiElems.Content = l_Main_1.Content;
                    v1507.GuiElems.Line = l_Main_1.Content.Line;
                    v1507.GuiElems.Outlines = l_Main_1.Outlines;
                    v1507.GuiElems.Title = l_TopBar_0.Title;
                    v1507.GuiElems.Close = l_TopBar_0.Close;
                    v1507.GuiElems.Minimize = l_TopBar_0.Minimize;
                    v1507.GuiElems.ResizeControls = l_ResizeControls_0;
                    v1507.ContentPane = l_Main_1.Content;
                    l_TopBar_0.InputBegan:Connect(function(v1512) --[[ Line: 5618 ]]
                        if v1512.UserInputType == Enum.UserInputType.MouseButton1 and v1507.Draggable then
                            local v1513 = nil;
                            local v1514 = nil;
                            local l_X_11 = v1451.AbsoluteSize.X;
                            local l_X_12 = l_Main_1.AbsolutePosition.X;
                            local l_Y_5 = l_Main_1.AbsolutePosition.Y;
                            local v1518 = l_v1138_Mouse_1.X - l_X_12;
                            local v1519 = l_v1138_Mouse_1.Y - l_Y_5;
                            local v1520 = nil;
                            local v1521 = nil;
                            guiDragging = true;
                            do
                                local l_v1513_0, l_v1514_0, l_v1520_0, l_v1521_0 = v1513, v1514, v1520, v1521;
                                l_v1513_0 = v2(game:GetService("UserInputService")).InputEnded:Connect(function(v1526) --[[ Line: 5632 ]]
                                    if v1526.UserInputType == Enum.UserInputType.MouseButton1 then
                                        l_v1513_0:Disconnect();
                                        l_v1514_0:Disconnect();
                                        guiDragging = false;
                                        v1452.Parent = nil;
                                        if l_v1521_0 then
                                            local v1527 = l_v1521_0 == "left" and v1454 or l_v1521_0 == "right" and v1455;
                                            v1507:AlignTo(v1527, l_v1520_0);
                                        end;
                                    end;
                                end);
                                l_v1514_0 = v2(game:GetService("UserInputService")).InputChanged:Connect(function(v1528) --[[ Line: 5645 ]]
                                    if v1528.UserInputType == Enum.UserInputType.MouseMovement and v1507.Draggable and not v1507.Closed then
                                        if v1507.Aligned then
                                            if v1454.Resizing or v1455.Resizing then
                                                return;
                                            else
                                                local v1529 = v1528.Position.X - v1518;
                                                local v1530 = v1528.Position.Y - v1519;
                                                if math.sqrt((v1529 - l_X_12) ^ 2 + (v1530 - l_Y_5) ^ 2) >= 5 then
                                                    v1507:SetAligned(false);
                                                    return;
                                                end;
                                            end;
                                        else
                                            local l_X_13 = v1528.Position.X;
                                            local l_Y_6 = v1528.Position.Y;
                                            local v1533 = l_X_13 - v1518;
                                            local v1534 = l_Y_6 - v1519;
                                            if v1534 < 0 then
                                                v1534 = 0;
                                            end;
                                            l_Main_1.Position = UDim2.new(0, v1533, 0, v1534);
                                            if v1507.Resizable and v1507.Alignable then
                                                if l_X_13 < 25 then
                                                    if v1495(v1454, v1507.MinY or 100) then
                                                        local v1535, v1536 = v1503(v1454, l_Y_6);
                                                        v1452.Indicator.Position = UDim2.new(0, -15, 0, v1536[1]);
                                                        v1452.Indicator.Size = UDim2.new(0, 40, 0, v1536[2] - v1536[1]);
                                                        v1144.ShowGui(v1452);
                                                        l_v1520_0 = v1535;
                                                        l_v1521_0 = "left";
                                                        return;
                                                    end;
                                                elseif l_X_11 - 25 <= l_X_13 and v1495(v1455, v1507.MinY or 100) then
                                                    local v1537, v1538 = v1503(v1455, l_Y_6);
                                                    v1452.Indicator.Position = UDim2.new(0, l_X_11 - 25, 0, v1538[1]);
                                                    v1452.Indicator.Size = UDim2.new(0, 40, 0, v1538[2] - v1538[1]);
                                                    v1144.ShowGui(v1452);
                                                    l_v1520_0 = v1537;
                                                    l_v1521_0 = "right";
                                                    return;
                                                end;
                                            end;
                                            v1452.Parent = nil;
                                            l_v1520_0 = nil;
                                            l_v1521_0 = nil;
                                        end;
                                    end;
                                end);
                            end;
                        end;
                    end);
                    l_TopBar_0.Close.MouseButton1Click:Connect(function() --[[ Line: 5692 ]]
                        if v1507.Closed then
                            return;
                        else
                            v1507:Close();
                            return;
                        end;
                    end);
                    l_TopBar_0.Minimize.MouseButton1Click:Connect(function() --[[ Line: 5697 ]]
                        if v1507.Closed then
                            return;
                        elseif v1507.Aligned then
                            v1507:SetAligned(false);
                            return;
                        else
                            v1507:SetMinimized();
                            return;
                        end;
                    end);
                    l_TopBar_0.Minimize.MouseButton2Click:Connect(function() --[[ Line: 5706 ]]
                        if v1507.Closed then
                            return;
                        else
                            if not v1507.Aligned then
                                v1507:SetMinimized(nil, 2);
                                l_TopBar_0.Minimize.BackgroundTransparency = 1;
                            end;
                            return;
                        end;
                    end);
                    l_Main_1.InputBegan:Connect(function(v1539) --[[ Line: 5714 ]]
                        if v1539.UserInputType == Enum.UserInputType.MouseButton1 and not v1507.Aligned and not v1507.Closed then
                            v1488(v1507);
                        end;
                    end);
                    l_Main_1:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ Line: 5720 ]]
                        local l_AbsolutePosition_2 = l_Main_1.AbsolutePosition;
                        v1507.PosX = l_AbsolutePosition_2.X;
                        v1507.PosY = l_AbsolutePosition_2.Y;
                    end);
                    v1484(v1507, l_ResizeControls_0.North, "N");
                    v1484(v1507, l_ResizeControls_0.NorthEast, "NE");
                    v1484(v1507, l_ResizeControls_0.East, "E");
                    v1484(v1507, l_ResizeControls_0.SouthEast, "SE");
                    v1484(v1507, l_ResizeControls_0.South, "S");
                    v1484(v1507, l_ResizeControls_0.SouthWest, "SW");
                    v1484(v1507, l_ResizeControls_0.West, "W");
                    v1484(v1507, l_ResizeControls_0.NorthWest, "NW");
                    l_Main_1.Size = UDim2.new(0, v1507.SizeX, 0, v1507.SizeY);
                    v1508.DescendantAdded:Connect(function(v1541) --[[ Line: 5737 ]]
                        v1506(v1507, v1541);
                    end);
                    local l_v1508_Descendants_0 = v1508:GetDescendants();
                    for v1543 = 1, #l_v1508_Descendants_0 do
                        v1506(v1507, l_v1508_Descendants_0[v1543]);
                    end;
                    v1507.MinimizeAnim = v1144.ButtonAnim(l_TopBar_0.Minimize);
                    v1507.CloseAnim = v1144.ButtonAnim(l_TopBar_0.Close);
                    return v1508;
                end;
                local function v1552(v1545) --[[ Line: 5749 ]] --[[ Name: updateSideFrames ]]
                    v1463();
                    v1454.Frame.Size = UDim2.new(0, v1454.Width, 1, 0);
                    v1455.Frame.Size = UDim2.new(0, v1455.Width, 1, 0);
                    v1454.Frame.Resizer.Position = UDim2.new(0, v1454.Width, 0, 0);
                    v1455.Frame.Resizer.Position = UDim2.new(0, -5, 0, 0);
                    local v1546 = true;
                    if #v1454.Windows ~= 0 then
                        v1546 = v1454.Hidden;
                    end;
                    local v1547 = true;
                    if #v1455.Windows ~= 0 then
                        v1547 = v1455.Hidden;
                    end;
                    local v1548 = v1546 and UDim2.new(0, -v1454.Width - 10, 0, 0) or UDim2.new(0, 0, 0, 0);
                    local v1549 = v1547 and UDim2.new(1, 10, 0, 0) or UDim2.new(1, -v1455.Width, 0, 0);
                    v1451.LeftToggle.Text = v1546 and ">" or "<";
                    v1451.RightToggle.Text = v1547 and "<" or ">";
                    if not v1545 then
                        local function v1551(...) --[[ Line: 5775 ]] --[[ Name: insertTween ]]
                            local v1550 = v1137.TweenService:Create(...);
                            v1459[#v1459 + 1] = v1550;
                            v1550:Play();
                        end;
                        v1551(v1454.Frame, v1458, {
                            Position = v1548
                        });
                        v1551(v1455.Frame, v1458, {
                            Position = v1549
                        });
                        v1551(v1451.LeftToggle, v1458, {
                            Position = UDim2.new(0, #v1454.Windows == 0 and -16 or 0, 0, -36)
                        });
                        v1551(v1451.RightToggle, v1458, {
                            Position = UDim2.new(1, #v1455.Windows == 0 and 0 or -16, 0, -36)
                        });
                        return;
                    else
                        v1454.Frame.Position = v1548;
                        v1455.Frame.Position = v1549;
                        v1451.LeftToggle.Position = UDim2.new(0, #v1454.Windows == 0 and -16 or 0, 0, -36);
                        v1451.RightToggle.Position = UDim2.new(1, #v1455.Windows == 0 and 0 or -16, 0, -36);
                        return;
                    end;
                end;
                local function v1556(v1553) --[[ Line: 5792 ]] --[[ Name: getSideFramePos ]]
                    local v1554 = true;
                    if #v1454.Windows ~= 0 then
                        v1554 = v1454.Hidden;
                    end;
                    local v1555 = true;
                    if #v1455.Windows ~= 0 then
                        v1555 = v1455.Hidden;
                    end;
                    if v1553 == v1454 then
                        return v1554 and UDim2.new(0, -v1454.Width - 10, 0, 0) or UDim2.new(0, 0, 0, 0);
                    else
                        return v1555 and UDim2.new(1, 10, 0, 0) or UDim2.new(1, -v1455.Width, 0, 0);
                    end;
                end;
                local function v1562(v1557) --[[ Line: 5802 ]] --[[ Name: sideResized ]]
                    local v1558 = 0;
                    local v1559 = v1556(v1557);
                    for __, v1561 in pairs(v1557.Windows) do
                        v1561.SizeX = v1557.Width;
                        v1561.GuiElems.Main.Size = UDim2.new(0, v1557.Width, 0, v1561.SizeY);
                        v1561.GuiElems.Main.Position = UDim2.new(v1559.X.Scale, v1559.X.Offset, 0, v1558);
                        v1558 = v1558 + v1561.SizeY + 4;
                    end;
                end;
                local function v1593(v1563, v1564, v1565, v1566) --[[ Line: 5813 ]] --[[ Name: sideResizerHook ]]
                    local l_Mouse_2 = v1126.Mouse;
                    local l_Windows_0 = v1565.Windows;
                    v1563.InputBegan:Connect(function(v1569) --[[ Line: 5817 ]]
                        if not v1565.Resizing then
                            if v1569.UserInputType == Enum.UserInputType.MouseMovement then
                                v1563.BackgroundColor3 = v1461.MainColor2;
                                return;
                            elseif v1569.UserInputType == Enum.UserInputType.MouseButton1 then
                                local v1570 = nil;
                                local v1571 = nil;
                                local v1572 = l_Mouse_2.X - v1563.AbsolutePosition.X;
                                local v1573 = l_Mouse_2.Y - v1563.AbsolutePosition.Y;
                                v1565.Resizing = v1563;
                                v1563.BackgroundColor3 = v1461.MainColor2;
                                do
                                    local l_v1570_0, l_v1571_0 = v1570, v1571;
                                    l_v1570_0 = v1137.UserInputService.InputEnded:Connect(function(v1576) --[[ Line: 5830 ]]
                                        if v1576.UserInputType == Enum.UserInputType.MouseButton1 then
                                            l_v1570_0:Disconnect();
                                            l_v1571_0:Disconnect();
                                            v1565.Resizing = false;
                                            v1563.BackgroundColor3 = v1461.Button;
                                        end;
                                    end);
                                    l_v1571_0 = v1137.UserInputService.InputChanged:Connect(function(v1577) --[[ Line: 5839 ]]
                                        if not v1563.Parent then
                                            l_v1570_0:Disconnect();
                                            l_v1571_0:Disconnect();
                                            v1565.Resizing = false;
                                            return;
                                        else
                                            if v1577.UserInputType == Enum.UserInputType.MouseMovement then
                                                if v1564 == "V" then
                                                    local v1578 = v1577.Position.Y - v1563.AbsolutePosition.Y - v1573;
                                                    if v1578 > 0 then
                                                        local l_v1578_0 = v1578;
                                                        for v1580 = v1566 + 1, #l_Windows_0 do
                                                            local v1581 = l_Windows_0[v1580];
                                                            local v1582 = math.max(v1581.SizeY - l_v1578_0, v1581.MinY or 100);
                                                            l_v1578_0 = l_v1578_0 - (v1581.SizeY - v1582);
                                                            v1581.SizeY = v1582;
                                                        end;
                                                        l_Windows_0[v1566].SizeY = l_Windows_0[v1566].SizeY + math.max(0, v1578 - l_v1578_0);
                                                    else
                                                        local v1583 = -v1578;
                                                        for v1584 = v1566, 1, -1 do
                                                            local v1585 = l_Windows_0[v1584];
                                                            local v1586 = math.max(v1585.SizeY - v1583, v1585.MinY or 100);
                                                            v1583 = v1583 - (v1585.SizeY - v1586);
                                                            v1585.SizeY = v1586;
                                                        end;
                                                        l_Windows_0[v1566 + 1].SizeY = l_Windows_0[v1566 + 1].SizeY + math.max(0, -v1578 - v1583);
                                                    end;
                                                    v1552();
                                                    v1562(v1565);
                                                    return;
                                                elseif v1564 == "H" then
                                                    local v1587 = math.max(300, v1451.AbsoluteSize.X - v1449.FreeWidth);
                                                    local v1588 = v1565 == v1454 and v1455 or v1454;
                                                    local v1589 = v1577.Position.X - v1563.AbsolutePosition.X - v1572;
                                                    local v1590 = v1565 == v1454 and v1589 or -v1589;
                                                    v1590 = math.max(v1449.MinWidth, v1565.Width + v1590);
                                                    if v1590 + v1588.Width <= v1587 then
                                                        v1565.Width = v1590;
                                                    else
                                                        local v1591 = v1587 - v1590;
                                                        if v1449.MinWidth <= v1591 then
                                                            v1565.Width = v1590;
                                                            v1588.Width = v1591;
                                                        else
                                                            v1565.Width = v1587 - v1449.MinWidth;
                                                            v1588.Width = v1449.MinWidth;
                                                        end;
                                                    end;
                                                    v1552(true);
                                                    v1562(v1565);
                                                    v1562(v1588);
                                                end;
                                            end;
                                            return;
                                        end;
                                    end);
                                end;
                            end;
                        end;
                    end);
                    v1563.InputEnded:Connect(function(v1592) --[[ Line: 5902 ]]
                        if v1592.UserInputType == Enum.UserInputType.MouseMovement and v1565.Resizing ~= v1563 then
                            v1563.BackgroundColor3 = v1461.Button;
                        end;
                    end);
                end;
                local function v1610(v1594, v1595) --[[ Line: 5909 ]] --[[ Name: renderSide ]]
                    local v1596 = 0;
                    local v1597 = v1556(v1594);
                    local v1598 = v1594.WindowResizer:Clone();
                    for __, v1600 in pairs(v1594.ResizeCons) do
                        v1600:Disconnect();
                    end;
                    for __, v1602 in pairs(v1594.Frame:GetChildren()) do
                        if v1602.Name == "WindowResizer" then
                            v1602:Destroy();
                        end;
                    end;
                    v1594.ResizeCons = {};
                    v1594.Resizing = nil;
                    for v1603, v1604 in pairs(v1594.Windows) do
                        v1604.SidePos = v1603;
                        local v1605 = v1603 == #v1594.Windows;
                        local v1606 = UDim2.new(0, v1594.Width, 0, v1604.SizeY);
                        local v1607 = UDim2.new(v1597.X.Scale, v1597.X.Offset, 0, v1596);
                        v1144.ShowGui(v1604.Gui);
                        if v1595 then
                            v1604.GuiElems.Main.Size = v1606;
                            v1604.GuiElems.Main.Position = v1607;
                        else
                            local v1608 = v1137.TweenService:Create(v1604.GuiElems.Main, v1458, {
                                Size = v1606, 
                                Position = v1607
                            });
                            v1459[#v1459 + 1] = v1608;
                            v1608:Play();
                        end;
                        v1596 = v1596 + v1604.SizeY + 4;
                        if not v1605 then
                            local v1609 = v1598:Clone();
                            v1609.Position = UDim2.new(1, -v1594.Width, 0, v1596 - 4);
                            v1594.ResizeCons[#v1594.ResizeCons + 1] = v1604.Gui.Main:GetPropertyChangedSignal("Size"):Connect(function() --[[ Line: 5938 ]]
                                v1609.Position = UDim2.new(1, -v1594.Width, 0, v1604.GuiElems.Main.Position.Y.Offset + v1604.GuiElems.Main.Size.Y.Offset);
                            end);
                            v1594.ResizeCons[#v1594.ResizeCons + 1] = v1604.Gui.Main:GetPropertyChangedSignal("Position"):Connect(function() --[[ Line: 5941 ]]
                                v1609.Position = UDim2.new(1, -v1594.Width, 0, v1604.GuiElems.Main.Position.Y.Offset + v1604.GuiElems.Main.Size.Y.Offset);
                            end);
                            v1593(v1609, "V", v1594, v1603);
                            v1609.Parent = v1594.Frame;
                        end;
                    end;
                end;
                local function v1626(v1611, v1612) --[[ Line: 5953 ]] --[[ Name: updateSide ]]
                    local v1613 = 0;
                    local v1614 = 0;
                    local v1615 = 0;
                    local l_Windows_1 = v1611.Windows;
                    local v1617 = v1451.AbsoluteSize.Y - math.max(0, #l_Windows_1 - 1) * 4;
                    for __, v1619 in pairs(l_Windows_1) do
                        v1613 = v1613 + v1619.SizeY;
                    end;
                    for v1620, v1621 in pairs(l_Windows_1) do
                        if v1620 == #l_Windows_1 then
                            v1621.SizeY = v1617 - v1614;
                            v1615 = math.max(0, (v1621.MinY or 100) - v1621.SizeY);
                        else
                            v1621.SizeY = math.max(math.floor(v1621.SizeY / v1613 * v1617), v1621.MinY or 100);
                        end;
                        v1614 = v1614 + v1621.SizeY;
                    end;
                    if v1615 > 0 then
                        for v1622 = #l_Windows_1 - 1, 1, -1 do
                            local v1623 = l_Windows_1[v1622];
                            local v1624 = math.max(v1623.SizeY - v1615, v1623.MinY or 100);
                            v1615 = v1615 - (v1623.SizeY - v1624);
                            v1623.SizeY = v1624;
                        end;
                        local v1625 = l_Windows_1[#l_Windows_1];
                        v1625.SizeY = (v1625.MinY or 100) - v1615;
                    end;
                    v1610(v1611, v1612);
                end;
                v1485 = function(v1627) --[[ Line: 5984 ]]
                    v1552(v1627);
                    v1626(v1454, v1627);
                    v1626(v1455, v1627);
                    local v1628 = 0;
                    for v1629 = #v1453, 1, -1 do
                        v1453[v1629].Gui.DisplayOrder = v1456 + v1628;
                        v1144.ShowGui(v1453[v1629].Gui);
                        v1628 = v1628 + 1;
                    end;
                end;
                v1448.SetMinimized = function(v1630, v1631, v1632) --[[ Line: 6001 ]]
                    local l_Minimized_0 = v1630.Minimized;
                    local v1634 = nil;
                    v1634 = if v1631 == nil then not v1630.Minimized else v1631;
                    v1630.Minimized = v1634;
                    if not v1632 then
                        v1632 = 1;
                    end;
                    local l_ResizeControls_1 = v1630.GuiElems.ResizeControls;
                    local v1636 = {
                        "North", 
                        "NorthEast", 
                        "NorthWest", 
                        "South", 
                        "SouthEast", 
                        "SouthWest"
                    };
                    for v1637 = 1, #v1636 do
                        local l_l_ResizeControls_1_FirstChild_0 = l_ResizeControls_1:FindFirstChild(v1636[v1637]);
                        if l_l_ResizeControls_1_FirstChild_0 then
                            l_l_ResizeControls_1_FirstChild_0.Visible = not v1634;
                        end;
                    end;
                    if v1632 == 1 or v1632 == 2 then
                        v1630:StopTweens();
                        if v1632 == 1 then
                            v1630.GuiElems.Main:TweenSize(UDim2.new(0, v1630.SizeX, 0, v1634 and 20 or v1630.SizeY), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.25, true);
                        else
                            local l_Y_7 = v1451.AbsoluteSize.Y;
                            local v1640 = UDim2.new(0, v1630.PosX, 0, v1634 and math.min(l_Y_7 - 20, v1630.PosY + v1630.SizeY - 20) or math.max(0, v1630.PosY - v1630.SizeY + 20));
                            v1630.GuiElems.Main:TweenPosition(v1640, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.25, true);
                            v1630.GuiElems.Main:TweenSize(UDim2.new(0, v1630.SizeX, 0, v1634 and 20 or v1630.SizeY), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.25, true);
                        end;
                        v1630.GuiElems.Minimize.ImageLabel.Image = v1634 and "rbxassetid://5060023708" or "rbxassetid://5034768003";
                    end;
                    if l_Minimized_0 ~= v1634 then
                        if v1634 then
                            v1630.OnMinimize:Fire();
                            return;
                        else
                            v1630.OnRestore:Fire();
                        end;
                    end;
                end;
                v1448.Resize = function(v1641, v1642, v1643) --[[ Line: 6038 ]]
                    v1641.SizeX = v1642 or v1641.SizeX;
                    v1641.SizeY = v1643 or v1641.SizeY;
                    v1641.GuiElems.Main.Size = UDim2.new(0, v1641.SizeX, 0, v1641.SizeY);
                end;
                v1448.SetSize = v1448.Resize;
                v1448.SetTitle = function(v1644, v1645) --[[ Line: 6046 ]]
                    v1644.GuiElems.Title.Text = v1645;
                end;
                v1448.SetResizable = function(v1646, v1647) --[[ Line: 6050 ]]
                    v1646.Resizable = v1647;
                    v1646.GuiElems.ResizeControls.Visible = v1646.Resizable and v1646.ResizableInternal;
                end;
                v1448.SetResizableInternal = function(v1648, v1649) --[[ Line: 6055 ]]
                    v1648.ResizableInternal = v1649;
                    v1648.GuiElems.ResizeControls.Visible = v1648.Resizable and v1648.ResizableInternal;
                end;
                v1448.SetAligned = function(v1650, v1651) --[[ Line: 6060 ]]
                    v1650.Aligned = v1651;
                    v1650:SetResizableInternal(not v1651);
                    v1650.GuiElems.Main.Active = not v1651;
                    v1650.GuiElems.Main.Outlines.Visible = not v1651;
                    if not v1651 then
                        for v1652, v1653 in pairs(v1454.Windows) do
                            if v1653 == v1650 then
                                table.remove(v1454.Windows, v1652);
                                break;
                            end;
                        end;
                        for v1654, v1655 in pairs(v1455.Windows) do
                            if v1655 == v1650 then
                                table.remove(v1455.Windows, v1654);
                                break;
                            end;
                        end;
                        if not table.find(v1453, v1650) then
                            table.insert(v1453, 1, v1650);
                        end;
                        v1650.GuiElems.Minimize.ImageLabel.Image = "rbxassetid://5034768003";
                        v1650.Side = nil;
                        v1485();
                        return;
                    else
                        v1650:SetMinimized(false, 3);
                        for v1656, v1657 in pairs(v1453) do
                            if v1657 == v1650 then
                                table.remove(v1453, v1656);
                                break;
                            end;
                        end;
                        v1650.GuiElems.Minimize.ImageLabel.Image = "rbxassetid://5448127505";
                        return;
                    end;
                end;
                v1448.Add = function(v1658, v1659, v1660) --[[ Line: 6079 ]]
                    if type(v1659) == "table" and v1659.Gui and v1659.Gui:IsA("GuiObject") then
                        v1659.Gui.Parent = v1658.ContentPane;
                    else
                        v1659.Parent = v1658.ContentPane;
                    end;
                    if v1660 then
                        v1658.Elements[v1660] = v1659;
                    end;
                end;
                v1448.GetElement = function(v1661, __, v1663) --[[ Line: 6088 ]]
                    return v1661.Elements[v1663];
                end;
                v1448.AlignTo = function(v1664, v1665, v1666, v1667, v1668) --[[ Line: 6092 ]]
                    if table.find(v1665.Windows, v1664) or v1664.Closed then
                        return;
                    else
                        v1667 = v1667 or v1664.SizeY;
                        if v1667 > 0 and v1667 <= 1 then
                            local v1669 = 0;
                            for __, v1671 in pairs(v1665.Windows) do
                                v1669 = v1669 + v1671.SizeY;
                            end;
                            v1664.SizeY = v1669 > 0 and v1669 * v1667 * 2 or v1667;
                        else
                            v1664.SizeY = v1667 > 0 and v1667 or 100;
                        end;
                        v1664:SetAligned(true);
                        v1664.Side = v1665;
                        v1664.SizeX = v1665.Width;
                        v1664.Gui.DisplayOrder = v1457 + 1;
                        for __, v1673 in pairs(v1665.Windows) do
                            v1673.Gui.DisplayOrder = v1457;
                        end;
                        v1666 = math.min(#v1665.Windows + 1, v1666 or 1);
                        v1664.SidePos = v1666;
                        table.insert(v1665.Windows, v1666, v1664);
                        if not v1668 then
                            v1665.Hidden = false;
                        end;
                        return;
                    end;
                end;
                v1448.Close = function(v1674) --[[ Line: 6119 ]]
                    v1674.Closed = true;
                    v1674:SetResizableInternal(false);
                    v1144.FindAndRemove(v1454.Windows, v1674);
                    v1144.FindAndRemove(v1455.Windows, v1674);
                    v1144.FindAndRemove(v1453, v1674);
                    v1674.MinimizeAnim.Disable();
                    v1674.CloseAnim.Disable();
                    v1674.ClosedSide = v1674.Side;
                    v1674.Side = nil;
                    v1674.OnDeactivate:Fire();
                    if not v1674.Aligned then
                        v1674:StopTweens();
                        local v1675 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                        local v1676 = tick();
                        v1674.LastClose = v1676;
                        v1674:DoTween(v1674.GuiElems.Main, v1675, {
                            Size = UDim2.new(0, v1674.SizeX, 0, 20)
                        });
                        v1674:DoTween(v1674.GuiElems.Title, v1675, {
                            TextTransparency = 1
                        });
                        v1674:DoTween(v1674.GuiElems.Minimize.ImageLabel, v1675, {
                            ImageTransparency = 1
                        });
                        v1674:DoTween(v1674.GuiElems.Close.ImageLabel, v1675, {
                            ImageTransparency = 1
                        });
                        v1144.FastWait(0.2);
                        if v1676 ~= v1674.LastClose then
                            return;
                        else
                            v1674:DoTween(v1674.GuiElems.TopBar, v1675, {
                                BackgroundTransparency = 1
                            });
                            v1674:DoTween(v1674.GuiElems.Outlines, v1675, {
                                ImageTransparency = 1
                            });
                            v1144.FastWait(0.2);
                            if v1676 ~= v1674.LastClose then
                                return;
                            end;
                        end;
                    end;
                    v1674.Aligned = false;
                    v1674.Gui.Parent = nil;
                    v1485(true);
                end;
                v1448.Hide = v1448.Close;
                v1448.IsVisible = function(v1677) --[[ Line: 6160 ]]
                    return not v1677.Closed and (v1677.Side and not v1677.Side.Hidden or not v1677.Side);
                end;
                v1448.IsContentVisible = function(v1678) --[[ Line: 6164 ]]
                    return v1678:IsVisible() and not v1678.Minimized;
                end;
                v1448.Focus = function(v1679) --[[ Line: 6168 ]]
                    v1488(v1679);
                end;
                v1448.MoveInBoundary = function(v1680) --[[ Line: 6172 ]]
                    local l_PosX_0 = v1680.PosX;
                    local l_PosY_0 = v1680.PosY;
                    local l_X_14 = v1451.AbsoluteSize.X;
                    local l_Y_8 = v1451.AbsoluteSize.Y;
                    l_PosX_0 = math.min(l_PosX_0, l_X_14 - v1680.SizeX);
                    l_PosY_0 = math.min(l_PosY_0, l_Y_8 - 20);
                    v1680.GuiElems.Main.Position = UDim2.new(0, l_PosX_0, 0, l_PosY_0);
                end;
                v1448.DoTween = function(v1685, ...) --[[ Line: 6180 ]]
                    local v1686 = v1137.TweenService:Create(...);
                    v1685.Tweens[#v1685.Tweens + 1] = v1686;
                    v1686:Play();
                end;
                v1448.StopTweens = function(v1687) --[[ Line: 6186 ]]
                    for __, v1689 in pairs(v1687.Tweens) do
                        v1689:Cancel();
                    end;
                    v1687.Tweens = {};
                end;
                v1448.Show = function(v1690, v1691) --[[ Line: 6193 ]]
                    return v1449.ShowWindow(v1690, v1691);
                end;
                v1448.ShowAndFocus = function(v1692, v1693) --[[ Line: 6197 ]]
                    v1449.ShowWindow(v1692, v1693);
                    v1137.RunService.RenderStepped:wait();
                    v1692:Focus();
                end;
                v1449.ShowWindow = function(v1694, v1695) --[[ Line: 6203 ]]
                    v1695 = v1695 or {};
                    local l_Align_0 = v1695.Align;
                    local l_Pos_0 = v1695.Pos;
                    local l_Size_1 = v1695.Size;
                    local v1699 = l_Align_0 == "left" and v1454 or l_Align_0 == "right" and v1455;
                    if not v1694.Closed then
                        if not v1694.Aligned then
                            v1694:SetMinimized(false);
                            return;
                        else
                            if v1694.Side and not v1695.Silent then
                                v1449.SetSideVisible(v1694.Side, true);
                            end;
                            return;
                        end;
                    else
                        v1694.Closed = false;
                        v1694.LastClose = tick();
                        v1694.GuiElems.Title.TextTransparency = 0;
                        v1694.GuiElems.Minimize.ImageLabel.ImageTransparency = 0;
                        v1694.GuiElems.Close.ImageLabel.ImageTransparency = 0;
                        v1694.GuiElems.TopBar.BackgroundTransparency = 0;
                        v1694.GuiElems.Outlines.ImageTransparency = 0;
                        v1694.GuiElems.Minimize.ImageLabel.Image = "rbxassetid://5034768003";
                        v1694.GuiElems.Main.Active = true;
                        v1694.GuiElems.Main.Outlines.Visible = true;
                        v1694:SetMinimized(false, 3);
                        v1694:SetResizableInternal(true);
                        v1694.MinimizeAnim.Enable();
                        v1694.CloseAnim.Enable();
                        if l_Align_0 then
                            v1694:AlignTo(v1699, l_Pos_0, l_Size_1, v1695.Silent);
                        elseif l_Align_0 == nil and v1694.ClosedSide then
                            v1694:AlignTo(v1694.ClosedSide, v1694.SidePos, l_Size_1, true);
                            v1449.SetSideVisible(v1694.ClosedSide, true);
                        elseif table.find(v1453, v1694) then
                            return;
                        else
                            v1694.GuiElems.Main.Size = UDim2.new(0, v1694.SizeX, 0, 20);
                            local v1700 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                            v1694:StopTweens();
                            v1694:DoTween(v1694.GuiElems.Main, v1700, {
                                Size = UDim2.new(0, v1694.SizeX, 0, v1694.SizeY)
                            });
                            v1694.SizeY = l_Size_1 or v1694.SizeY;
                            table.insert(v1453, 1, v1694);
                            v1485();
                        end;
                        v1694.ClosedSide = nil;
                        v1694.OnActivate:Fire();
                        return;
                    end;
                end;
                v1449.ToggleSide = function(v1701) --[[ Line: 6259 ]]
                    local v1702 = v1701 == "left" and v1454 or v1455;
                    v1702.Hidden = not v1702.Hidden;
                    for __, v1704 in pairs(v1702.Windows) do
                        if v1702.Hidden then
                            v1704.OnDeactivate:Fire();
                        else
                            v1704.OnActivate:Fire();
                        end;
                    end;
                    v1485();
                end;
                v1449.SetSideVisible = function(v1705, v1706) --[[ Line: 6272 ]]
                    local v1707 = type(v1705) == "table" and v1705 or v1705 == "left" and v1454 or v1455;
                    v1707.Hidden = not v1706;
                    for __, v1709 in pairs(v1707.Windows) do
                        if v1707.Hidden then
                            v1709.OnDeactivate:Fire();
                        else
                            v1709.OnActivate:Fire();
                        end;
                    end;
                    v1485();
                end;
                v1449.Init = function() --[[ Line: 6285 ]]
                    v1456 = v1126.DisplayOrders.Window;
                    v1457 = v1126.DisplayOrders.SideWindow;
                    v1451 = Instance.new("ScreenGui");
                    local v1710 = v1139({
                        {
                            1, 
                            "Frame", 
                            {
                                Active = true, 
                                Name = "LeftSide", 
                                BackgroundColor3 = Color3.new(0.17647059261799, 0.17647059261799, 0.17647059261799), 
                                BorderSizePixel = 0
                            }
                        }, 
                        {
                            2, 
                            "TextButton", 
                            {
                                AutoButtonColor = false, 
                                BackgroundColor3 = Color3.new(0.2549019753933, 0.2549019753933, 0.2549019753933), 
                                BorderSizePixel = 0, 
                                Font = 3, 
                                Name = "Resizer", 
                                Parent = {
                                    1
                                }, 
                                Size = UDim2.new(0, 5, 1, 0), 
                                Text = "", 
                                TextColor3 = Color3.new(0, 0, 0), 
                                TextSize = 14
                            }
                        }, 
                        {
                            3, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(0.14117647707462, 0.14117647707462, 0.14117647707462), 
                                BorderSizePixel = 0, 
                                Name = "Line", 
                                Parent = {
                                    2
                                }, 
                                Position = UDim2.new(0, 0, 0, 0), 
                                Size = UDim2.new(0, 1, 1, 0)
                            }
                        }, 
                        {
                            4, 
                            "TextButton", 
                            {
                                AutoButtonColor = false, 
                                BackgroundColor3 = Color3.new(0.2549019753933, 0.2549019753933, 0.2549019753933), 
                                BorderSizePixel = 0, 
                                Font = 3, 
                                Name = "WindowResizer", 
                                Parent = {
                                    1
                                }, 
                                Position = UDim2.new(1, -300, 0, 0), 
                                Size = UDim2.new(1, 0, 0, 4), 
                                Text = "", 
                                TextColor3 = Color3.new(0, 0, 0), 
                                TextSize = 14
                            }
                        }, 
                        {
                            5, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(0.14117647707462, 0.14117647707462, 0.14117647707462), 
                                BorderSizePixel = 0, 
                                Name = "Line", 
                                Parent = {
                                    4
                                }, 
                                Size = UDim2.new(1, 0, 0, 1)
                            }
                        }
                    });
                    v1454.Frame = v1710;
                    v1710.Position = UDim2.new(0, -v1454.Width - 10, 0, 0);
                    v1454.WindowResizer = v1710.WindowResizer;
                    v1710.WindowResizer.Parent = nil;
                    v1710.Parent = v1451;
                    local v1711 = v1139({
                        {
                            1, 
                            "Frame", 
                            {
                                Active = true, 
                                Name = "RightSide", 
                                BackgroundColor3 = Color3.new(0.17647059261799, 0.17647059261799, 0.17647059261799), 
                                BorderSizePixel = 0
                            }
                        }, 
                        {
                            2, 
                            "TextButton", 
                            {
                                AutoButtonColor = false, 
                                BackgroundColor3 = Color3.new(0.2549019753933, 0.2549019753933, 0.2549019753933), 
                                BorderSizePixel = 0, 
                                Font = 3, 
                                Name = "Resizer", 
                                Parent = {
                                    1
                                }, 
                                Size = UDim2.new(0, 5, 1, 0), 
                                Text = "", 
                                TextColor3 = Color3.new(0, 0, 0), 
                                TextSize = 14
                            }
                        }, 
                        {
                            3, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(0.14117647707462, 0.14117647707462, 0.14117647707462), 
                                BorderSizePixel = 0, 
                                Name = "Line", 
                                Parent = {
                                    2
                                }, 
                                Position = UDim2.new(0, 4, 0, 0), 
                                Size = UDim2.new(0, 1, 1, 0)
                            }
                        }, 
                        {
                            4, 
                            "TextButton", 
                            {
                                AutoButtonColor = false, 
                                BackgroundColor3 = Color3.new(0.2549019753933, 0.2549019753933, 0.2549019753933), 
                                BorderSizePixel = 0, 
                                Font = 3, 
                                Name = "WindowResizer", 
                                Parent = {
                                    1
                                }, 
                                Position = UDim2.new(1, -300, 0, 0), 
                                Size = UDim2.new(1, 0, 0, 4), 
                                Text = "", 
                                TextColor3 = Color3.new(0, 0, 0), 
                                TextSize = 14
                            }
                        }, 
                        {
                            5, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(0.14117647707462, 0.14117647707462, 0.14117647707462), 
                                BorderSizePixel = 0, 
                                Name = "Line", 
                                Parent = {
                                    4
                                }, 
                                Size = UDim2.new(1, 0, 0, 1)
                            }
                        }
                    });
                    v1455.Frame = v1711;
                    v1711.Position = UDim2.new(1, 10, 0, 0);
                    v1455.WindowResizer = v1711.WindowResizer;
                    v1711.WindowResizer.Parent = nil;
                    v1711.Parent = v1451;
                    v1593(v1710.Resizer, "H", v1454);
                    v1593(v1711.Resizer, "H", v1455);
                    v1452 = Instance.new("ScreenGui");
                    v1452.DisplayOrder = v1126.DisplayOrders.Core;
                    local v1712 = Instance.new("Frame", v1452);
                    v1712.BackgroundColor3 = Color3.fromRGB(0, 170, 255);
                    v1712.BorderSizePixel = 0;
                    v1712.BackgroundTransparency = 0.8;
                    v1712.Name = "Indicator";
                    Instance.new("UICorner", v1712).CornerRadius = UDim.new(0, 10);
                    local v1713 = v1139({
                        {
                            1, 
                            "TextButton", 
                            {
                                AutoButtonColor = false, 
                                BackgroundColor3 = Color3.new(0.20392157137394, 0.20392157137394, 0.20392157137394), 
                                BorderColor3 = Color3.new(0.14117647707462, 0.14117647707462, 0.14117647707462), 
                                BorderMode = 2, 
                                Font = 10, 
                                Name = "LeftToggle", 
                                Position = UDim2.new(0, 0, 0, -36), 
                                Size = UDim2.new(0, 16, 0, 36), 
                                Text = "<", 
                                TextColor3 = Color3.new(1, 1, 1), 
                                TextSize = 14
                            }
                        }
                    });
                    local v1714 = v1713:Clone();
                    v1714.Name = "RightToggle";
                    v1714.Position = UDim2.new(1, -16, 0, -36);
                    v1144.ButtonAnim(v1713, {
                        Mode = 2, 
                        PressColor = Color3.fromRGB(32, 32, 32)
                    });
                    v1144.ButtonAnim(v1714, {
                        Mode = 2, 
                        PressColor = Color3.fromRGB(32, 32, 32)
                    });
                    v1713.MouseButton1Click:Connect(function() --[[ Line: 6336 ]]
                        v1449.ToggleSide("left");
                    end);
                    v1714.MouseButton1Click:Connect(function() --[[ Line: 6340 ]]
                        v1449.ToggleSide("right");
                    end);
                    v1713.Parent = v1451;
                    v1714.Parent = v1451;
                    v1451:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 6347 ]]
                        local v1715 = math.max(300, v1451.AbsoluteSize.X - v1449.FreeWidth);
                        v1454.Width = math.max(v1449.MinWidth, (math.min(v1454.Width, v1715 - v1455.Width)));
                        v1455.Width = math.max(v1449.MinWidth, (math.min(v1455.Width, v1715 - v1454.Width)));
                        for v1716 = 1, #v1453 do
                            v1453[v1716]:MoveInBoundary();
                        end;
                        v1485(true);
                    end);
                    v1451.DisplayOrder = v1457 - 1;
                    v1144.ShowGui(v1451);
                    v1552();
                end;
                local v1717 = {
                    __index = v1448
                };
                v1449.new = function() --[[ Line: 6363 ]]
                    local v1718 = setmetatable({
                        Minimized = false, 
                        Dragging = false, 
                        Resizing = false, 
                        Aligned = false, 
                        Draggable = true, 
                        Resizable = true, 
                        ResizableInternal = true, 
                        Alignable = true, 
                        Closed = true, 
                        SizeX = 300, 
                        SizeY = 300, 
                        MinX = 200, 
                        MinY = 200, 
                        PosX = 0, 
                        PosY = 0, 
                        GuiElems = {}, 
                        Tweens = {}, 
                        Elements = {}, 
                        OnActivate = v1144.Signal.new(), 
                        OnDeactivate = v1144.Signal.new(), 
                        OnMinimize = v1144.Signal.new(), 
                        OnRestore = v1144.Signal.new()
                    }, v1717);
                    v1718.Gui = v1544(v1718);
                    return v1718;
                end;
                return v1449;
            end)();
            v1144.ContextMenu = (function() --[[ Line: 6395 ]]
                local v1719 = {};
                local v1720 = nil;
                local function v1740(v1721) --[[ Line: 6399 ]] --[[ Name: createGui ]]
                    local v1722 = v1139({
                        {
                            1, 
                            "ScreenGui", 
                            {
                                DisplayOrder = 1000000, 
                                Name = "Context", 
                                ZIndexBehavior = 1
                            }
                        }, 
                        {
                            2, 
                            "Frame", 
                            {
                                Active = true, 
                                BackgroundColor3 = Color3.new(0.14117647707462, 0.14117647707462, 0.14117647707462), 
                                BorderColor3 = Color3.new(0.14117647707462, 0.14117647707462, 0.14117647707462), 
                                Name = "Main", 
                                Parent = {
                                    1
                                }, 
                                Position = UDim2.new(0.5, -100, 0.5, -150), 
                                Size = UDim2.new(0, 200, 0, 100)
                            }
                        }, 
                        {
                            3, 
                            "UICorner", 
                            {
                                CornerRadius = UDim.new(0, 4), 
                                Parent = {
                                    2
                                }
                            }
                        }, 
                        {
                            4, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(0.17647059261799, 0.17647059261799, 0.17647059261799), 
                                Name = "Container", 
                                Parent = {
                                    2
                                }, 
                                Position = UDim2.new(0, 1, 0, 1), 
                                Size = UDim2.new(1, -2, 1, -2)
                            }
                        }, 
                        {
                            5, 
                            "UICorner", 
                            {
                                CornerRadius = UDim.new(0, 4), 
                                Parent = {
                                    4
                                }
                            }
                        }, 
                        {
                            6, 
                            "ScrollingFrame", 
                            {
                                Active = true, 
                                BackgroundColor3 = Color3.new(0.20392157137394, 0.20392157137394, 0.20392157137394), 
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                CanvasSize = UDim2.new(0, 0, 0, 0), 
                                Name = "List", 
                                Parent = {
                                    4
                                }, 
                                Position = UDim2.new(0, 2, 0, 2), 
                                ScrollBarImageColor3 = Color3.new(0, 0, 0), 
                                ScrollBarThickness = 4, 
                                Size = UDim2.new(1, -4, 1, -4), 
                                VerticalScrollBarInset = 1
                            }
                        }, 
                        {
                            7, 
                            "UIListLayout", 
                            {
                                Parent = {
                                    6
                                }, 
                                SortOrder = 2
                            }
                        }, 
                        {
                            8, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(0.20392157137394, 0.20392157137394, 0.20392157137394), 
                                BorderSizePixel = 0, 
                                Name = "SearchFrame", 
                                Parent = {
                                    4
                                }, 
                                Size = UDim2.new(1, 0, 0, 24), 
                                Visible = false
                            }
                        }, 
                        {
                            9, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(0.14901961386204, 0.14901961386204, 0.14901961386204), 
                                BorderColor3 = Color3.new(0.1176470592618, 0.1176470592618, 0.1176470592618), 
                                BorderSizePixel = 0, 
                                Name = "SearchContainer", 
                                Parent = {
                                    8
                                }, 
                                Position = UDim2.new(0, 3, 0, 3), 
                                Size = UDim2.new(1, -6, 0, 18)
                            }
                        }, 
                        {
                            10, 
                            "TextBox", 
                            {
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BackgroundTransparency = 1, 
                                Font = 3, 
                                Name = "SearchBox", 
                                Parent = {
                                    9
                                }, 
                                PlaceholderColor3 = Color3.new(0.39215689897537, 0.39215689897537, 0.39215689897537), 
                                PlaceholderText = "Search", 
                                Position = UDim2.new(0, 4, 0, 0), 
                                Size = UDim2.new(1, -8, 0, 18), 
                                Text = "", 
                                TextColor3 = Color3.new(1, 1, 1), 
                                TextSize = 14, 
                                TextXAlignment = 0
                            }
                        }, 
                        {
                            11, 
                            "UICorner", 
                            {
                                CornerRadius = UDim.new(0, 2), 
                                Parent = {
                                    9
                                }
                            }
                        }, 
                        {
                            12, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(0.14117647707462, 0.14117647707462, 0.14117647707462), 
                                BorderSizePixel = 0, 
                                Name = "Line", 
                                Parent = {
                                    8
                                }, 
                                Position = UDim2.new(0, 0, 1, 0), 
                                Size = UDim2.new(1, 0, 0, 1)
                            }
                        }, 
                        {
                            13, 
                            "TextButton", 
                            {
                                AutoButtonColor = false, 
                                BackgroundColor3 = Color3.new(0.20392157137394, 0.20392157137394, 0.20392157137394), 
                                BackgroundTransparency = 1, 
                                BorderColor3 = Color3.new(0.33725491166115, 0.49019610881805, 0.73725491762161), 
                                BorderSizePixel = 0, 
                                Font = 3, 
                                Name = "Entry", 
                                Parent = {
                                    1
                                }, 
                                Size = UDim2.new(1, 0, 0, 22), 
                                Text = "", 
                                TextSize = 14, 
                                Visible = false
                            }
                        }, 
                        {
                            14, 
                            "TextLabel", 
                            {
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                Font = 3, 
                                Name = "EntryName", 
                                Parent = {
                                    13
                                }, 
                                Position = UDim2.new(0, 24, 0, 0), 
                                Size = UDim2.new(1, -24, 1, 0), 
                                Text = "Duplicate", 
                                TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                TextSize = 14, 
                                TextXAlignment = 0
                            }
                        }, 
                        {
                            15, 
                            "TextLabel", 
                            {
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BackgroundTransparency = 1, 
                                Font = 3, 
                                Name = "Shortcut", 
                                Parent = {
                                    13
                                }, 
                                Position = UDim2.new(0, 24, 0, 0), 
                                Size = UDim2.new(1, -30, 1, 0), 
                                Text = "Ctrl+D", 
                                TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                TextSize = 14, 
                                TextXAlignment = 1
                            }
                        }, 
                        {
                            16, 
                            "ImageLabel", 
                            {
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BackgroundTransparency = 1, 
                                ImageRectOffset = Vector2.new(304, 0), 
                                ImageRectSize = Vector2.new(16, 16), 
                                Name = "Icon", 
                                Parent = {
                                    13
                                }, 
                                Position = UDim2.new(0, 2, 0, 3), 
                                ScaleType = 4, 
                                Size = UDim2.new(0, 16, 0, 16)
                            }
                        }, 
                        {
                            17, 
                            "UICorner", 
                            {
                                CornerRadius = UDim.new(0, 4), 
                                Parent = {
                                    13
                                }
                            }
                        }, 
                        {
                            18, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(0.21568629145622, 0.21568629145622, 0.21568629145622), 
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                Name = "Divider", 
                                Parent = {
                                    1
                                }, 
                                Position = UDim2.new(0, 0, 0, 20), 
                                Size = UDim2.new(1, 0, 0, 7), 
                                Visible = false
                            }
                        }, 
                        {
                            19, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(0.20392157137394, 0.20392157137394, 0.20392157137394), 
                                BorderSizePixel = 0, 
                                Name = "Line", 
                                Parent = {
                                    18
                                }, 
                                Position = UDim2.new(0, 0, 0.5, 0), 
                                Size = UDim2.new(1, 0, 0, 1)
                            }
                        }, 
                        {
                            20, 
                            "TextLabel", 
                            {
                                AnchorPoint = Vector2.new(0, 0.5), 
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                Font = 3, 
                                Name = "DividerName", 
                                Parent = {
                                    18
                                }, 
                                Position = UDim2.new(0, 2, 0.5, 0), 
                                Size = UDim2.new(1, -4, 1, 0), 
                                Text = "Objects", 
                                TextColor3 = Color3.new(1, 1, 1), 
                                TextSize = 14, 
                                TextTransparency = 0.60000002384186, 
                                TextXAlignment = 0, 
                                Visible = false
                            }
                        }
                    });
                    v1721.GuiElems.Main = v1722.Main;
                    v1721.GuiElems.List = v1722.Main.Container.List;
                    v1721.GuiElems.Entry = v1722.Entry;
                    v1721.GuiElems.Divider = v1722.Divider;
                    v1721.GuiElems.SearchFrame = v1722.Main.Container.SearchFrame;
                    v1721.GuiElems.SearchBar = v1721.GuiElems.SearchFrame.SearchContainer.SearchBox;
                    v1144.ViewportTextBox.convert(v1721.GuiElems.SearchBar);
                    v1721.GuiElems.SearchBar:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 6430 ]]
                        local l_lower_5 = string.lower;
                        local l_find_6 = string.find;
                        local v1725 = l_lower_5(v1721.GuiElems.SearchBar.Text);
                        local l_Items_0 = v1721.Items;
                        local l_ItemToEntryMap_0 = v1721.ItemToEntryMap;
                        if v1725 ~= "" then
                            local v1728 = {};
                            local v1729 = 1;
                            for v1730 = 1, #l_Items_0 do
                                local v1731 = l_Items_0[v1730];
                                local v1732 = l_ItemToEntryMap_0[v1731];
                                if v1732 then
                                    if not v1731.Divider and l_find_6(l_lower_5(v1731.Name), v1725, 1, true) then
                                        v1728[v1729] = v1731;
                                        v1729 = v1729 + 1;
                                    else
                                        v1732.Visible = false;
                                    end;
                                end;
                            end;
                            table.sort(v1728, function(v1733, v1734) --[[ Line: 6451 ]]
                                return v1733.Name < v1734.Name;
                            end);
                            for v1735 = 1, #v1728 do
                                local v1736 = l_ItemToEntryMap_0[v1728[v1735]];
                                v1736.LayoutOrder = v1735;
                                v1736.Visible = true;
                            end;
                        else
                            for v1737 = 1, #l_Items_0 do
                                local v1738 = l_ItemToEntryMap_0[l_Items_0[v1737]];
                                if v1738 then
                                    v1738.LayoutOrder = v1737;
                                    v1738.Visible = true;
                                end;
                            end;
                        end;
                        local v1739 = v1721.GuiElems.List.UIListLayout.AbsoluteContentSize.Y + 6;
                        v1721.GuiElems.List.CanvasSize = UDim2.new(0, 0, 0, v1739 - 6);
                    end);
                    return v1722;
                end;
                v1719.Add = function(v1741, v1742) --[[ Line: 6471 ]]
                    local v1743 = {
                        Name = v1742.Name or "Item", 
                        Icon = v1742.Icon or "", 
                        Shortcut = v1742.Shortcut or "", 
                        OnClick = v1742.OnClick, 
                        OnHover = v1742.OnHover, 
                        Disabled = v1742.Disabled or false, 
                        DisabledIcon = v1742.DisabledIcon or "", 
                        IconMap = v1742.IconMap, 
                        OnRightClick = v1742.OnRightClick
                    };
                    if v1741.QueuedDivider then
                        v1741:AddDivider(v1741.QueuedDividerText and #v1741.QueuedDividerText > 0 and v1741.QueuedDividerText);
                    end;
                    v1741.Items[#v1741.Items + 1] = v1743;
                    v1741.Updated = nil;
                end;
                v1719.AddRegistered = function(v1744, v1745, v1746) --[[ Line: 6491 ]]
                    if not v1744.Registered[v1745] then
                        error(v1745 .. " is not registered");
                    end;
                    if v1744.QueuedDivider then
                        v1744:AddDivider(v1744.QueuedDividerText and #v1744.QueuedDividerText > 0 and v1744.QueuedDividerText);
                    end;
                    v1744.Registered[v1745].Disabled = v1746;
                    v1744.Items[#v1744.Items + 1] = v1744.Registered[v1745];
                    v1744.Updated = nil;
                end;
                v1719.Register = function(v1747, v1748, v1749) --[[ Line: 6503 ]]
                    v1747.Registered[v1748] = {
                        Name = v1749.Name or "Item", 
                        Icon = v1749.Icon or "", 
                        Shortcut = v1749.Shortcut or "", 
                        OnClick = v1749.OnClick, 
                        OnHover = v1749.OnHover, 
                        DisabledIcon = v1749.DisabledIcon or "", 
                        IconMap = v1749.IconMap, 
                        OnRightClick = v1749.OnRightClick
                    };
                end;
                v1719.UnRegister = function(v1750, v1751) --[[ Line: 6516 ]]
                    v1750.Registered[v1751] = nil;
                end;
                v1719.AddDivider = function(v1752, v1753) --[[ Line: 6520 ]]
                    v1752.QueuedDivider = false;
                    local v1754 = v1753 and v1137.TextService:GetTextSize(v1753, 14, Enum.Font.SourceSans, Vector2.new(999999999, 20)).X or nil;
                    table.insert(v1752.Items, {
                        Divider = true, 
                        Text = v1753, 
                        TextSize = v1754 and v1754 + 4
                    });
                    v1752.Updated = nil;
                end;
                v1719.QueueDivider = function(v1755, v1756) --[[ Line: 6527 ]]
                    v1755.QueuedDivider = true;
                    v1755.QueuedDividerText = v1756 or "";
                end;
                v1719.Clear = function(v1757) --[[ Line: 6532 ]]
                    v1757.Items = {};
                    v1757.Updated = nil;
                end;
                v1719.Refresh = function(v1758) --[[ Line: 6537 ]]
                    for __, v1760 in pairs(v1758.GuiElems.List:GetChildren()) do
                        if not v1760:IsA("UIListLayout") then
                            v1760:Destroy();
                        end;
                    end;
                    local v1761 = {};
                    v1758.ItemToEntryMap = v1761;
                    local l_Divider_0 = v1758.GuiElems.Divider;
                    local l_List_27 = v1758.GuiElems.List;
                    local l_Entry_0 = v1758.GuiElems.Entry;
                    local l_Items_1 = v1758.Items;
                    for v1766 = 1, #l_Items_1 do
                        local v1767 = l_Items_1[v1766];
                        if v1767.Divider then
                            local v1768 = l_Divider_0:Clone();
                            v1768.Line.BackgroundColor3 = v1758.Theme.DividerColor;
                            if v1767.Text then
                                v1768.Size = UDim2.new(1, 0, 0, 20);
                                v1768.Line.Position = UDim2.new(0, v1767.TextSize, 0.5, 0);
                                v1768.Line.Size = UDim2.new(1, -v1767.TextSize, 0, 1);
                                v1768.DividerName.TextColor3 = v1758.Theme.TextColor;
                                v1768.DividerName.Text = v1767.Text;
                                v1768.DividerName.Visible = true;
                            end;
                            v1768.Visible = true;
                            v1761[v1767] = v1768;
                            v1768.Parent = l_List_27;
                        else
                            local v1769 = l_Entry_0:Clone();
                            v1769.BackgroundColor3 = v1758.Theme.HighlightColor;
                            v1769.EntryName.TextColor3 = v1758.Theme.TextColor;
                            v1769.EntryName.Text = v1767.Name;
                            v1769.Shortcut.Text = v1767.Shortcut;
                            if v1767.Disabled then
                                v1769.EntryName.TextColor3 = Color3.new(0.5882352941176471, 0.5882352941176471, 0.5882352941176471);
                                v1769.Shortcut.TextColor3 = Color3.new(0.5882352941176471, 0.5882352941176471, 0.5882352941176471);
                            end;
                            if v1758.Iconless then
                                v1769.EntryName.Position = UDim2.new(0, 2, 0, 0);
                                v1769.EntryName.Size = UDim2.new(1, -4, 0, 20);
                                v1769.Icon.Visible = false;
                            else
                                local v1770 = v1767.Disabled and v1767.DisabledIcon or v1767.Icon;
                                if v1767.IconMap then
                                    if type(v1770) == "number" then
                                        v1767.IconMap:Display(v1769.Icon, v1770);
                                    elseif type(v1770) == "string" then
                                        v1767.IconMap:DisplayByKey(v1769.Icon, v1770);
                                    end;
                                elseif type(v1770) == "string" then
                                    v1769.Icon.Image = v1770;
                                end;
                            end;
                            if not v1767.Disabled then
                                if v1767.OnClick then
                                    v1769.MouseButton1Click:Connect(function() --[[ Line: 6597 ]]
                                        v1767.OnClick(v1767.Name);
                                        if not v1767.NoHide then
                                            v1758:Hide();
                                        end;
                                    end);
                                end;
                                if v1767.OnRightClick then
                                    v1769.MouseButton2Click:Connect(function() --[[ Line: 6606 ]]
                                        v1767.OnRightClick(v1767.Name);
                                        if not v1767.NoHide then
                                            v1758:Hide();
                                        end;
                                    end);
                                end;
                            end;
                            v1769.InputBegan:Connect(function(v1771) --[[ Line: 6615 ]]
                                if v1771.UserInputType == Enum.UserInputType.MouseMovement then
                                    v1769.BackgroundTransparency = 0;
                                end;
                            end);
                            v1769.InputEnded:Connect(function(v1772) --[[ Line: 6621 ]]
                                if v1772.UserInputType == Enum.UserInputType.MouseMovement then
                                    v1769.BackgroundTransparency = 1;
                                end;
                            end);
                            v1769.Visible = true;
                            v1761[v1767] = v1769;
                            v1769.Parent = l_List_27;
                        end;
                    end;
                    v1758.Updated = true;
                end;
                v1719.Show = function(v1773, v1774, v1775) --[[ Line: 6635 ]]
                    local l_GuiElems_2 = v1773.GuiElems;
                    l_GuiElems_2.SearchFrame.Visible = v1773.SearchEnabled;
                    l_GuiElems_2.List.Position = UDim2.new(0, 2, 0, 2 + (v1773.SearchEnabled and 24 or 0));
                    l_GuiElems_2.List.Size = UDim2.new(1, -4, 1, -4 - (v1773.SearchEnabled and 24 or 0));
                    if v1773.SearchEnabled and v1773.ClearSearchOnShow then
                        l_GuiElems_2.SearchBar.Text = "";
                    end;
                    v1773.GuiElems.List.CanvasPosition = Vector2.new(0, 0);
                    if not v1773.Updated then
                        v1773:Refresh();
                    end;
                    local v1777 = false;
                    local v1778 = v1774 or v1720.X;
                    local v1779 = v1775 or v1720.Y;
                    local l_ViewSizeX_0 = v1720.ViewSizeX;
                    local l_ViewSizeY_0 = v1720.ViewSizeY;
                    if l_ViewSizeX_0 < v1778 + v1773.Width then
                        v1778 = v1773.ReverseX and v1778 - v1773.Width or l_ViewSizeX_0 - v1773.Width;
                    end;
                    l_GuiElems_2.Main.Position = UDim2.new(0, v1778, 0, v1779);
                    l_GuiElems_2.Main.Size = UDim2.new(0, v1773.Width, 0, 0);
                    v1773.Gui.DisplayOrder = v1126.DisplayOrders.Menu;
                    v1144.ShowGui(v1773.Gui);
                    local v1782 = l_GuiElems_2.List.UIListLayout.AbsoluteContentSize.Y + 6;
                    if v1773.MaxHeight and v1773.MaxHeight < v1782 then
                        l_GuiElems_2.List.CanvasSize = UDim2.new(0, 0, 0, v1782 - 6);
                        v1782 = v1773.MaxHeight;
                    else
                        l_GuiElems_2.List.CanvasSize = UDim2.new(0, 0, 0, 0);
                    end;
                    if l_ViewSizeY_0 < v1779 + v1782 then
                        v1777 = true;
                    end;
                    local v1783 = nil;
                    if v1773.CloseEvent then
                        v1773.CloseEvent:Disconnect();
                    end;
                    v1773.CloseEvent = v1137.UserInputService.InputBegan:Connect(function(v1784) --[[ Line: 6675 ]]
                        if not v1783 or v1784.UserInputType ~= Enum.UserInputType.MouseButton1 then
                            return;
                        else
                            if not v1144.CheckMouseInGui(l_GuiElems_2.Main) then
                                v1773.CloseEvent:Disconnect();
                                v1773:Hide();
                            end;
                            return;
                        end;
                    end);
                    if v1777 then
                        l_GuiElems_2.Main.Position = UDim2.new(0, v1778, 0, v1779 - (v1773.ReverseYOffset or 0));
                        local v1785 = v1779 - v1782 - (v1773.ReverseYOffset or 0);
                        local v1786 = v1785 >= 0 and v1785 or 0;
                        l_GuiElems_2.Main:TweenSizeAndPosition(UDim2.new(0, v1773.Width, 0, v1782), UDim2.new(0, v1778, 0, v1786), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.2, true);
                    else
                        l_GuiElems_2.Main:TweenSize(UDim2.new(0, v1773.Width, 0, v1782), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.2, true);
                    end;
                    v1144.FastWait();
                    if v1773.SearchEnabled and v1773.FocusSearchOnShow then
                        l_GuiElems_2.SearchBar:CaptureFocus();
                    end;
                    v1783 = true;
                end;
                v1719.Hide = function(v1787) --[[ Line: 6700 ]]
                    v1787.Gui.Parent = nil;
                end;
                v1719.ApplyTheme = function(v1788, v1789) --[[ Line: 6704 ]]
                    local l_Theme_0 = v1788.Theme;
                    l_Theme_0.ContentColor = v1789.ContentColor or v1129.Theme.Menu;
                    l_Theme_0.OutlineColor = v1789.OutlineColor or v1129.Theme.Menu;
                    l_Theme_0.DividerColor = v1789.DividerColor or v1129.Theme.Outline2;
                    l_Theme_0.TextColor = v1789.TextColor or v1129.Theme.Text;
                    l_Theme_0.HighlightColor = v1789.HighlightColor or v1129.Theme.Main1;
                    v1788.GuiElems.Main.BackgroundColor3 = l_Theme_0.OutlineColor;
                    v1788.GuiElems.Main.Container.BackgroundColor3 = l_Theme_0.ContentColor;
                end;
                local v1791 = {
                    __index = v1719
                };
                return {
                    new = function() --[[ Line: 6717 ]] --[[ Name: new ]]
                        if not v1720 then
                            v1720 = v1126.Mouse or v1137.Players.LocalPlayer:GetMouse();
                        end;
                        local v1792 = setmetatable({
                            Width = 200, 
                            MaxHeight = nil, 
                            Iconless = false, 
                            SearchEnabled = false, 
                            ClearSearchOnShow = true, 
                            FocusSearchOnShow = true, 
                            Updated = false, 
                            QueuedDivider = false, 
                            QueuedDividerText = "", 
                            Items = {}, 
                            Registered = {}, 
                            GuiElems = {}, 
                            Theme = {}
                        }, v1791);
                        v1792.Gui = v1740(v1792);
                        v1792:ApplyTheme({});
                        return v1792;
                    end
                };
            end)();
            v1144.CodeFrame = (function() --[[ Line: 6743 ]]
                local v1793 = {};
                local v1794 = {
                    [1] = "String", 
                    [2] = "String", 
                    [3] = "String", 
                    [4] = "Comment", 
                    [5] = "Operator", 
                    [6] = "Number", 
                    [7] = "Keyword", 
                    [8] = "BuiltIn", 
                    [9] = "LocalMethod", 
                    [10] = "LocalProperty", 
                    [11] = "Nil", 
                    [12] = "Bool", 
                    [13] = "Function", 
                    [14] = "Local", 
                    [15] = "Self", 
                    [16] = "FunctionName", 
                    [17] = "Bracket"
                };
                local v1795 = {
                    ["nil"] = 11, 
                    ["true"] = 12, 
                    ["false"] = 12, 
                    ["function"] = 13, 
                    ["local"] = 14, 
                    self = 15
                };
                local v1796 = {
                    ["and"] = true, 
                    ["break"] = true, 
                    ["do"] = true, 
                    ["else"] = true, 
                    ["elseif"] = true, 
                    ["end"] = true, 
                    ["false"] = true, 
                    ["for"] = true, 
                    ["function"] = true, 
                    ["if"] = true, 
                    ["in"] = true, 
                    ["local"] = true, 
                    ["nil"] = true, 
                    ["not"] = true, 
                    ["or"] = true, 
                    ["repeat"] = true, 
                    ["return"] = true, 
                    ["then"] = true, 
                    ["true"] = true, 
                    ["until"] = true, 
                    ["while"] = true, 
                    plugin = true
                };
                local v1797 = {
                    delay = true, 
                    elapsedTime = true, 
                    require = true, 
                    spawn = true, 
                    tick = true, 
                    time = true, 
                    typeof = true, 
                    UserSettings = true, 
                    wait = true, 
                    warn = true, 
                    game = true, 
                    shared = true, 
                    script = true, 
                    workspace = true, 
                    assert = true, 
                    collectgarbage = true, 
                    error = true, 
                    getfenv = true, 
                    getmetatable = true, 
                    ipairs = true, 
                    loadstring = true, 
                    newproxy = true, 
                    next = true, 
                    pairs = true, 
                    pcall = true, 
                    print = true, 
                    rawequal = true, 
                    rawget = true, 
                    rawset = true, 
                    select = true, 
                    setfenv = true, 
                    setmetatable = true, 
                    tonumber = true, 
                    tostring = true, 
                    type = true, 
                    unpack = true, 
                    xpcall = true, 
                    _G = true, 
                    _VERSION = true, 
                    coroutine = true, 
                    debug = true, 
                    math = true, 
                    os = true, 
                    string = true, 
                    table = true, 
                    bit32 = true, 
                    utf8 = true, 
                    Axes = true, 
                    BrickColor = true, 
                    CFrame = true, 
                    Color3 = true, 
                    ColorSequence = true, 
                    ColorSequenceKeypoint = true, 
                    DockWidgetPluginGuiInfo = true, 
                    Enum = true, 
                    Faces = true, 
                    Instance = true, 
                    NumberRange = true, 
                    NumberSequence = true, 
                    NumberSequenceKeypoint = true, 
                    PathWaypoint = true, 
                    PhysicalProperties = true, 
                    Random = true, 
                    Ray = true, 
                    Rect = true, 
                    Region3 = true, 
                    Region3int16 = true, 
                    TweenInfo = true, 
                    UDim = true, 
                    UDim2 = true, 
                    Vector2 = true, 
                    Vector2int16 = true, 
                    Vector3 = true, 
                    Vector3int16 = true
                };
                local v1798 = false;
                local v1799 = {
                    ["'"] = "&apos;", 
                    ["\""] = "&quot;", 
                    ["<"] = "&lt;", 
                    [">"] = "&gt;", 
                    ["&"] = "&amp;"
                };
                local v1800 = (" %s%s "):format("\205", "\205");
                local v1801 = {
                    [("[^%s] %s"):format("\205", "\205")] = 0, 
                    [(" %s%s"):format("\205", "\205")] = -1, 
                    [("%s%s "):format("\205", "\205")] = 2, 
                    [("%s [^%s]"):format("\205", "\205")] = 1
                };
                local l_TweenService_0 = v1137.TweenService;
                local v1803 = {};
                local function v1816() --[[ Line: 6900 ]] --[[ Name: initBuiltIn ]]
                    local v1804 = getfenv();
                    local l_type_1 = type;
                    local l_tostring_2 = tostring;
                    for v1807, __ in next, v1797 do
                        local v1809 = v1804[v1807];
                        if l_type_1(v1809) == "table" then
                            local v1810 = {};
                            for v1811, __ in next, v1809 do
                                v1810[v1811] = true;
                            end;
                            v1797[v1807] = v1810;
                        end;
                    end;
                    local v1813 = {};
                    local l_Enum_Enums_0 = Enum:GetEnums();
                    for v1815 = 1, #l_Enum_Enums_0 do
                        v1813[l_tostring_2(l_Enum_Enums_0[v1815])] = true;
                    end;
                    v1797.Enum = v1813;
                    v1798 = true;
                end;
                local function v1820(v1817) --[[ Line: 6925 ]] --[[ Name: setupEditBox ]]
                    local l_EditBox_0 = v1817.GuiElems.EditBox;
                    l_EditBox_0.Focused:Connect(function() --[[ Line: 6928 ]]
                        v1817:ConnectEditBoxEvent();
                        v1817.Editing = true;
                    end);
                    l_EditBox_0.FocusLost:Connect(function() --[[ Line: 6933 ]]
                        v1817:DisconnectEditBoxEvent();
                        v1817.Editing = false;
                    end);
                    l_EditBox_0:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 6938 ]]
                        local l_Text_0 = l_EditBox_0.Text;
                        if #l_Text_0 == 0 or v1817.EditBoxCopying then
                            return;
                        else
                            l_EditBox_0.Text = "";
                            v1817:AppendText(l_Text_0);
                            return;
                        end;
                    end);
                end;
                local function v1855(v1821) --[[ Line: 6946 ]] --[[ Name: setupMouseSelection ]]
                    local l_v1138_Mouse_2 = v1138:GetMouse();
                    local l_LinesFrame_0 = v1821.GuiElems.LinesFrame;
                    local l_Lines_0 = v1821.Lines;
                    l_LinesFrame_0.InputBegan:Connect(function(v1825) --[[ Line: 6951 ]]
                        if v1825.UserInputType == Enum.UserInputType.MouseButton1 then
                            local v1826 = math.ceil(v1821.FontSize / 2);
                            local l_FontSize_0 = v1821.FontSize;
                            local v1828 = l_v1138_Mouse_2.X - l_LinesFrame_0.AbsolutePosition.X;
                            local v1829 = l_v1138_Mouse_2.Y - l_LinesFrame_0.AbsolutePosition.Y;
                            local v1830 = math.round(v1828 / v1826) + v1821.ViewX;
                            local v1831 = math.floor(v1829 / l_FontSize_0) + v1821.ViewY;
                            local v1832 = nil;
                            local v1833 = nil;
                            local v1834 = nil;
                            local v1835 = 0;
                            local v1836 = 0;
                            v1831 = math.min(#l_Lines_0 - 1, v1831);
                            v1830 = math.min(#(l_Lines_0[v1831 + 1] or ""), v1830 + v1821:TabAdjust(v1830, v1831));
                            v1821.SelectionRange = {
                                {
                                    -1, 
                                    -1
                                }, 
                                {
                                    -1, 
                                    -1
                                }
                            };
                            v1821:MoveCursor(v1830, v1831);
                            v1821.FloatCursorX = v1830;
                            do
                                local l_v1830_0, l_v1831_0, l_v1832_0, l_v1833_0, l_v1834_0, l_v1835_0, l_v1836_0 = v1830, v1831, v1832, v1833, v1834, v1835, v1836;
                                local function v1848() --[[ Line: 6969 ]] --[[ Name: updateSelection ]]
                                    local v1844 = l_v1138_Mouse_2.X - l_LinesFrame_0.AbsolutePosition.X;
                                    local v1845 = l_v1138_Mouse_2.Y - l_LinesFrame_0.AbsolutePosition.Y;
                                    local v1846 = math.max(0, math.round(v1844 / v1826) + v1821.ViewX);
                                    local v1847 = math.max(0, math.floor(v1845 / l_FontSize_0) + v1821.ViewY);
                                    v1847 = math.min(#l_Lines_0 - 1, v1847);
                                    v1846 = math.min(#(l_Lines_0[v1847 + 1] or ""), v1846 + v1821:TabAdjust(v1846, v1847));
                                    if v1847 < l_v1831_0 or v1847 == l_v1831_0 and v1846 < l_v1830_0 then
                                        v1821.SelectionRange = {
                                            {
                                                v1846, 
                                                v1847
                                            }, 
                                            {
                                                l_v1830_0, 
                                                l_v1831_0
                                            }
                                        };
                                    else
                                        v1821.SelectionRange = {
                                            {
                                                l_v1830_0, 
                                                l_v1831_0
                                            }, 
                                            {
                                                v1846, 
                                                v1847
                                            }
                                        };
                                    end;
                                    v1821:MoveCursor(v1846, v1847);
                                    v1821.FloatCursorX = v1846;
                                    v1821:Refresh();
                                end;
                                l_v1832_0 = v1137.UserInputService.InputEnded:Connect(function(v1849) --[[ Line: 6990 ]]
                                    if v1849.UserInputType == Enum.UserInputType.MouseButton1 then
                                        l_v1832_0:Disconnect();
                                        l_v1833_0:Disconnect();
                                        l_v1834_0:Disconnect();
                                        v1821:SetCopyableSelection();
                                    end;
                                end);
                                l_v1833_0 = v1137.UserInputService.InputChanged:Connect(function(v1850) --[[ Line: 7000 ]]
                                    if v1850.UserInputType == Enum.UserInputType.MouseMovement then
                                        local v1851 = l_v1138_Mouse_2.Y - l_LinesFrame_0.AbsolutePosition.Y;
                                        local v1852 = l_v1138_Mouse_2.Y - l_LinesFrame_0.AbsolutePosition.Y - l_LinesFrame_0.AbsoluteSize.Y;
                                        local v1853 = l_v1138_Mouse_2.X - l_LinesFrame_0.AbsolutePosition.X;
                                        local v1854 = l_v1138_Mouse_2.X - l_LinesFrame_0.AbsolutePosition.X - l_LinesFrame_0.AbsoluteSize.X;
                                        l_v1835_0 = 0;
                                        l_v1836_0 = 0;
                                        if v1852 > 0 then
                                            l_v1835_0 = math.floor(v1852 * 0.05) + 1;
                                        elseif v1851 < 0 then
                                            l_v1835_0 = math.ceil(v1851 * 0.05) - 1;
                                        end;
                                        if v1854 > 0 then
                                            l_v1836_0 = math.floor(v1854 * 0.05) + 1;
                                        elseif v1853 < 0 then
                                            l_v1836_0 = math.ceil(v1853 * 0.05) - 1;
                                        end;
                                        v1848();
                                    end;
                                end);
                                l_v1834_0 = v2(game:GetService("RunService")).RenderStepped:Connect(function() --[[ Line: 7022 ]]
                                    if l_v1835_0 ~= 0 or l_v1836_0 ~= 0 then
                                        v1821:ScrollDelta(l_v1836_0, l_v1835_0);
                                        v1848();
                                    end;
                                end);
                                v1821:Refresh();
                            end;
                        end;
                    end);
                end;
                local function v1864(v1856) --[[ Line: 7034 ]] --[[ Name: makeFrame ]]
                    local v1857 = v1139({
                        {
                            1, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(0.15686275064945, 0.15686275064945, 0.15686275064945), 
                                BorderSizePixel = 0, 
                                Position = UDim2.new(0.5, -300, 0.5, -200), 
                                Size = UDim2.new(0, 600, 0, 400)
                            }
                        }
                    });
                    local v1858 = {};
                    local l_Frame_0 = Instance.new("Frame");
                    l_Frame_0.Name = "Lines";
                    l_Frame_0.BackgroundTransparency = 1;
                    l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
                    l_Frame_0.ClipsDescendants = true;
                    l_Frame_0.Parent = v1857;
                    local l_TextLabel_0 = Instance.new("TextLabel");
                    l_TextLabel_0.Name = "LineNumbers";
                    l_TextLabel_0.BackgroundTransparency = 1;
                    l_TextLabel_0.Font = Enum.Font.Code;
                    l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Right;
                    l_TextLabel_0.TextYAlignment = Enum.TextYAlignment.Top;
                    l_TextLabel_0.ClipsDescendants = true;
                    l_TextLabel_0.RichText = true;
                    l_TextLabel_0.Parent = v1857;
                    local l_Frame_1 = Instance.new("Frame");
                    l_Frame_1.Name = "Cursor";
                    l_Frame_1.BackgroundColor3 = Color3.fromRGB(220, 220, 220);
                    l_Frame_1.BorderSizePixel = 0;
                    l_Frame_1.Parent = v1857;
                    local l_TextBox_0 = Instance.new("TextBox");
                    l_TextBox_0.Name = "EditBox";
                    l_TextBox_0.MultiLine = true;
                    l_TextBox_0.Visible = false;
                    l_TextBox_0.Parent = v1857;
                    v1803.Invis = l_TweenService_0:Create(l_Frame_1, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                        BackgroundTransparency = 1
                    });
                    v1803.Vis = l_TweenService_0:Create(l_Frame_1, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                        BackgroundTransparency = 0
                    });
                    v1858.LinesFrame = l_Frame_0;
                    v1858.LineNumbersLabel = l_TextLabel_0;
                    v1858.Cursor = l_Frame_1;
                    v1858.EditBox = l_TextBox_0;
                    v1858.ScrollCorner = v1139({
                        {
                            1, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(0.15686275064945, 0.15686275064945, 0.15686275064945), 
                                BorderSizePixel = 0, 
                                Name = "ScrollCorner", 
                                Position = UDim2.new(1, -16, 1, -16), 
                                Size = UDim2.new(0, 16, 0, 16), 
                                Visible = false
                            }
                        }
                    });
                    v1858.ScrollCorner.Parent = v1857;
                    l_Frame_0.InputBegan:Connect(function(v1863) --[[ Line: 7079 ]]
                        if v1863.UserInputType == Enum.UserInputType.MouseButton1 then
                            v1856:SetEditing(true, v1863);
                        end;
                    end);
                    v1856.Frame = v1857;
                    v1856.Gui = v1857;
                    v1856.GuiElems = v1858;
                    v1820(v1856);
                    v1855(v1856);
                    return v1857;
                end;
                v1793.GetSelectionText = function(v1865) --[[ Line: 7094 ]]
                    if not v1865:IsValidRange() then
                        return "";
                    else
                        local l_SelectionRange_0 = v1865.SelectionRange;
                        local v1867 = l_SelectionRange_0[1][1];
                        local v1868 = l_SelectionRange_0[1][2];
                        local v1869 = l_SelectionRange_0[2][1];
                        local v1870 = l_SelectionRange_0[2][2];
                        local v1871 = v1870 - v1868;
                        local l_Lines_1 = v1865.Lines;
                        if not l_Lines_1[v1868 + 1] or not l_Lines_1[v1870 + 1] then
                            return "";
                        elseif v1871 == 0 then
                            return v1865:ConvertText(l_Lines_1[v1868 + 1]:sub(v1867 + 1, v1869), false);
                        else
                            local v1873 = l_Lines_1[v1868 + 1]:sub(v1867 + 1);
                            local v1874 = l_Lines_1[v1870 + 1]:sub(1, v1869);
                            local v1875 = v1873 .. "\n";
                            for v1876 = v1868 + 1, v1870 - 1 do
                                v1875 = v1875 .. l_Lines_1[v1876 + 1] .. "\n";
                            end;
                            return v1865:ConvertText(v1875 .. v1874, false);
                        end;
                    end;
                end;
                v1793.SetCopyableSelection = function(v1877) --[[ Line: 7121 ]]
                    local l_v1877_SelectionText_0 = v1877:GetSelectionText();
                    local l_EditBox_1 = v1877.GuiElems.EditBox;
                    v1877.EditBoxCopying = true;
                    l_EditBox_1.Text = l_v1877_SelectionText_0;
                    l_EditBox_1.SelectionStart = 1;
                    l_EditBox_1.CursorPosition = #l_EditBox_1.Text + 1;
                    v1877.EditBoxCopying = false;
                end;
                v1793.ConnectEditBoxEvent = function(v1880) --[[ Line: 7132 ]]
                    if v1880.EditBoxEvent then
                        v1880.EditBoxEvent:Disconnect();
                    end;
                    v1880.EditBoxEvent = v1137.UserInputService.InputBegan:Connect(function(v1881) --[[ Line: 7137 ]]
                        if v1881.UserInputType ~= Enum.UserInputType.Keyboard then
                            return;
                        else
                            local l_KeyCode_0 = Enum.KeyCode;
                            local l_KeyCode_1 = v1881.KeyCode;
                            local function v1889(v1884, v1885) --[[ Line: 7143 ]] --[[ Name: setupMove ]]
                                local v1886 = nil;
                                local v1887 = nil;
                                v1886 = v1137.UserInputService.InputEnded:Connect(function(v1888) --[[ Line: 7145 ]]
                                    if v1888.KeyCode ~= v1884 then
                                        return;
                                    else
                                        v1886:Disconnect();
                                        v1887 = true;
                                        return;
                                    end;
                                end);
                                v1885();
                                v1144.FastWait(0.5);
                                while not v1887 do
                                    v1885();
                                    v1144.FastWait(0.03);
                                end;
                            end;
                            if l_KeyCode_1 == l_KeyCode_0.Down then
                                v1889(l_KeyCode_0.Down, function() --[[ Line: 7156 ]]
                                    v1880.CursorX = v1880.FloatCursorX;
                                    v1880.CursorY = v1880.CursorY + 1;
                                    v1880:UpdateCursor();
                                    v1880:JumpToCursor();
                                end);
                                return;
                            elseif l_KeyCode_1 == l_KeyCode_0.Up then
                                v1889(l_KeyCode_0.Up, function() --[[ Line: 7163 ]]
                                    v1880.CursorX = v1880.FloatCursorX;
                                    v1880.CursorY = v1880.CursorY - 1;
                                    v1880:UpdateCursor();
                                    v1880:JumpToCursor();
                                end);
                                return;
                            elseif l_KeyCode_1 == l_KeyCode_0.Left then
                                v1889(l_KeyCode_0.Left, function() --[[ Line: 7170 ]]
                                    local v1890 = v1880.Lines[v1880.CursorY + 1] or "";
                                    v1880.CursorX = v1880.CursorX - 1 - (v1890:sub(v1880.CursorX - 3, v1880.CursorX) == v1800 and 3 or 0);
                                    if v1880.CursorX < 0 then
                                        v1880.CursorY = v1880.CursorY - 1;
                                        v1880.CursorX = #(v1880.Lines[v1880.CursorY + 1] or "");
                                    end;
                                    v1880.FloatCursorX = v1880.CursorX;
                                    v1880:UpdateCursor();
                                    v1880:JumpToCursor();
                                end);
                                return;
                            elseif l_KeyCode_1 == l_KeyCode_0.Right then
                                v1889(l_KeyCode_0.Right, function() --[[ Line: 7183 ]]
                                    local v1891 = v1880.Lines[v1880.CursorY + 1] or "";
                                    v1880.CursorX = v1880.CursorX + 1 + (v1891:sub(v1880.CursorX + 1, v1880.CursorX + 4) == v1800 and 3 or 0);
                                    if v1880.CursorX > #v1891 then
                                        v1880.CursorY = v1880.CursorY + 1;
                                        v1880.CursorX = 0;
                                    end;
                                    v1880.FloatCursorX = v1880.CursorX;
                                    v1880:UpdateCursor();
                                    v1880:JumpToCursor();
                                end);
                                return;
                            elseif l_KeyCode_1 == l_KeyCode_0.Backspace then
                                v1889(l_KeyCode_0.Backspace, function() --[[ Line: 7195 ]]
                                    local v1892 = nil;
                                    local v1893 = nil;
                                    if v1880:IsValidRange() then
                                        v1892 = v1880.SelectionRange[1];
                                        v1893 = v1880.SelectionRange[2];
                                    else
                                        v1893 = {
                                            v1880.CursorX, 
                                            v1880.CursorY
                                        };
                                    end;
                                    if not v1892 then
                                        local v1894 = v1880.Lines[v1880.CursorY + 1] or "";
                                        v1880.CursorX = v1880.CursorX - 1 - (v1894:sub(v1880.CursorX - 3, v1880.CursorX) == v1800 and 3 or 0);
                                        if v1880.CursorX < 0 then
                                            v1880.CursorY = v1880.CursorY - 1;
                                            v1880.CursorX = #(v1880.Lines[v1880.CursorY + 1] or "");
                                        end;
                                        v1880.FloatCursorX = v1880.CursorX;
                                        v1880:UpdateCursor();
                                        v1892 = v1892 or {
                                            v1880.CursorX, 
                                            v1880.CursorY
                                        };
                                    end;
                                    v1880:DeleteRange({
                                        v1892, 
                                        v1893
                                    }, false, true);
                                    v1880:ResetSelection(true);
                                    v1880:JumpToCursor();
                                end);
                                return;
                            elseif l_KeyCode_1 == l_KeyCode_0.Delete then
                                v1889(l_KeyCode_0.Delete, function() --[[ Line: 7223 ]]
                                    local v1895 = nil;
                                    local v1896 = nil;
                                    if v1880:IsValidRange() then
                                        v1895 = v1880.SelectionRange[1];
                                        v1896 = v1880.SelectionRange[2];
                                    else
                                        v1895 = {
                                            v1880.CursorX, 
                                            v1880.CursorY
                                        };
                                    end;
                                    if not v1896 then
                                        local v1897 = v1880.Lines[v1880.CursorY + 1] or "";
                                        local v1898 = v1880.CursorX + 1 + (v1897:sub(v1880.CursorX + 1, v1880.CursorX + 4) == v1800 and 3 or 0);
                                        local l_CursorY_0 = v1880.CursorY;
                                        if #v1897 < v1898 then
                                            l_CursorY_0 = l_CursorY_0 + 1;
                                            v1898 = 0;
                                        end;
                                        v1880:UpdateCursor();
                                        v1896 = v1896 or {
                                            v1898, 
                                            l_CursorY_0
                                        };
                                    end;
                                    v1880:DeleteRange({
                                        v1895, 
                                        v1896
                                    }, false, true);
                                    v1880:ResetSelection(true);
                                    v1880:JumpToCursor();
                                end);
                                return;
                            else
                                if v1137.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) and l_KeyCode_1 == l_KeyCode_0.A then
                                    v1880.SelectionRange = {
                                        {
                                            0, 
                                            0
                                        }, 
                                        {
                                            #v1880.Lines[#v1880.Lines], 
                                            #v1880.Lines - 1
                                        }
                                    };
                                    v1880:SetCopyableSelection();
                                    v1880:Refresh();
                                end;
                                return;
                            end;
                        end;
                    end);
                end;
                v1793.DisconnectEditBoxEvent = function(v1900) --[[ Line: 7259 ]]
                    if v1900.EditBoxEvent then
                        v1900.EditBoxEvent:Disconnect();
                    end;
                end;
                v1793.ResetSelection = function(v1901, v1902) --[[ Line: 7265 ]]
                    v1901.SelectionRange = {
                        {
                            -1, 
                            -1
                        }, 
                        {
                            -1, 
                            -1
                        }
                    };
                    if not v1902 then
                        v1901:Refresh();
                    end;
                end;
                v1793.IsValidRange = function(v1903, v1904) --[[ Line: 7270 ]]
                    local v1905 = v1904 or v1903.SelectionRange;
                    local v1906 = v1905[1][1];
                    local v1907 = v1905[1][2];
                    local v1908 = v1905[2][1];
                    local v1909 = v1905[2][2];
                    if v1906 == -1 or v1906 == v1908 and v1907 == v1909 then
                        return false;
                    else
                        return true;
                    end;
                end;
                v1793.DeleteRange = function(v1910, v1911, v1912, v1913) --[[ Line: 7280 ]]
                    v1911 = v1911 or v1910.SelectionRange;
                    if not v1910:IsValidRange(v1911) then
                        return;
                    else
                        local l_Lines_2 = v1910.Lines;
                        local v1915 = v1911[1][1];
                        local v1916 = v1911[1][2];
                        local v1917 = v1911[2][1];
                        local v1918 = v1911[2][2];
                        local v1919 = v1918 - v1916;
                        if not l_Lines_2[v1916 + 1] or not l_Lines_2[v1918 + 1] then
                            return;
                        else
                            local v1920 = l_Lines_2[v1916 + 1]:sub(1, v1915);
                            local v1921 = l_Lines_2[v1918 + 1]:sub(v1917 + 1);
                            l_Lines_2[v1916 + 1] = v1920 .. v1921;
                            local l_remove_0 = table.remove;
                            for __ = 1, v1919 do
                                l_remove_0(l_Lines_2, v1916 + 2);
                            end;
                            if v1911 == v1910.SelectionRange then
                                v1910.SelectionRange = {
                                    {
                                        -1, 
                                        -1
                                    }, 
                                    {
                                        -1, 
                                        -1
                                    }
                                };
                            end;
                            if v1913 then
                                v1910.CursorX = v1915;
                                v1910.CursorY = v1916;
                                v1910:UpdateCursor();
                            end;
                            if not v1912 then
                                v1910:ProcessTextChange();
                            end;
                            return;
                        end;
                    end;
                end;
                v1793.AppendText = function(v1924, v1925) --[[ Line: 7312 ]]
                    v1924:DeleteRange(nil, true, true);
                    local l_Lines_3 = v1924.Lines;
                    local l_CursorX_0 = v1924.CursorX;
                    local l_CursorY_1 = v1924.CursorY;
                    local v1929 = l_Lines_3[l_CursorY_1 + 1];
                    local v1930 = v1929:sub(1, l_CursorX_0);
                    local v1931 = v1929:sub(l_CursorX_0 + 1);
                    local v1932 = v1924:ConvertText(v1925:gsub("\r\n", "\n"), true):split("\n");
                    local l_insert_0 = table.insert;
                    for v1934 = 1, #v1932 do
                        local v1935 = l_CursorY_1 + v1934;
                        if v1934 > 1 then
                            l_insert_0(l_Lines_3, v1935, "");
                        end;
                        local v1936 = v1932[v1934];
                        l_Lines_3[v1935] = (v1934 == 1 and v1930 or "") .. v1936 .. (v1934 == #v1932 and v1931 or "");
                    end;
                    if #v1932 > 1 then
                        l_CursorX_0 = 0;
                    end;
                    v1924:ProcessTextChange();
                    v1924.CursorX = l_CursorX_0 + #v1932[#v1932];
                    v1924.CursorY = l_CursorY_1 + #v1932 - 1;
                    v1924:UpdateCursor();
                end;
                v1793.ScrollDelta = function(v1937, v1938, v1939) --[[ Line: 7344 ]]
                    v1937.ScrollV:ScrollTo(v1937.ScrollV.Index + v1939);
                    v1937.ScrollH:ScrollTo(v1937.ScrollH.Index + v1938);
                end;
                v1793.TabAdjust = function(v1940, v1941, v1942) --[[ Line: 7350 ]]
                    local v1943 = v1940.Lines[v1942 + 1];
                    v1941 = v1941 + 1;
                    if v1943 then
                        local v1944 = v1943:sub(v1941 - 1, v1941 - 1);
                        local v1945 = v1943:sub(v1941, v1941);
                        local v1946 = v1943:sub(v1941 + 1, v1941 + 1);
                        local v1947 = (#v1944 > 0 and v1944 or " ") .. (#v1945 > 0 and v1945 or " ") .. (#v1946 > 0 and v1946 or " ");
                        for v1948, v1949 in pairs(v1801) do
                            if v1947:find(v1948) then
                                return v1949;
                            end;
                        end;
                    end;
                    return 0;
                end;
                v1793.SetEditing = function(v1950, v1951, v1952) --[[ Line: 7370 ]]
                    v1950:UpdateCursor(v1952);
                    if v1951 then
                        if v1950.Editable then
                            v1950.GuiElems.EditBox.Text = "";
                            v1950.GuiElems.EditBox:CaptureFocus();
                            return;
                        end;
                    else
                        v1950.GuiElems.EditBox:ReleaseFocus();
                    end;
                end;
                v1793.CursorAnim = function(v1953, v1954) --[[ Line: 7383 ]]
                    local l_Cursor_0 = v1953.GuiElems.Cursor;
                    local v1956 = tick();
                    v1953.LastAnimTime = v1956;
                    if not v1954 then
                        return;
                    else
                        v1803.Invis:Cancel();
                        v1803.Vis:Cancel();
                        l_Cursor_0.BackgroundTransparency = 0;
                        coroutine.wrap(function() --[[ Line: 7394 ]]
                            while true do
                                if v1953.Editable then
                                    v1144.FastWait(0.5);
                                    if v1953.LastAnimTime ~= v1956 then
                                        return;
                                    else
                                        v1803.Invis:Play();
                                        v1144.FastWait(0.4);
                                        if v1953.LastAnimTime ~= v1956 then
                                            return;
                                        else
                                            v1803.Vis:Play();
                                            v1144.FastWait(0.2);
                                        end;
                                    end;
                                else
                                    return;
                                end;
                            end;
                        end)();
                        return;
                    end;
                end;
                v1793.MoveCursor = function(v1957, v1958, v1959) --[[ Line: 7407 ]]
                    v1957.CursorX = v1958;
                    v1957.CursorY = v1959;
                    v1957:UpdateCursor();
                    v1957:JumpToCursor();
                end;
                v1793.JumpToCursor = function(v1960) --[[ Line: 7414 ]]
                    v1960:Refresh();
                end;
                v1793.UpdateCursor = function(v1961, v1962) --[[ Line: 7418 ]]
                    local l_LinesFrame_1 = v1961.GuiElems.LinesFrame;
                    local l_Cursor_1 = v1961.GuiElems.Cursor;
                    local v1965 = math.max(0, l_LinesFrame_1.AbsoluteSize.X);
                    local v1966 = math.ceil(math.max(0, l_LinesFrame_1.AbsoluteSize.Y) / v1961.FontSize);
                    local v1967 = math.ceil(v1965 / math.ceil(v1961.FontSize / 2));
                    local l_ViewX_0 = v1961.ViewX;
                    local l_ViewY_0 = v1961.ViewY;
                    local v1970 = tostring(#v1961.Lines);
                    local v1971 = math.ceil(v1961.FontSize / 2);
                    local v1972 = #v1970 * v1971 + 4 * v1971;
                    if v1962 then
                        local l_LinesFrame_2 = v1961.GuiElems.LinesFrame;
                        local l_X_15 = l_LinesFrame_2.AbsolutePosition.X;
                        local l_Y_9 = l_LinesFrame_2.AbsolutePosition.Y;
                        local l_X_16 = v1962.Position.X;
                        local l_Y_10 = v1962.Position.Y;
                        local v1978 = math.ceil(v1961.FontSize / 2);
                        local l_FontSize_1 = v1961.FontSize;
                        v1961.CursorX = v1961.ViewX + math.round((l_X_16 - l_X_15) / v1978);
                        v1961.CursorY = v1961.ViewY + math.floor((l_Y_10 - l_Y_9) / l_FontSize_1);
                    end;
                    local l_CursorX_1 = v1961.CursorX;
                    local l_CursorY_2 = v1961.CursorY;
                    local v1982 = v1961.Lines[l_CursorY_2 + 1] or "";
                    if #v1982 < l_CursorX_1 then
                        l_CursorX_1 = #v1982;
                    elseif l_CursorX_1 < 0 then
                        l_CursorX_1 = 0;
                    end;
                    if #v1961.Lines <= l_CursorY_2 then
                        l_CursorY_2 = math.max(0, #v1961.Lines - 1);
                    elseif l_CursorY_2 < 0 then
                        l_CursorY_2 = 0;
                    end;
                    l_CursorX_1 = l_CursorX_1 + v1961:TabAdjust(l_CursorX_1, l_CursorY_2);
                    v1961.CursorX = l_CursorX_1;
                    v1961.CursorY = l_CursorY_2;
                    local v1983 = false;
                    if l_ViewX_0 <= l_CursorX_1 then
                        v1983 = false;
                        if l_ViewY_0 <= l_CursorY_2 then
                            v1983 = false;
                            if l_CursorX_1 <= l_ViewX_0 + v1967 then
                                v1983 = l_CursorY_2 <= l_ViewY_0 + v1966;
                            end;
                        end;
                    end;
                    if v1983 then
                        local v1984 = l_CursorX_1 - l_ViewX_0;
                        local v1985 = l_CursorY_2 - l_ViewY_0;
                        l_Cursor_1.Position = UDim2.new(0, v1972 + v1984 * math.ceil(v1961.FontSize / 2) - 1, 0, v1985 * v1961.FontSize);
                        l_Cursor_1.Size = UDim2.new(0, 1, 0, v1961.FontSize + 2);
                        l_Cursor_1.Visible = true;
                        v1961:CursorAnim(true);
                        return;
                    else
                        l_Cursor_1.Visible = false;
                        return;
                    end;
                end;
                v1793.MapNewLines = function(v1986) --[[ Line: 7471 ]]
                    local v1987 = {};
                    local v1988 = 1;
                    local l_Text_1 = v1986.Text;
                    local l_find_7 = string.find;
                    local v1991 = l_find_7(l_Text_1, "\n", 1, true);
                    while v1991 do
                        v1987[v1988] = v1991;
                        v1988 = v1988 + 1;
                        v1991 = l_find_7(l_Text_1, "\n", v1991 + 1, true);
                    end;
                    v1986.NewLines = v1987;
                end;
                v1793.PreHighlight = function(v1992) --[[ Line: 7489 ]]
                    local __ = tick();
                    local v1994 = v1992.Text:gsub("\\\\", "  ");
                    local v1995 = #v1994;
                    local v1996 = {};
                    local v1997 = {};
                    local v1998 = {};
                    local l_find_8 = string.find;
                    local l_sub_2 = string.sub;
                    v1992.ColoredLines = {};
                    local function v2013(v2001, v2002, v2003, v2004) --[[ Line: 7501 ]] --[[ Name: findAll ]]
                        local v2005 = #v1996 + 1;
                        local v2006, v2007, v2008 = l_find_8(v2001, v2002, 1, v2004);
                        while v2006 do
                            v1996[v2005] = v2006;
                            v1997[v2006] = v2003;
                            if v2008 then
                                v1998[v2006] = v2008;
                            end;
                            v2005 = v2005 + 1;
                            local v2009 = v2007 + 1;
                            local v2010, v2011, v2012 = l_find_8(v2001, v2002, v2009, v2004);
                            v2006 = v2010;
                            v2007 = v2011;
                            v2008 = v2012;
                        end;
                    end;
                    local __ = tick();
                    v2013(v1994, "\"", 1, true);
                    v2013(v1994, "'", 2, true);
                    v2013(v1994, "%[(=*)%[", 3);
                    v2013(v1994, "--", 4, true);
                    table.sort(v1996);
                    local l_NewLines_0 = v1992.NewLines;
                    local v2016 = 0;
                    local v2017 = 0;
                    local v2018 = 0;
                    local v2019 = {};
                    for v2020 = 1, #v1996 do
                        local v2021 = v1996[v2020];
                        if v2021 > v2018 then
                            local l_v2021_0 = v2021;
                            local v2023 = v1997[v2021];
                            if v2023 == 1 then
                                l_v2021_0 = l_find_8(v1994, "\"", v2021 + 1, true);
                                while l_v2021_0 and l_sub_2(v1994, l_v2021_0 - 1, l_v2021_0 - 1) == "\\" do
                                    l_v2021_0 = l_find_8(v1994, "\"", l_v2021_0 + 1, true);
                                end;
                                if not l_v2021_0 then
                                    l_v2021_0 = v1995;
                                end;
                            elseif v2023 == 2 then
                                l_v2021_0 = l_find_8(v1994, "'", v2021 + 1, true);
                                while l_v2021_0 and l_sub_2(v1994, l_v2021_0 - 1, l_v2021_0 - 1) == "\\" do
                                    l_v2021_0 = l_find_8(v1994, "'", l_v2021_0 + 1, true);
                                end;
                                if not l_v2021_0 then
                                    l_v2021_0 = v1995;
                                end;
                            elseif v2023 == 3 then
                                local v2024, v2025 = l_find_8(v1994, "]" .. v1998[v2021] .. "]", v2021 + 1, true);
                                _ = v2024;
                                l_v2021_0 = v2025 or v1995;
                            elseif v2023 == 4 then
                                if v1997[v2021 + 2] == 3 then
                                    local v2026, v2027 = l_find_8(v1994, "]" .. v1998[v2021 + 2] .. "]", v2021 + 1, true);
                                    _ = v2026;
                                    l_v2021_0 = v2027 or v1995;
                                else
                                    l_v2021_0 = l_find_8(v1994, "\n", v2021 + 1, true) or v1995;
                                end;
                            end;
                            while v2017 < v2021 do
                                v2016 = v2016 + 1;
                                v2017 = l_NewLines_0[v2016] or v1995 + 1;
                            end;
                            while true do
                                local v2028 = v2019[v2016];
                                if not v2028 then
                                    v2028 = {};
                                    v2019[v2016] = v2028;
                                end;
                                v2028[v2021] = {
                                    v2023, 
                                    l_v2021_0
                                };
                                if v2017 < l_v2021_0 then
                                    v2016 = v2016 + 1;
                                    v2017 = l_NewLines_0[v2016] or v1995 + 1;
                                else
                                    break;
                                end;
                            end;
                            v2018 = l_v2021_0;
                        end;
                    end;
                    v1992.PreHighlights = v2019;
                end;
                v1793.HighlightLine = function(v2029, v2030) --[[ Line: 7591 ]]
                    local v2031 = v2029.ColoredLines[v2030];
                    if v2031 then
                        return v2031;
                    else
                        local l_sub_3 = string.sub;
                        local l_find_9 = string.find;
                        local l_match_2 = string.match;
                        local v2035 = {};
                        local v2036 = v2029.PreHighlights[v2030] or {};
                        local v2037 = v2029.Lines[v2030] or "";
                        local __ = #v2037;
                        local v2039 = 0;
                        local v2040 = 0;
                        local v2041 = nil;
                        local v2042 = false;
                        local v2043 = 0;
                        local v2044 = v2029.NewLines[v2030 - 1] or 0;
                        local v2045 = {};
                        for v2046, v2047 in next, v2036 do
                            local v2048 = v2046 - v2044;
                            if v2048 < 1 then
                                v2040 = v2047[1];
                                v2039 = v2047[2] - v2044;
                            else
                                v2045[v2048] = {
                                    v2047[1], 
                                    v2047[2] - v2044
                                };
                            end;
                        end;
                        for v2049 = 1, #v2037 do
                            if v2049 <= v2039 then
                                v2035[v2049] = v2040;
                            else
                                local v2050 = v2045[v2049];
                                if v2050 then
                                    v2040 = v2050[1];
                                    v2039 = v2050[2];
                                    v2035[v2049] = v2040;
                                    v2042 = false;
                                    v2041 = nil;
                                    v2043 = 0;
                                else
                                    local v2051 = l_sub_3(v2037, v2049, v2049);
                                    if l_find_9(v2051, "[%a_]") then
                                        local v2052 = l_match_2(v2037, "[%a%d_]+", v2049);
                                        local v2053 = v1796[v2052] and 7 or v1797[v2052] and 8;
                                        v2039 = v2049 + #v2052 - 1;
                                        if v2053 ~= 7 then
                                            if v2042 then
                                                local v2054 = v2041 and v1797[v2041];
                                                v2053 = v2054 and type(v2054) == "table" and v2054[v2052] and 8 or 10;
                                            end;
                                            if v2053 ~= 8 then
                                                local v2055, __, v2057 = l_find_9(v2037, "^%s*([%({\"'])", v2039 + 1);
                                                if v2055 then
                                                    v2053 = v2043 > 0 and v2057 == "(" and 16 or 9;
                                                    v2043 = 0;
                                                end;
                                            end;
                                        else
                                            v2053 = v1795[v2052] or v2053;
                                            v2043 = v2052 == "function" and 1 or 0;
                                        end;
                                        v2041 = v2052;
                                        v2042 = false;
                                        if v2043 > 0 then
                                            v2043 = 1;
                                        end;
                                        if v2053 then
                                            v2040 = v2053;
                                            v2035[v2049] = v2040;
                                        else
                                            v2040 = nil;
                                        end;
                                    elseif l_find_9(v2051, "%p") then
                                        local v2058 = v2051 == ".";
                                        local v2059 = v2058 and l_find_9(l_sub_3(v2037, v2049 + 1, v2049 + 1), "%d");
                                        v2035[v2049] = v2059 and 6 or 5;
                                        if not v2059 then
                                            local v2060 = v2058 and l_match_2(v2037, "%.%.?%.?", v2049);
                                            if v2060 and #v2060 > 1 then
                                                v2040 = 5;
                                                v2039 = v2049 + #v2060 - 1;
                                                v2042 = false;
                                                v2041 = nil;
                                                v2043 = 0;
                                            else
                                                if v2058 then
                                                    if v2042 then
                                                        v2041 = nil;
                                                    else
                                                        v2042 = true;
                                                    end;
                                                else
                                                    v2042 = false;
                                                    v2041 = nil;
                                                end;
                                                v2043 = (not not v2058 or v2051 == ":") and v2043 == 1 and 2 or 0;
                                            end;
                                        end;
                                    elseif l_find_9(v2051, "%d") then
                                        local __, v2062 = l_find_9(v2037, "%x+", v2049);
                                        local v2063 = l_sub_3(v2037, v2062, v2062 + 1);
                                        if (v2063 == "e+" or v2063 == "e-") and l_find_9(l_sub_3(v2037, v2062 + 2, v2062 + 2), "%d") then
                                            v2062 = v2062 + 1;
                                        end;
                                        v2040 = 6;
                                        v2039 = v2062;
                                        v2035[v2049] = 6;
                                        v2042 = false;
                                        v2041 = nil;
                                        v2043 = 0;
                                    else
                                        v2035[v2049] = v2040;
                                        local __, v2065 = l_find_9(v2037, "%s+", v2049);
                                        if v2065 then
                                            v2039 = v2065;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                        v2029.ColoredLines[v2030] = v2035;
                        return v2035;
                    end;
                end;
                v1793.Refresh = function(v2066) --[[ Line: 7722 ]]
                    local __ = tick();
                    local l_Lines_4 = v2066.Frame.Lines;
                    local v2069 = math.max(0, l_Lines_4.AbsoluteSize.X);
                    local v2070 = math.ceil(math.max(0, l_Lines_4.AbsoluteSize.Y) / v2066.FontSize);
                    local v2071 = math.ceil(v2069 / math.ceil(v2066.FontSize / 2));
                    local l_gsub_2 = string.gsub;
                    local l_sub_4 = string.sub;
                    local l_ViewX_1 = v2066.ViewX;
                    local l_ViewY_1 = v2066.ViewY;
                    local v2076 = "";
                    for v2077 = 1, v2070 do
                        local v2078 = v2066.LineFrames[v2077];
                        if not v2078 then
                            v2078 = Instance.new("Frame");
                            v2078.Name = "Line";
                            v2078.Position = UDim2.new(0, 0, 0, (v2077 - 1) * v2066.FontSize);
                            v2078.Size = UDim2.new(1, 0, 0, v2066.FontSize);
                            v2078.BorderSizePixel = 0;
                            v2078.BackgroundTransparency = 1;
                            local l_Frame_2 = Instance.new("Frame");
                            l_Frame_2.Name = "SelectionHighlight";
                            l_Frame_2.BorderSizePixel = 0;
                            l_Frame_2.BackgroundColor3 = v1129.Theme.Syntax.SelectionBack;
                            l_Frame_2.Parent = v2078;
                            local l_TextLabel_1 = Instance.new("TextLabel");
                            l_TextLabel_1.Name = "Label";
                            l_TextLabel_1.BackgroundTransparency = 1;
                            l_TextLabel_1.Font = Enum.Font.Code;
                            l_TextLabel_1.TextSize = v2066.FontSize;
                            l_TextLabel_1.Size = UDim2.new(1, 0, 0, v2066.FontSize);
                            l_TextLabel_1.RichText = true;
                            l_TextLabel_1.TextXAlignment = Enum.TextXAlignment.Left;
                            l_TextLabel_1.TextColor3 = v2066.Colors.Text;
                            l_TextLabel_1.ZIndex = 2;
                            l_TextLabel_1.Parent = v2078;
                            v2078.Parent = l_Lines_4;
                            v2066.LineFrames[v2077] = v2078;
                        end;
                        local v2081 = l_ViewY_1 + v2077;
                        local v2082 = v2066.Lines[v2081] or "";
                        local v2083 = "";
                        local v2084 = v2066:HighlightLine(v2081);
                        local v2085 = l_ViewX_1 + 1;
                        local l_RichTemplates_0 = v2066.RichTemplates;
                        local l_Text_2 = l_RichTemplates_0.Text;
                        local l_Selection_0 = l_RichTemplates_0.Selection;
                        local v2089 = v2084[v2085];
                        local v2090 = l_RichTemplates_0[v1794[v2089]] or l_Text_2;
                        local l_SelectionRange_1 = v2066.SelectionRange;
                        local v2092 = l_SelectionRange_1[1];
                        local v2093 = l_SelectionRange_1[2];
                        local v2094 = v2092[2];
                        local v2095 = v2092[1];
                        local v2096 = v2093[2];
                        local v2097 = v2093[1];
                        local __ = l_ViewX_1;
                        local v2099 = v2081 - 1;
                        if v2092[2] <= v2099 and v2099 <= v2093[2] then
                            local v2100 = math.ceil(v2066.FontSize / 2);
                            local v2101 = (v2099 == v2092[2] and v2092[1] or 0) - l_ViewX_1;
                            local v2102 = v2099 == v2093[2] and v2093[1] - v2101 - l_ViewX_1 or v2071 + l_ViewX_1;
                            v2078.SelectionHighlight.Position = UDim2.new(0, v2101 * v2100, 0, 0);
                            v2078.SelectionHighlight.Size = UDim2.new(0, v2102 * v2100, 1, 0);
                            v2078.SelectionHighlight.Visible = true;
                        else
                            v2078.SelectionHighlight.Visible = false;
                        end;
                        local v2103 = false;
                        if v2094 <= v2099 then
                            v2103 = false;
                            if v2099 <= v2096 then
                                v2103 = (not (not (v2099 == v2094) or v2095 > l_ViewX_1) or v2099 ~= v2094) and (v2099 == v2096 and l_ViewX_1 < v2097 or v2099 ~= v2096);
                            end;
                        end;
                        if v2103 then
                            v2089 = -999;
                            v2090 = l_Selection_0;
                        end;
                        for v2104 = 2, v2071 do
                            local v2105 = l_ViewX_1 + v2104;
                            local v2106 = v2105 - 1;
                            local v2107 = v2084[v2105];
                            local v2108 = false;
                            if v2094 <= v2099 then
                                v2108 = false;
                                if v2099 <= v2096 then
                                    v2108 = (not (not (v2099 == v2094) or v2095 > v2106) or v2099 ~= v2094) and (v2099 == v2096 and v2106 < v2097 or v2099 ~= v2096);
                                end;
                            end;
                            if v2108 then
                                v2107 = -999;
                            end;
                            if v2107 ~= v2089 then
                                local v2109 = v2108 and l_Selection_0 or l_RichTemplates_0[v1794[v2107]] or l_Text_2;
                                if v2109 ~= v2090 then
                                    local v2110 = l_gsub_2(l_sub_4(v2082, v2085, v2105 - 1), "['\"<>&]", v1799);
                                    v2083 = v2083 .. (v2090 ~= l_Text_2 and v2090 .. v2110 .. "</font>" or v2110);
                                    v2085 = v2105;
                                    v2090 = v2109;
                                end;
                                v2089 = v2107;
                            end;
                        end;
                        local v2111 = l_gsub_2(l_sub_4(v2082, v2085, l_ViewX_1 + v2071), "['\"<>&]", v1799);
                        if #v2111 > 0 then
                            v2083 = v2083 .. (v2090 ~= l_Text_2 and v2090 .. v2111 .. "</font>" or v2111);
                        end;
                        if v2066.Lines[v2081] then
                            v2076 = v2076 .. (v2081 == v2066.CursorY and "<b>" .. v2081 .. "</b>\n" or v2081 .. "\n");
                        end;
                        v2078.Label.Text = v2083;
                    end;
                    for v2112 = v2070 + 1, #v2066.LineFrames do
                        v2066.LineFrames[v2112]:Destroy();
                        v2066.LineFrames[v2112] = nil;
                    end;
                    v2066.Frame.LineNumbers.Text = v2076;
                    v2066:UpdateCursor();
                end;
                v1793.UpdateView = function(v2113) --[[ Line: 7856 ]]
                    local v2114 = tostring(#v2113.Lines);
                    local v2115 = math.ceil(v2113.FontSize / 2);
                    local v2116 = #v2114 * v2115 + 4 * v2115;
                    local l_Lines_5 = v2113.Frame.Lines;
                    local l_X_17 = l_Lines_5.AbsoluteSize.X;
                    local v2119 = math.ceil(l_Lines_5.AbsoluteSize.Y / v2113.FontSize);
                    local v2120 = v2113.MaxTextCols * v2115;
                    local l_ScrollV_0 = v2113.ScrollV;
                    local l_ScrollH_0 = v2113.ScrollH;
                    l_ScrollV_0.VisibleSpace = v2119;
                    l_ScrollV_0.TotalSpace = #v2113.Lines + 1;
                    l_ScrollH_0.VisibleSpace = math.ceil(l_X_17 / v2115);
                    l_ScrollH_0.TotalSpace = v2113.MaxTextCols + 1;
                    l_ScrollV_0.Gui.Visible = v2119 < #v2113.Lines + 1;
                    l_ScrollH_0.Gui.Visible = l_X_17 < v2120;
                    local l_FrameOffsets_0 = v2113.FrameOffsets;
                    v2113.FrameOffsets = Vector2.new(l_ScrollV_0.Gui.Visible and -16 or 0, l_ScrollH_0.Gui.Visible and -16 or 0);
                    if l_FrameOffsets_0 ~= v2113.FrameOffsets then
                        v2113:UpdateView();
                        return;
                    else
                        l_ScrollV_0:ScrollTo(v2113.ViewY, true);
                        l_ScrollH_0:ScrollTo(v2113.ViewX, true);
                        if l_ScrollV_0.Gui.Visible and l_ScrollH_0.Gui.Visible then
                            l_ScrollV_0.Gui.Size = UDim2.new(0, 16, 1, -16);
                            l_ScrollH_0.Gui.Size = UDim2.new(1, -16, 0, 16);
                            v2113.GuiElems.ScrollCorner.Visible = true;
                        else
                            l_ScrollV_0.Gui.Size = UDim2.new(0, 16, 1, 0);
                            l_ScrollH_0.Gui.Size = UDim2.new(1, 0, 0, 16);
                            v2113.GuiElems.ScrollCorner.Visible = false;
                        end;
                        v2113.ViewY = l_ScrollV_0.Index;
                        v2113.ViewX = l_ScrollH_0.Index;
                        v2113.Frame.Lines.Position = UDim2.new(0, v2116, 0, 0);
                        v2113.Frame.Lines.Size = UDim2.new(1, -v2116 + l_FrameOffsets_0.X, 1, l_FrameOffsets_0.Y);
                        v2113.Frame.LineNumbers.Position = UDim2.new(0, v2115, 0, 0);
                        v2113.Frame.LineNumbers.Size = UDim2.new(0, #v2114 * v2115, 1, l_FrameOffsets_0.Y);
                        v2113.Frame.LineNumbers.TextSize = v2113.FontSize;
                        return;
                    end;
                end;
                v1793.ProcessTextChange = function(v2124) --[[ Line: 7905 ]]
                    local v2125 = 0;
                    local l_Lines_6 = v2124.Lines;
                    for v2127 = 1, #l_Lines_6 do
                        local v2128 = #l_Lines_6[v2127];
                        if v2125 < v2128 then
                            v2125 = v2128;
                        end;
                    end;
                    v2124.MaxTextCols = v2125;
                    v2124:UpdateView();
                    v2124.Text = table.concat(v2124.Lines, "\n");
                    v2124:MapNewLines();
                    v2124:PreHighlight();
                    v2124:Refresh();
                end;
                v1793.ConvertText = function(__, v2130, v2131) --[[ Line: 7925 ]]
                    if v2131 then
                        return v2130:gsub("\t", (" %s%s "):format("\205", "\205"));
                    else
                        return v2130:gsub((" %s%s "):format("\205", "\205"), "\t");
                    end;
                end;
                v1793.GetText = function(v2132) --[[ Line: 7933 ]]
                    return v2132:ConvertText(table.concat(v2132.Lines, "\n"), false);
                end;
                v1793.SetText = function(v2133, v2134) --[[ Line: 7938 ]]
                    v2134 = v2133:ConvertText(v2134, true);
                    local l_Lines_7 = v2133.Lines;
                    table.clear(l_Lines_7);
                    local v2136 = 1;
                    for v2137 in v2134:gmatch("([^\n\r]*)[\n\r]?") do
                        local __ = #v2137;
                        l_Lines_7[v2136] = v2137;
                        v2136 = v2136 + 1;
                    end;
                    v2133:ProcessTextChange();
                end;
                v1793.MakeRichTemplates = function(v2139) --[[ Line: 7953 ]]
                    local l_floor_2 = math.floor;
                    local v2141 = {};
                    for v2142, v2143 in pairs(v2139.Colors) do
                        v2141[v2142] = ("<font color=\"rgb(%s,%s,%s)\">"):format(l_floor_2(v2143.r * 255), l_floor_2(v2143.g * 255), (l_floor_2(v2143.b * 255)));
                    end;
                    v2139.RichTemplates = v2141;
                end;
                v1793.ApplyTheme = function(v2144) --[[ Line: 7964 ]]
                    local l_Syntax_0 = v1129.Theme.Syntax;
                    v2144.Colors = l_Syntax_0;
                    v2144.Frame.LineNumbers.TextColor3 = l_Syntax_0.Text;
                    v2144.Frame.BackgroundColor3 = l_Syntax_0.Background;
                end;
                local v2146 = {
                    __index = v1793
                };
                return {
                    new = function() --[[ Line: 7973 ]] --[[ Name: new ]]
                        if not v1798 then
                            v1816();
                        end;
                        local v2147 = v1144.ScrollBar.new();
                        local v2148 = v1144.ScrollBar.new(true);
                        v2148.Gui.Position = UDim2.new(0, 0, 1, -16);
                        local v2149 = setmetatable({
                            FontSize = 15, 
                            ViewX = 0, 
                            ViewY = 0, 
                            Colors = v1129.Theme.Syntax, 
                            ColoredLines = {}, 
                            Lines = {
                                ""
                            }, 
                            LineFrames = {}, 
                            Editable = true, 
                            Editing = false, 
                            CursorX = 0, 
                            CursorY = 0, 
                            FloatCursorX = 0, 
                            Text = "", 
                            PreHighlights = {}, 
                            SelectionRange = {
                                {
                                    -1, 
                                    -1
                                }, 
                                {
                                    -1, 
                                    -1
                                }
                            }, 
                            NewLines = {}, 
                            FrameOffsets = Vector2.new(0, 0), 
                            MaxTextCols = 0, 
                            ScrollV = v2147, 
                            ScrollH = v2148
                        }, v2146);
                        v2147.WheelIncrement = 3;
                        v2148.Increment = 2;
                        v2148.WheelIncrement = 7;
                        v2147.Scrolled:Connect(function() --[[ Line: 8006 ]]
                            v2149.ViewY = v2147.Index;
                            v2149:Refresh();
                        end);
                        v2148.Scrolled:Connect(function() --[[ Line: 8011 ]]
                            v2149.ViewX = v2148.Index;
                            v2149:Refresh();
                        end);
                        v1864(v2149);
                        v2149:MakeRichTemplates();
                        v2149:ApplyTheme();
                        v2147:SetScrollFrame(v2149.Frame.Lines);
                        v2147.Gui.Parent = v2149.Frame;
                        v2148.Gui.Parent = v2149.Frame;
                        v2149:UpdateView();
                        v2149.Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 8024 ]]
                            v2149:UpdateView();
                            v2149:Refresh();
                        end);
                        return v2149;
                    end
                };
            end)();
            v1144.Checkbox = (function() --[[ Line: 8035 ]]
                local v2150 = {};
                local l_fromRGB_0 = Color3.fromRGB;
                local l_new_1 = Vector2.new;
                local l_fromScale_0 = UDim2.fromScale;
                local l_fromOffset_0 = UDim2.fromOffset;
                local l_new_2 = UDim.new;
                local l_max_0 = math.max;
                local l_new_3 = Instance.new;
                local l_TweenSize_0 = l_new_3("Frame").TweenSize;
                local l_new_4 = TweenInfo.new;
                local l_delay_0 = delay;
                local function v2167(v2161, v2162) --[[ Line: 8048 ]] --[[ Name: ripple ]]
                    local v2163 = l_new_3("Frame");
                    v2163.BackgroundColor3 = v2162;
                    v2163.BackgroundTransparency = 0.75;
                    v2163.BorderSizePixel = 0;
                    v2163.AnchorPoint = l_new_1(0.5, 0.5);
                    v2163.Size = l_fromOffset_0();
                    v2163.Position = l_fromScale_0(0.5, 0.5);
                    v2163.Parent = v2161;
                    local v2164 = l_new_3("UICorner");
                    v2164.CornerRadius = l_new_2(1);
                    v2164.Parent = v2163;
                    local l_AbsoluteSize_3 = v2161.AbsoluteSize;
                    local v2166 = l_max_0(l_AbsoluteSize_3.X, l_AbsoluteSize_3.Y) * 5 / 3;
                    l_TweenSize_0(v2163, l_fromOffset_0(v2166, v2166), "Out", "Quart", 0.4);
                    v1137.TweenService:Create(v2163, l_new_4(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                        BackgroundTransparency = 1
                    }):Play();
                    v1137.Debris:AddItem(v2163, 0.4);
                end;
                local function v2183(v2168, v2169) --[[ Line: 8070 ]] --[[ Name: initGui ]]
                    local v2170 = v2169 or v1139({
                        {
                            1, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                Name = "Checkbox", 
                                Position = UDim2.new(0, 3, 0, 3), 
                                Size = UDim2.new(0, 16, 0, 16)
                            }
                        }, 
                        {
                            2, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                Name = "ripples", 
                                Parent = {
                                    1
                                }, 
                                Size = UDim2.new(1, 0, 1, 0)
                            }
                        }, 
                        {
                            3, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(0.10196078568697, 0.10196078568697, 0.10196078568697), 
                                BorderSizePixel = 0, 
                                Name = "outline", 
                                Parent = {
                                    1
                                }, 
                                Size = UDim2.new(0, 16, 0, 16)
                            }
                        }, 
                        {
                            4, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(0.14117647707462, 0.14117647707462, 0.14117647707462), 
                                BorderSizePixel = 0, 
                                Name = "filler", 
                                Parent = {
                                    3
                                }, 
                                Position = UDim2.new(0, 1, 0, 1), 
                                Size = UDim2.new(0, 14, 0, 14)
                            }
                        }, 
                        {
                            5, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(0.90196084976196, 0.90196084976196, 0.90196084976196), 
                                BorderSizePixel = 0, 
                                Name = "top", 
                                Parent = {
                                    4
                                }, 
                                Size = UDim2.new(0, 16, 0, 0)
                            }
                        }, 
                        {
                            6, 
                            "Frame", 
                            {
                                AnchorPoint = Vector2.new(0, 1), 
                                BackgroundColor3 = Color3.new(0.90196084976196, 0.90196084976196, 0.90196084976196), 
                                BorderSizePixel = 0, 
                                Name = "bottom", 
                                Parent = {
                                    4
                                }, 
                                Position = UDim2.new(0, 0, 0, 14), 
                                Size = UDim2.new(0, 16, 0, 0)
                            }
                        }, 
                        {
                            7, 
                            "Frame", 
                            {
                                BackgroundColor3 = Color3.new(0.90196084976196, 0.90196084976196, 0.90196084976196), 
                                BorderSizePixel = 0, 
                                Name = "left", 
                                Parent = {
                                    4
                                }, 
                                Size = UDim2.new(0, 0, 0, 16)
                            }
                        }, 
                        {
                            8, 
                            "Frame", 
                            {
                                AnchorPoint = Vector2.new(1, 0), 
                                BackgroundColor3 = Color3.new(0.90196084976196, 0.90196084976196, 0.90196084976196), 
                                BorderSizePixel = 0, 
                                Name = "right", 
                                Parent = {
                                    4
                                }, 
                                Position = UDim2.new(0, 14, 0, 0), 
                                Size = UDim2.new(0, 0, 0, 16)
                            }
                        }, 
                        {
                            9, 
                            "Frame", 
                            {
                                AnchorPoint = Vector2.new(0.5, 0.5), 
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                ClipsDescendants = true, 
                                Name = "checkmark", 
                                Parent = {
                                    4
                                }, 
                                Position = UDim2.new(0.5, 0, 0.5, 0), 
                                Size = UDim2.new(0, 0, 0, 20)
                            }
                        }, 
                        {
                            10, 
                            "ImageLabel", 
                            {
                                AnchorPoint = Vector2.new(0.5, 0.5), 
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                Image = "rbxassetid://6234266378", 
                                Parent = {
                                    9
                                }, 
                                Position = UDim2.new(0.5, 0, 0.5, 0), 
                                ScaleType = 3, 
                                Size = UDim2.new(0, 15, 0, 11)
                            }
                        }, 
                        {
                            11, 
                            "ImageLabel", 
                            {
                                AnchorPoint = Vector2.new(0.5, 0.5), 
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BackgroundTransparency = 1, 
                                Image = "rbxassetid://6401617475", 
                                ImageColor3 = Color3.new(0.20784313976765, 0.69803923368454, 0.98431372642517), 
                                Name = "checkmark2", 
                                Parent = {
                                    4
                                }, 
                                Position = UDim2.new(0.5, 0, 0.5, 0), 
                                Size = UDim2.new(0, 12, 0, 12), 
                                Visible = false
                            }
                        }, 
                        {
                            12, 
                            "ImageLabel", 
                            {
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BackgroundTransparency = 1, 
                                Image = "rbxassetid://6425281788", 
                                ImageTransparency = 0.20000000298023, 
                                Name = "middle", 
                                Parent = {
                                    4
                                }, 
                                ScaleType = 2, 
                                Size = UDim2.new(1, 0, 1, 0), 
                                TileSize = UDim2.new(0, 2, 0, 2), 
                                Visible = false
                            }
                        }, 
                        {
                            13, 
                            "UICorner", 
                            {
                                CornerRadius = UDim.new(0, 2), 
                                Parent = {
                                    3
                                }
                            }
                        }
                    });
                    local l_outline_0 = v2170.outline;
                    local l_filler_0 = l_outline_0.filler;
                    local l_checkmark_0 = l_filler_0.checkmark;
                    local l_ripples_0 = v2170.ripples;
                    local l_top_0 = l_filler_0.top;
                    local l_bottom_0 = l_filler_0.bottom;
                    local l_left_0 = l_filler_0.left;
                    local l_right_0 = l_filler_0.right;
                    v2168.Gui = v2170;
                    v2168.GuiElems = {
                        Top = l_top_0, 
                        Bottom = l_bottom_0, 
                        Left = l_left_0, 
                        Right = l_right_0, 
                        Outline = l_outline_0, 
                        Filler = l_filler_0, 
                        Checkmark = l_checkmark_0, 
                        Checkmark2 = l_filler_0.checkmark2, 
                        Middle = l_filler_0.middle
                    };
                    v2170.InputBegan:Connect(function(v2179) --[[ Line: 8107 ]]
                        if v2179.UserInputType == Enum.UserInputType.MouseButton1 then
                            local v2180 = nil;
                            do
                                local l_v2180_0 = v2180;
                                l_v2180_0 = v1137.UserInputService.InputEnded:Connect(function(v2182) --[[ Line: 8110 ]]
                                    if v2182.UserInputType == Enum.UserInputType.MouseButton1 then
                                        l_v2180_0:Disconnect();
                                        if v1144.CheckMouseInGui(v2170) then
                                            if v2168.Style == 0 then
                                                v2167(l_ripples_0, v2168.Disabled and v2168.Colors.Disabled or v2168.Colors.Primary);
                                            end;
                                            if not v2168.Disabled then
                                                v2168:SetState(not v2168.Toggled, true);
                                            else
                                                v2168:Paint();
                                            end;
                                            v2168.OnInput:Fire();
                                        end;
                                    end;
                                end);
                            end;
                        end;
                    end);
                    v2168:Paint();
                end;
                v2150.Collapse = function(v2184, v2185) --[[ Line: 8135 ]]
                    local l_GuiElems_3 = v2184.GuiElems;
                    if v2185 then
                        l_TweenSize_0(l_GuiElems_3.Top, l_fromOffset_0(14, 14), "In", "Quart", 0.26666666666666666, true);
                        l_TweenSize_0(l_GuiElems_3.Bottom, l_fromOffset_0(14, 14), "In", "Quart", 0.26666666666666666, true);
                        l_TweenSize_0(l_GuiElems_3.Left, l_fromOffset_0(14, 14), "In", "Quart", 0.26666666666666666, true);
                        l_TweenSize_0(l_GuiElems_3.Right, l_fromOffset_0(14, 14), "In", "Quart", 0.26666666666666666, true);
                        return;
                    else
                        l_GuiElems_3.Top.Size = l_fromOffset_0(14, 14);
                        l_GuiElems_3.Bottom.Size = l_fromOffset_0(14, 14);
                        l_GuiElems_3.Left.Size = l_fromOffset_0(14, 14);
                        l_GuiElems_3.Right.Size = l_fromOffset_0(14, 14);
                        return;
                    end;
                end;
                v2150.Expand = function(v2187, v2188) --[[ Line: 8150 ]]
                    local l_GuiElems_4 = v2187.GuiElems;
                    if v2188 then
                        l_TweenSize_0(l_GuiElems_4.Top, l_fromOffset_0(14, 0), "InOut", "Quart", 0.26666666666666666, true);
                        l_TweenSize_0(l_GuiElems_4.Bottom, l_fromOffset_0(14, 0), "InOut", "Quart", 0.26666666666666666, true);
                        l_TweenSize_0(l_GuiElems_4.Left, l_fromOffset_0(0, 14), "InOut", "Quart", 0.26666666666666666, true);
                        l_TweenSize_0(l_GuiElems_4.Right, l_fromOffset_0(0, 14), "InOut", "Quart", 0.26666666666666666, true);
                        return;
                    else
                        l_GuiElems_4.Top.Size = l_fromOffset_0(14, 0);
                        l_GuiElems_4.Bottom.Size = l_fromOffset_0(14, 0);
                        l_GuiElems_4.Left.Size = l_fromOffset_0(0, 14);
                        l_GuiElems_4.Right.Size = l_fromOffset_0(0, 14);
                        return;
                    end;
                end;
                v2150.Paint = function(v2190) --[[ Line: 8165 ]]
                    local l_GuiElems_5 = v2190.GuiElems;
                    if v2190.Style == 0 then
                        local v2192 = v2190.Disabled and v2190.Colors.Disabled;
                        l_GuiElems_5.Outline.BackgroundColor3 = v2192 or v2190.Toggled and v2190.Colors.Primary or v2190.Colors.Secondary;
                        local v2193 = v2192 or v2190.Colors.Primary;
                        l_GuiElems_5.Top.BackgroundColor3 = v2193;
                        l_GuiElems_5.Bottom.BackgroundColor3 = v2193;
                        l_GuiElems_5.Left.BackgroundColor3 = v2193;
                        l_GuiElems_5.Right.BackgroundColor3 = v2193;
                        return;
                    else
                        l_GuiElems_5.Outline.BackgroundColor3 = v2190.Disabled and v2190.Colors.Disabled or v2190.Colors.Secondary;
                        l_GuiElems_5.Filler.BackgroundColor3 = v2190.Disabled and v2190.Colors.DisabledBackground or v2190.Colors.Background;
                        l_GuiElems_5.Checkmark2.ImageColor3 = v2190.Disabled and v2190.Colors.DisabledCheck or v2190.Colors.Primary;
                        return;
                    end;
                end;
                v2150.SetState = function(v2194, v2195, v2196) --[[ Line: 8183 ]]
                    v2194.Toggled = v2195;
                    if v2194.OutlineColorTween then
                        v2194.OutlineColorTween:Cancel();
                    end;
                    local v2197 = tick();
                    v2194.LastSetStateTime = v2197;
                    if v2194.Toggled then
                        if v2194.Style == 0 then
                            if v2196 then
                                v2194.OutlineColorTween = v1137.TweenService:Create(v2194.GuiElems.Outline, l_new_4(0.26666666666666666, Enum.EasingStyle.Circular, Enum.EasingDirection.Out), {
                                    BackgroundColor3 = v2194.Colors.Primary
                                });
                                v2194.OutlineColorTween:Play();
                                l_delay_0(0.15, function() --[[ Line: 8195 ]]
                                    if v2197 ~= v2194.LastSetStateTime then
                                        return;
                                    else
                                        v2194:Paint();
                                        l_TweenSize_0(v2194.GuiElems.Checkmark, l_fromOffset_0(14, 20), "Out", "Bounce", 0.13333333333333333, true);
                                        return;
                                    end;
                                end);
                            else
                                v2194.GuiElems.Outline.BackgroundColor3 = v2194.Colors.Primary;
                                v2194:Paint();
                                v2194.GuiElems.Checkmark.Size = l_fromOffset_0(14, 20);
                            end;
                            v2194:Collapse(v2196);
                            return;
                        else
                            v2194:Paint();
                            v2194.GuiElems.Checkmark2.Visible = true;
                            v2194.GuiElems.Middle.Visible = false;
                            return;
                        end;
                    elseif v2194.Style == 0 then
                        if v2196 then
                            v2194.OutlineColorTween = v1137.TweenService:Create(v2194.GuiElems.Outline, l_new_4(0.26666666666666666, Enum.EasingStyle.Circular, Enum.EasingDirection.In), {
                                BackgroundColor3 = v2194.Colors.Secondary
                            });
                            v2194.OutlineColorTween:Play();
                            l_delay_0(0.15, function() --[[ Line: 8216 ]]
                                if v2197 ~= v2194.LastSetStateTime then
                                    return;
                                else
                                    v2194:Paint();
                                    l_TweenSize_0(v2194.GuiElems.Checkmark, l_fromOffset_0(0, 20), "Out", "Quad", 0.06666666666666667, true);
                                    return;
                                end;
                            end);
                        else
                            v2194.GuiElems.Outline.BackgroundColor3 = v2194.Colors.Secondary;
                            v2194:Paint();
                            v2194.GuiElems.Checkmark.Size = l_fromOffset_0(0, 20);
                        end;
                        v2194:Expand(v2196);
                        return;
                    else
                        v2194:Paint();
                        v2194.GuiElems.Checkmark2.Visible = false;
                        v2194.GuiElems.Middle.Visible = v2194.Toggled == nil;
                        return;
                    end;
                end;
                local v2198 = {
                    __index = v2150
                };
                return {
                    new = function(v2199) --[[ Line: 8237 ]] --[[ Name: new ]]
                        local v2200 = setmetatable({
                            Toggled = false, 
                            Disabled = false, 
                            OnInput = v1144.Signal.new(), 
                            Style = v2199 or 0, 
                            Colors = {
                                Background = l_fromRGB_0(36, 36, 36), 
                                Primary = l_fromRGB_0(49, 176, 230), 
                                Secondary = l_fromRGB_0(25, 25, 25), 
                                Disabled = l_fromRGB_0(64, 64, 64), 
                                DisabledBackground = l_fromRGB_0(52, 52, 52), 
                                DisabledCheck = l_fromRGB_0(80, 80, 80)
                            }
                        }, v2198);
                        v2183(v2200);
                        return v2200;
                    end; 
                    function(v2201) --[[ Line: 8256 ]] --[[ Name: fromFrame ]]
                        local v2202 = setmetatable({
                            Toggled = false, 
                            Disabled = false, 
                            Colors = {
                                Background = l_fromRGB_0(36, 36, 36), 
                                Primary = l_fromRGB_0(49, 176, 230), 
                                Secondary = l_fromRGB_0(25, 25, 25), 
                                Disabled = l_fromRGB_0(64, 64, 64), 
                                DisabledBackground = l_fromRGB_0(52, 52, 52)
                            }
                        }, v2198);
                        v2183(v2202, v2201);
                        return v2202;
                    end
                };
            end)();
            v1144.BrickColorPicker = (function() --[[ Line: 8275 ]]
                local v2203 = {};
                local v2204 = 0;
                local l_Mouse_3 = v1137.Players.LocalPlayer:GetMouse();
                local v2206 = {
                    Color3.fromRGB(17, 17, 17), 
                    Color3.fromRGB(99, 95, 98), 
                    Color3.fromRGB(163, 162, 165), 
                    Color3.fromRGB(205, 205, 205), 
                    Color3.fromRGB(223, 223, 222), 
                    Color3.fromRGB(237, 234, 234), 
                    Color3.fromRGB(27, 42, 53), 
                    Color3.fromRGB(91, 93, 105), 
                    Color3.fromRGB(159, 161, 172), 
                    Color3.fromRGB(202, 203, 209), 
                    Color3.fromRGB(231, 231, 236), 
                    Color3.fromRGB(248, 248, 248)
                };
                local function v2211(v2207) --[[ Line: 8299 ]] --[[ Name: isMouseInHexagon ]]
                    local v2208 = l_Mouse_3.X - v2207.AbsolutePosition.X;
                    local v2209 = l_Mouse_3.Y - v2207.AbsolutePosition.Y;
                    if v2208 >= 4 and v2208 < 31 then
                        v2208 = v2208 - 4;
                        local v2210 = (13 - math.min(v2208, 26 - v2208)) / 13;
                        if 1 + 8 * v2210 <= v2209 and v2209 < v2207.AbsoluteSize.Y - 1 - 8 * v2210 then
                            return true;
                        end;
                    end;
                    return false;
                end;
                local function v2217(v2212, v2213, v2214) --[[ Line: 8313 ]] --[[ Name: hexInput ]]
                    v2213.InputBegan:Connect(function(v2215) --[[ Line: 8314 ]]
                        if v2215.UserInputType == Enum.UserInputType.MouseButton1 and v2211(v2213) then
                            v2212.OnSelect:Fire(v2214);
                            v2212:Close();
                        end;
                    end);
                    v2213.InputChanged:Connect(function(v2216) --[[ Line: 8321 ]]
                        if v2216.UserInputType == Enum.UserInputType.MouseMovement and v2211(v2213) then
                            v2212.OnPreview:Fire(v2214);
                        end;
                    end);
                end;
                local function v2230(v2218) --[[ Line: 8328 ]] --[[ Name: createGui ]]
                    local v2219 = v1139({
                        {
                            1, 
                            "ScreenGui", 
                            {
                                Name = "BrickColor"
                            }
                        }, 
                        {
                            2, 
                            "Frame", 
                            {
                                Active = true, 
                                BackgroundColor3 = Color3.new(0.17647059261799, 0.17647059261799, 0.17647059261799), 
                                BorderColor3 = Color3.new(0.1294117718935, 0.1294117718935, 0.1294117718935), 
                                Parent = {
                                    1
                                }, 
                                Position = UDim2.new(0.40000000596046, 0, 0.40000000596046, 0), 
                                Size = UDim2.new(0, 337, 0, 380)
                            }
                        }, 
                        {
                            3, 
                            "TextButton", 
                            {
                                BackgroundColor3 = Color3.new(0.2352941185236, 0.2352941185236, 0.2352941185236), 
                                BorderColor3 = Color3.new(0.21568627655506, 0.21568627655506, 0.21568627655506), 
                                BorderSizePixel = 0, 
                                Font = 3, 
                                Name = "MoreColors", 
                                Parent = {
                                    2
                                }, 
                                Position = UDim2.new(0, 5, 1, -30), 
                                Size = UDim2.new(1, -10, 0, 25), 
                                Text = "More Colors", 
                                TextColor3 = Color3.new(1, 1, 1), 
                                TextSize = 14
                            }
                        }, 
                        {
                            4, 
                            "ImageLabel", 
                            {
                                BackgroundColor3 = Color3.new(1, 1, 1), 
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                Image = "rbxassetid://1281023007", 
                                ImageColor3 = Color3.new(0.33333334326744, 0.33333334326744, 0.49803924560547), 
                                Name = "Hex", 
                                Parent = {
                                    2
                                }, 
                                Size = UDim2.new(0, 35, 0, 35), 
                                Visible = false
                            }
                        }
                    });
                    local l_Frame_3 = v2219.Frame;
                    local l_Hex_0 = l_Frame_3.Hex;
                    for v2222 = 1, 13 do
                        local v2223 = math.min(v2222, 14 - v2222) + 6;
                        for v2224 = 1, v2223 do
                            local l_Color_0 = BrickColor.palette(v2204).Color;
                            local v2226 = l_Hex_0:Clone();
                            v2226.Position = UDim2.new(0, (v2224 - 1) * 25 - (v2223 - 7) * 13 + 78 + 1, 0, (v2222 - 1) * 23 + 4);
                            v2226.ImageColor3 = l_Color_0;
                            v2226.Visible = true;
                            v2217(v2218, v2226, l_Color_0);
                            v2226.Parent = l_Frame_3;
                            v2204 = v2204 + 1;
                        end;
                    end;
                    for v2227 = 1, 12 do
                        local v2228 = v2206[v2227];
                        local v2229 = l_Hex_0:Clone();
                        v2229.Position = UDim2.new(0, (v2227 - 1) * 25 - 65 + 78 + 3, 0, 308);
                        v2229.ImageColor3 = v2228;
                        v2229.Visible = true;
                        v2217(v2218, v2229, v2228);
                        v2229.Parent = l_Frame_3;
                        v2204 = v2204 + 1;
                    end;
                    l_Frame_3.MoreColors.MouseButton1Click:Connect(function() --[[ Line: 8363 ]]
                        v2218.OnMoreColors:Fire();
                        v2218:Close();
                    end);
                    v2218.Gui = v2219;
                end;
                v2203.SetMoreColorsVisible = function(v2231, v2232) --[[ Line: 8371 ]]
                    local l_Frame_4 = v2231.Gui.Frame;
                    l_Frame_4.Size = UDim2.new(0, 337, 0, 380 - (not v2232 and 33 or 0));
                    l_Frame_4.MoreColors.Visible = v2232;
                end;
                v2203.Show = function(v2234, v2235, v2236, v2237) --[[ Line: 8377 ]]
                    v2234.PrevColor = v2237 or v2234.PrevColor;
                    local v2238 = false;
                    local v2239 = v2235 or l_Mouse_3.X;
                    local v2240 = v2236 or l_Mouse_3.Y;
                    local l_ViewSizeX_1 = l_Mouse_3.ViewSizeX;
                    local l_ViewSizeY_1 = l_Mouse_3.ViewSizeY;
                    v1144.ShowGui(v2234.Gui);
                    local l_X_18 = v2234.Gui.Frame.AbsoluteSize.X;
                    local l_Y_11 = v2234.Gui.Frame.AbsoluteSize.Y;
                    if l_ViewSizeX_1 < v2239 + l_X_18 then
                        v2239 = v2234.ReverseX and v2239 - l_X_18 or l_ViewSizeX_1 - l_X_18;
                    end;
                    if l_ViewSizeY_1 < v2240 + l_Y_11 then
                        v2238 = true;
                    end;
                    local v2245 = false;
                    if v2234.CloseEvent then
                        v2234.CloseEvent:Disconnect();
                    end;
                    v2234.CloseEvent = v1137.UserInputService.InputBegan:Connect(function(v2246) --[[ Line: 8392 ]]
                        if not v2245 or v2246.UserInputType ~= Enum.UserInputType.MouseButton1 then
                            return;
                        else
                            if not v1144.CheckMouseInGui(v2234.Gui.Frame) then
                                v2234.CloseEvent:Disconnect();
                                v2234:Close();
                            end;
                            return;
                        end;
                    end);
                    if v2238 then
                        local v2247 = v2240 - l_Y_11 - (v2234.ReverseYOffset or 0);
                        v2240 = v2247 >= 0 and v2247 or 0;
                    end;
                    v2234.Gui.Frame.Position = UDim2.new(0, v2239, 0, v2240);
                    v1144.FastWait();
                    v2245 = true;
                end;
                v2203.Close = function(v2248) --[[ Line: 8412 ]]
                    v2248.Gui.Parent = nil;
                    v2248.OnCancel:Fire();
                end;
                local v2249 = {
                    __index = v2203
                };
                return {
                    new = function() --[[ Line: 8419 ]] --[[ Name: new ]]
                        local v2250 = setmetatable({
                            OnPreview = v1144.Signal.new(), 
                            OnSelect = v1144.Signal.new(), 
                            OnCancel = v1144.Signal.new(), 
                            OnMoreColors = v1144.Signal.new(), 
                            PrevColor = Color3.new(0, 0, 0)
                        }, v2249);
                        v2230(v2250);
                        return v2250;
                    end
                };
            end)();
            v1144.ColorPicker = (function() --[[ Line: 8434 ]]
                local __ = {};
                return {
                    new = function() --[[ Line: 8437 ]] --[[ Name: new ]]
                        local v2252 = setmetatable({}, {});
                        v2252.OnSelect = v1144.Signal.new();
                        v2252.OnCancel = v1144.Signal.new();
                        v2252.OnPreview = v1144.Signal.new();
                        local v2253 = v1139({
                            {
                                1, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.17647059261799, 0.17647059261799, 0.17647059261799), 
                                    BorderSizePixel = 0, 
                                    ClipsDescendants = true, 
                                    Name = "Content", 
                                    Position = UDim2.new(0, 0, 0, 20), 
                                    Size = UDim2.new(1, 0, 1, -20)
                                }
                            }, 
                            {
                                2, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    Name = "BasicColors", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(0, 5, 0, 5), 
                                    Size = UDim2.new(0, 180, 0, 200)
                                }
                            }, 
                            {
                                3, 
                                "TextLabel", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    Font = 3, 
                                    Name = "Title", 
                                    Parent = {
                                        2
                                    }, 
                                    Position = UDim2.new(0, 0, 0, -5), 
                                    Size = UDim2.new(1, 0, 0, 26), 
                                    Text = "Basic Colors", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 0
                                }
                            }, 
                            {
                                4, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.14901961386204, 0.14901961386204, 0.14901961386204), 
                                    BorderColor3 = Color3.new(0.12549020349979, 0.12549020349979, 0.12549020349979), 
                                    Name = "Blue", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(1, -63, 0, 255), 
                                    Size = UDim2.new(0, 52, 0, 16)
                                }
                            }, 
                            {
                                5, 
                                "TextBox", 
                                {
                                    BackgroundColor3 = Color3.new(0.25098040699959, 0.25098040699959, 0.25098040699959), 
                                    BackgroundTransparency = 1, 
                                    BorderColor3 = Color3.new(0.37647062540054, 0.37647062540054, 0.37647062540054), 
                                    Font = 3, 
                                    Name = "Input", 
                                    Parent = {
                                        4
                                    }, 
                                    Position = UDim2.new(0, 2, 0, 0), 
                                    Size = UDim2.new(0, 50, 0, 16), 
                                    Text = "0", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 0
                                }
                            }, 
                            {
                                6, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    BorderSizePixel = 0, 
                                    Name = "ArrowFrame", 
                                    Parent = {
                                        5
                                    }, 
                                    Position = UDim2.new(1, -16, 0, 0), 
                                    Size = UDim2.new(0, 16, 1, 0)
                                }
                            }, 
                            {
                                7, 
                                "TextButton", 
                                {
                                    AutoButtonColor = false, 
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    BorderSizePixel = 0, 
                                    Font = 3, 
                                    Name = "Up", 
                                    Parent = {
                                        6
                                    }, 
                                    Size = UDim2.new(1, 0, 0, 8), 
                                    Text = "", 
                                    TextSize = 14
                                }
                            }, 
                            {
                                8, 
                                "Frame", 
                                {
                                    BackgroundTransparency = 1, 
                                    Name = "Arrow", 
                                    Parent = {
                                        7
                                    }, 
                                    Size = UDim2.new(0, 16, 0, 8)
                                }
                            }, 
                            {
                                9, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        8
                                    }, 
                                    Position = UDim2.new(0, 8, 0, 3), 
                                    Size = UDim2.new(0, 1, 0, 1)
                                }
                            }, 
                            {
                                10, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        8
                                    }, 
                                    Position = UDim2.new(0, 7, 0, 4), 
                                    Size = UDim2.new(0, 3, 0, 1)
                                }
                            }, 
                            {
                                11, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        8
                                    }, 
                                    Position = UDim2.new(0, 6, 0, 5), 
                                    Size = UDim2.new(0, 5, 0, 1)
                                }
                            }, 
                            {
                                12, 
                                "TextButton", 
                                {
                                    AutoButtonColor = false, 
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    BorderSizePixel = 0, 
                                    Font = 3, 
                                    Name = "Down", 
                                    Parent = {
                                        6
                                    }, 
                                    Position = UDim2.new(0, 0, 0, 8), 
                                    Size = UDim2.new(1, 0, 0, 8), 
                                    Text = "", 
                                    TextSize = 14
                                }
                            }, 
                            {
                                13, 
                                "Frame", 
                                {
                                    BackgroundTransparency = 1, 
                                    Name = "Arrow", 
                                    Parent = {
                                        12
                                    }, 
                                    Size = UDim2.new(0, 16, 0, 8)
                                }
                            }, 
                            {
                                14, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        13
                                    }, 
                                    Position = UDim2.new(0, 8, 0, 5), 
                                    Size = UDim2.new(0, 1, 0, 1)
                                }
                            }, 
                            {
                                15, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        13
                                    }, 
                                    Position = UDim2.new(0, 7, 0, 4), 
                                    Size = UDim2.new(0, 3, 0, 1)
                                }
                            }, 
                            {
                                16, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        13
                                    }, 
                                    Position = UDim2.new(0, 6, 0, 3), 
                                    Size = UDim2.new(0, 5, 0, 1)
                                }
                            }, 
                            {
                                17, 
                                "TextLabel", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    Font = 3, 
                                    Name = "Title", 
                                    Parent = {
                                        4
                                    }, 
                                    Position = UDim2.new(0, -40, 0, 0), 
                                    Size = UDim2.new(0, 34, 1, 0), 
                                    Text = "Blue:", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 1
                                }
                            }, 
                            {
                                18, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.21568627655506, 0.21568627655506, 0.21568627655506), 
                                    BorderSizePixel = 0, 
                                    ClipsDescendants = true, 
                                    Name = "ColorSpaceFrame", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(1, -261, 0, 4), 
                                    Size = UDim2.new(0, 222, 0, 202)
                                }
                            }, 
                            {
                                19, 
                                "ImageLabel", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BorderColor3 = Color3.new(0.37647062540054, 0.37647062540054, 0.37647062540054), 
                                    BorderSizePixel = 0, 
                                    Image = "rbxassetid://1072518406", 
                                    Name = "ColorSpace", 
                                    Parent = {
                                        18
                                    }, 
                                    Position = UDim2.new(0, 1, 0, 1), 
                                    Size = UDim2.new(0, 220, 0, 200)
                                }
                            }, 
                            {
                                20, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    BorderSizePixel = 0, 
                                    Name = "Scope", 
                                    Parent = {
                                        19
                                    }, 
                                    Position = UDim2.new(0, 210, 0, 190), 
                                    Size = UDim2.new(0, 20, 0, 20)
                                }
                            }, 
                            {
                                21, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0, 0, 0), 
                                    BorderSizePixel = 0, 
                                    Name = "Line", 
                                    Parent = {
                                        20
                                    }, 
                                    Position = UDim2.new(0, 9, 0, 0), 
                                    Size = UDim2.new(0, 2, 0, 20)
                                }
                            }, 
                            {
                                22, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0, 0, 0), 
                                    BorderSizePixel = 0, 
                                    Name = "Line", 
                                    Parent = {
                                        20
                                    }, 
                                    Position = UDim2.new(0, 0, 0, 9), 
                                    Size = UDim2.new(0, 20, 0, 2)
                                }
                            }, 
                            {
                                23, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    Name = "CustomColors", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(0, 5, 0, 210), 
                                    Size = UDim2.new(0, 180, 0, 90)
                                }
                            }, 
                            {
                                24, 
                                "TextLabel", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    Font = 3, 
                                    Name = "Title", 
                                    Parent = {
                                        23
                                    }, 
                                    Size = UDim2.new(1, 0, 0, 20), 
                                    Text = "Custom Colors (RC = Set)", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 0
                                }
                            }, 
                            {
                                25, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.14901961386204, 0.14901961386204, 0.14901961386204), 
                                    BorderColor3 = Color3.new(0.12549020349979, 0.12549020349979, 0.12549020349979), 
                                    Name = "Green", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(1, -63, 0, 233), 
                                    Size = UDim2.new(0, 52, 0, 16)
                                }
                            }, 
                            {
                                26, 
                                "TextBox", 
                                {
                                    BackgroundColor3 = Color3.new(0.25098040699959, 0.25098040699959, 0.25098040699959), 
                                    BackgroundTransparency = 1, 
                                    BorderColor3 = Color3.new(0.37647062540054, 0.37647062540054, 0.37647062540054), 
                                    Font = 3, 
                                    Name = "Input", 
                                    Parent = {
                                        25
                                    }, 
                                    Position = UDim2.new(0, 2, 0, 0), 
                                    Size = UDim2.new(0, 50, 0, 16), 
                                    Text = "0", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 0
                                }
                            }, 
                            {
                                27, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    BorderSizePixel = 0, 
                                    Name = "ArrowFrame", 
                                    Parent = {
                                        26
                                    }, 
                                    Position = UDim2.new(1, -16, 0, 0), 
                                    Size = UDim2.new(0, 16, 1, 0)
                                }
                            }, 
                            {
                                28, 
                                "TextButton", 
                                {
                                    AutoButtonColor = false, 
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    BorderSizePixel = 0, 
                                    Font = 3, 
                                    Name = "Up", 
                                    Parent = {
                                        27
                                    }, 
                                    Size = UDim2.new(1, 0, 0, 8), 
                                    Text = "", 
                                    TextSize = 14
                                }
                            }, 
                            {
                                29, 
                                "Frame", 
                                {
                                    BackgroundTransparency = 1, 
                                    Name = "Arrow", 
                                    Parent = {
                                        28
                                    }, 
                                    Size = UDim2.new(0, 16, 0, 8)
                                }
                            }, 
                            {
                                30, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        29
                                    }, 
                                    Position = UDim2.new(0, 8, 0, 3), 
                                    Size = UDim2.new(0, 1, 0, 1)
                                }
                            }, 
                            {
                                31, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        29
                                    }, 
                                    Position = UDim2.new(0, 7, 0, 4), 
                                    Size = UDim2.new(0, 3, 0, 1)
                                }
                            }, 
                            {
                                32, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        29
                                    }, 
                                    Position = UDim2.new(0, 6, 0, 5), 
                                    Size = UDim2.new(0, 5, 0, 1)
                                }
                            }, 
                            {
                                33, 
                                "TextButton", 
                                {
                                    AutoButtonColor = false, 
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    BorderSizePixel = 0, 
                                    Font = 3, 
                                    Name = "Down", 
                                    Parent = {
                                        27
                                    }, 
                                    Position = UDim2.new(0, 0, 0, 8), 
                                    Size = UDim2.new(1, 0, 0, 8), 
                                    Text = "", 
                                    TextSize = 14
                                }
                            }, 
                            {
                                34, 
                                "Frame", 
                                {
                                    BackgroundTransparency = 1, 
                                    Name = "Arrow", 
                                    Parent = {
                                        33
                                    }, 
                                    Size = UDim2.new(0, 16, 0, 8)
                                }
                            }, 
                            {
                                35, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        34
                                    }, 
                                    Position = UDim2.new(0, 8, 0, 5), 
                                    Size = UDim2.new(0, 1, 0, 1)
                                }
                            }, 
                            {
                                36, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        34
                                    }, 
                                    Position = UDim2.new(0, 7, 0, 4), 
                                    Size = UDim2.new(0, 3, 0, 1)
                                }
                            }, 
                            {
                                37, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        34
                                    }, 
                                    Position = UDim2.new(0, 6, 0, 3), 
                                    Size = UDim2.new(0, 5, 0, 1)
                                }
                            }, 
                            {
                                38, 
                                "TextLabel", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    Font = 3, 
                                    Name = "Title", 
                                    Parent = {
                                        25
                                    }, 
                                    Position = UDim2.new(0, -40, 0, 0), 
                                    Size = UDim2.new(0, 34, 1, 0), 
                                    Text = "Green:", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 1
                                }
                            }, 
                            {
                                39, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.14901961386204, 0.14901961386204, 0.14901961386204), 
                                    BorderColor3 = Color3.new(0.12549020349979, 0.12549020349979, 0.12549020349979), 
                                    Name = "Hue", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(1, -180, 0, 211), 
                                    Size = UDim2.new(0, 52, 0, 16)
                                }
                            }, 
                            {
                                40, 
                                "TextBox", 
                                {
                                    BackgroundColor3 = Color3.new(0.25098040699959, 0.25098040699959, 0.25098040699959), 
                                    BackgroundTransparency = 1, 
                                    BorderColor3 = Color3.new(0.37647062540054, 0.37647062540054, 0.37647062540054), 
                                    Font = 3, 
                                    Name = "Input", 
                                    Parent = {
                                        39
                                    }, 
                                    Position = UDim2.new(0, 2, 0, 0), 
                                    Size = UDim2.new(0, 50, 0, 16), 
                                    Text = "0", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 0
                                }
                            }, 
                            {
                                41, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    BorderSizePixel = 0, 
                                    Name = "ArrowFrame", 
                                    Parent = {
                                        40
                                    }, 
                                    Position = UDim2.new(1, -16, 0, 0), 
                                    Size = UDim2.new(0, 16, 1, 0)
                                }
                            }, 
                            {
                                42, 
                                "TextButton", 
                                {
                                    AutoButtonColor = false, 
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    BorderSizePixel = 0, 
                                    Font = 3, 
                                    Name = "Up", 
                                    Parent = {
                                        41
                                    }, 
                                    Size = UDim2.new(1, 0, 0, 8), 
                                    Text = "", 
                                    TextSize = 14
                                }
                            }, 
                            {
                                43, 
                                "Frame", 
                                {
                                    BackgroundTransparency = 1, 
                                    Name = "Arrow", 
                                    Parent = {
                                        42
                                    }, 
                                    Size = UDim2.new(0, 16, 0, 8)
                                }
                            }, 
                            {
                                44, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        43
                                    }, 
                                    Position = UDim2.new(0, 8, 0, 3), 
                                    Size = UDim2.new(0, 1, 0, 1)
                                }
                            }, 
                            {
                                45, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        43
                                    }, 
                                    Position = UDim2.new(0, 7, 0, 4), 
                                    Size = UDim2.new(0, 3, 0, 1)
                                }
                            }, 
                            {
                                46, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        43
                                    }, 
                                    Position = UDim2.new(0, 6, 0, 5), 
                                    Size = UDim2.new(0, 5, 0, 1)
                                }
                            }, 
                            {
                                47, 
                                "TextButton", 
                                {
                                    AutoButtonColor = false, 
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    BorderSizePixel = 0, 
                                    Font = 3, 
                                    Name = "Down", 
                                    Parent = {
                                        41
                                    }, 
                                    Position = UDim2.new(0, 0, 0, 8), 
                                    Size = UDim2.new(1, 0, 0, 8), 
                                    Text = "", 
                                    TextSize = 14
                                }
                            }, 
                            {
                                48, 
                                "Frame", 
                                {
                                    BackgroundTransparency = 1, 
                                    Name = "Arrow", 
                                    Parent = {
                                        47
                                    }, 
                                    Size = UDim2.new(0, 16, 0, 8)
                                }
                            }, 
                            {
                                49, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        48
                                    }, 
                                    Position = UDim2.new(0, 8, 0, 5), 
                                    Size = UDim2.new(0, 1, 0, 1)
                                }
                            }, 
                            {
                                50, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        48
                                    }, 
                                    Position = UDim2.new(0, 7, 0, 4), 
                                    Size = UDim2.new(0, 3, 0, 1)
                                }
                            }, 
                            {
                                51, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        48
                                    }, 
                                    Position = UDim2.new(0, 6, 0, 3), 
                                    Size = UDim2.new(0, 5, 0, 1)
                                }
                            }, 
                            {
                                52, 
                                "TextLabel", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    Font = 3, 
                                    Name = "Title", 
                                    Parent = {
                                        39
                                    }, 
                                    Position = UDim2.new(0, -40, 0, 0), 
                                    Size = UDim2.new(0, 34, 1, 0), 
                                    Text = "Hue:", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 1
                                }
                            }, 
                            {
                                53, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BorderColor3 = Color3.new(0.21568627655506, 0.21568627655506, 0.21568627655506), 
                                    Name = "Preview", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(1, -260, 0, 211), 
                                    Size = UDim2.new(0, 35, 1, -245)
                                }
                            }, 
                            {
                                54, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.14901961386204, 0.14901961386204, 0.14901961386204), 
                                    BorderColor3 = Color3.new(0.12549020349979, 0.12549020349979, 0.12549020349979), 
                                    Name = "Red", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(1, -63, 0, 211), 
                                    Size = UDim2.new(0, 52, 0, 16)
                                }
                            }, 
                            {
                                55, 
                                "TextBox", 
                                {
                                    BackgroundColor3 = Color3.new(0.25098040699959, 0.25098040699959, 0.25098040699959), 
                                    BackgroundTransparency = 1, 
                                    BorderColor3 = Color3.new(0.37647062540054, 0.37647062540054, 0.37647062540054), 
                                    Font = 3, 
                                    Name = "Input", 
                                    Parent = {
                                        54
                                    }, 
                                    Position = UDim2.new(0, 2, 0, 0), 
                                    Size = UDim2.new(0, 50, 0, 16), 
                                    Text = "0", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 0
                                }
                            }, 
                            {
                                56, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    BorderSizePixel = 0, 
                                    Name = "ArrowFrame", 
                                    Parent = {
                                        55
                                    }, 
                                    Position = UDim2.new(1, -16, 0, 0), 
                                    Size = UDim2.new(0, 16, 1, 0)
                                }
                            }, 
                            {
                                57, 
                                "TextButton", 
                                {
                                    AutoButtonColor = false, 
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    BorderSizePixel = 0, 
                                    Font = 3, 
                                    Name = "Up", 
                                    Parent = {
                                        56
                                    }, 
                                    Size = UDim2.new(1, 0, 0, 8), 
                                    Text = "", 
                                    TextSize = 14
                                }
                            }, 
                            {
                                58, 
                                "Frame", 
                                {
                                    BackgroundTransparency = 1, 
                                    Name = "Arrow", 
                                    Parent = {
                                        57
                                    }, 
                                    Size = UDim2.new(0, 16, 0, 8)
                                }
                            }, 
                            {
                                59, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        58
                                    }, 
                                    Position = UDim2.new(0, 8, 0, 3), 
                                    Size = UDim2.new(0, 1, 0, 1)
                                }
                            }, 
                            {
                                60, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        58
                                    }, 
                                    Position = UDim2.new(0, 7, 0, 4), 
                                    Size = UDim2.new(0, 3, 0, 1)
                                }
                            }, 
                            {
                                61, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        58
                                    }, 
                                    Position = UDim2.new(0, 6, 0, 5), 
                                    Size = UDim2.new(0, 5, 0, 1)
                                }
                            }, 
                            {
                                62, 
                                "TextButton", 
                                {
                                    AutoButtonColor = false, 
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    BorderSizePixel = 0, 
                                    Font = 3, 
                                    Name = "Down", 
                                    Parent = {
                                        56
                                    }, 
                                    Position = UDim2.new(0, 0, 0, 8), 
                                    Size = UDim2.new(1, 0, 0, 8), 
                                    Text = "", 
                                    TextSize = 14
                                }
                            }, 
                            {
                                63, 
                                "Frame", 
                                {
                                    BackgroundTransparency = 1, 
                                    Name = "Arrow", 
                                    Parent = {
                                        62
                                    }, 
                                    Size = UDim2.new(0, 16, 0, 8)
                                }
                            }, 
                            {
                                64, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        63
                                    }, 
                                    Position = UDim2.new(0, 8, 0, 5), 
                                    Size = UDim2.new(0, 1, 0, 1)
                                }
                            }, 
                            {
                                65, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        63
                                    }, 
                                    Position = UDim2.new(0, 7, 0, 4), 
                                    Size = UDim2.new(0, 3, 0, 1)
                                }
                            }, 
                            {
                                66, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        63
                                    }, 
                                    Position = UDim2.new(0, 6, 0, 3), 
                                    Size = UDim2.new(0, 5, 0, 1)
                                }
                            }, 
                            {
                                67, 
                                "TextLabel", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    Font = 3, 
                                    Name = "Title", 
                                    Parent = {
                                        54
                                    }, 
                                    Position = UDim2.new(0, -40, 0, 0), 
                                    Size = UDim2.new(0, 34, 1, 0), 
                                    Text = "Red:", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 1
                                }
                            }, 
                            {
                                68, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.14901961386204, 0.14901961386204, 0.14901961386204), 
                                    BorderColor3 = Color3.new(0.12549020349979, 0.12549020349979, 0.12549020349979), 
                                    Name = "Sat", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(1, -180, 0, 233), 
                                    Size = UDim2.new(0, 52, 0, 16)
                                }
                            }, 
                            {
                                69, 
                                "TextBox", 
                                {
                                    BackgroundColor3 = Color3.new(0.25098040699959, 0.25098040699959, 0.25098040699959), 
                                    BackgroundTransparency = 1, 
                                    BorderColor3 = Color3.new(0.37647062540054, 0.37647062540054, 0.37647062540054), 
                                    Font = 3, 
                                    Name = "Input", 
                                    Parent = {
                                        68
                                    }, 
                                    Position = UDim2.new(0, 2, 0, 0), 
                                    Size = UDim2.new(0, 50, 0, 16), 
                                    Text = "0", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 0
                                }
                            }, 
                            {
                                70, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    BorderSizePixel = 0, 
                                    Name = "ArrowFrame", 
                                    Parent = {
                                        69
                                    }, 
                                    Position = UDim2.new(1, -16, 0, 0), 
                                    Size = UDim2.new(0, 16, 1, 0)
                                }
                            }, 
                            {
                                71, 
                                "TextButton", 
                                {
                                    AutoButtonColor = false, 
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    BorderSizePixel = 0, 
                                    Font = 3, 
                                    Name = "Up", 
                                    Parent = {
                                        70
                                    }, 
                                    Size = UDim2.new(1, 0, 0, 8), 
                                    Text = "", 
                                    TextSize = 14
                                }
                            }, 
                            {
                                72, 
                                "Frame", 
                                {
                                    BackgroundTransparency = 1, 
                                    Name = "Arrow", 
                                    Parent = {
                                        71
                                    }, 
                                    Size = UDim2.new(0, 16, 0, 8)
                                }
                            }, 
                            {
                                73, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        72
                                    }, 
                                    Position = UDim2.new(0, 8, 0, 3), 
                                    Size = UDim2.new(0, 1, 0, 1)
                                }
                            }, 
                            {
                                74, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        72
                                    }, 
                                    Position = UDim2.new(0, 7, 0, 4), 
                                    Size = UDim2.new(0, 3, 0, 1)
                                }
                            }, 
                            {
                                75, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        72
                                    }, 
                                    Position = UDim2.new(0, 6, 0, 5), 
                                    Size = UDim2.new(0, 5, 0, 1)
                                }
                            }, 
                            {
                                76, 
                                "TextButton", 
                                {
                                    AutoButtonColor = false, 
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    BorderSizePixel = 0, 
                                    Font = 3, 
                                    Name = "Down", 
                                    Parent = {
                                        70
                                    }, 
                                    Position = UDim2.new(0, 0, 0, 8), 
                                    Size = UDim2.new(1, 0, 0, 8), 
                                    Text = "", 
                                    TextSize = 14
                                }
                            }, 
                            {
                                77, 
                                "Frame", 
                                {
                                    BackgroundTransparency = 1, 
                                    Name = "Arrow", 
                                    Parent = {
                                        76
                                    }, 
                                    Size = UDim2.new(0, 16, 0, 8)
                                }
                            }, 
                            {
                                78, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        77
                                    }, 
                                    Position = UDim2.new(0, 8, 0, 5), 
                                    Size = UDim2.new(0, 1, 0, 1)
                                }
                            }, 
                            {
                                79, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        77
                                    }, 
                                    Position = UDim2.new(0, 7, 0, 4), 
                                    Size = UDim2.new(0, 3, 0, 1)
                                }
                            }, 
                            {
                                80, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        77
                                    }, 
                                    Position = UDim2.new(0, 6, 0, 3), 
                                    Size = UDim2.new(0, 5, 0, 1)
                                }
                            }, 
                            {
                                81, 
                                "TextLabel", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    Font = 3, 
                                    Name = "Title", 
                                    Parent = {
                                        68
                                    }, 
                                    Position = UDim2.new(0, -40, 0, 0), 
                                    Size = UDim2.new(0, 34, 1, 0), 
                                    Text = "Sat:", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 1
                                }
                            }, 
                            {
                                82, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.14901961386204, 0.14901961386204, 0.14901961386204), 
                                    BorderColor3 = Color3.new(0.12549020349979, 0.12549020349979, 0.12549020349979), 
                                    Name = "Val", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(1, -180, 0, 255), 
                                    Size = UDim2.new(0, 52, 0, 16)
                                }
                            }, 
                            {
                                83, 
                                "TextBox", 
                                {
                                    BackgroundColor3 = Color3.new(0.25098040699959, 0.25098040699959, 0.25098040699959), 
                                    BackgroundTransparency = 1, 
                                    BorderColor3 = Color3.new(0.37647062540054, 0.37647062540054, 0.37647062540054), 
                                    Font = 3, 
                                    Name = "Input", 
                                    Parent = {
                                        82
                                    }, 
                                    Position = UDim2.new(0, 2, 0, 0), 
                                    Size = UDim2.new(0, 50, 0, 16), 
                                    Text = "255", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 0
                                }
                            }, 
                            {
                                84, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    BorderSizePixel = 0, 
                                    Name = "ArrowFrame", 
                                    Parent = {
                                        83
                                    }, 
                                    Position = UDim2.new(1, -16, 0, 0), 
                                    Size = UDim2.new(0, 16, 1, 0)
                                }
                            }, 
                            {
                                85, 
                                "TextButton", 
                                {
                                    AutoButtonColor = false, 
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    BorderSizePixel = 0, 
                                    Font = 3, 
                                    Name = "Up", 
                                    Parent = {
                                        84
                                    }, 
                                    Size = UDim2.new(1, 0, 0, 8), 
                                    Text = "", 
                                    TextSize = 14
                                }
                            }, 
                            {
                                86, 
                                "Frame", 
                                {
                                    BackgroundTransparency = 1, 
                                    Name = "Arrow", 
                                    Parent = {
                                        85
                                    }, 
                                    Size = UDim2.new(0, 16, 0, 8)
                                }
                            }, 
                            {
                                87, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        86
                                    }, 
                                    Position = UDim2.new(0, 8, 0, 3), 
                                    Size = UDim2.new(0, 1, 0, 1)
                                }
                            }, 
                            {
                                88, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        86
                                    }, 
                                    Position = UDim2.new(0, 7, 0, 4), 
                                    Size = UDim2.new(0, 3, 0, 1)
                                }
                            }, 
                            {
                                89, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        86
                                    }, 
                                    Position = UDim2.new(0, 6, 0, 5), 
                                    Size = UDim2.new(0, 5, 0, 1)
                                }
                            }, 
                            {
                                90, 
                                "TextButton", 
                                {
                                    AutoButtonColor = false, 
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    BorderSizePixel = 0, 
                                    Font = 3, 
                                    Name = "Down", 
                                    Parent = {
                                        84
                                    }, 
                                    Position = UDim2.new(0, 0, 0, 8), 
                                    Size = UDim2.new(1, 0, 0, 8), 
                                    Text = "", 
                                    TextSize = 14
                                }
                            }, 
                            {
                                91, 
                                "Frame", 
                                {
                                    BackgroundTransparency = 1, 
                                    Name = "Arrow", 
                                    Parent = {
                                        90
                                    }, 
                                    Size = UDim2.new(0, 16, 0, 8)
                                }
                            }, 
                            {
                                92, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        91
                                    }, 
                                    Position = UDim2.new(0, 8, 0, 5), 
                                    Size = UDim2.new(0, 1, 0, 1)
                                }
                            }, 
                            {
                                93, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        91
                                    }, 
                                    Position = UDim2.new(0, 7, 0, 4), 
                                    Size = UDim2.new(0, 3, 0, 1)
                                }
                            }, 
                            {
                                94, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        91
                                    }, 
                                    Position = UDim2.new(0, 6, 0, 3), 
                                    Size = UDim2.new(0, 5, 0, 1)
                                }
                            }, 
                            {
                                95, 
                                "TextLabel", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    Font = 3, 
                                    Name = "Title", 
                                    Parent = {
                                        82
                                    }, 
                                    Position = UDim2.new(0, -40, 0, 0), 
                                    Size = UDim2.new(0, 34, 1, 0), 
                                    Text = "Val:", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 1
                                }
                            }, 
                            {
                                96, 
                                "TextButton", 
                                {
                                    AutoButtonColor = false, 
                                    BackgroundColor3 = Color3.new(0.2352941185236, 0.2352941185236, 0.2352941185236), 
                                    BorderColor3 = Color3.new(0.21568627655506, 0.21568627655506, 0.21568627655506), 
                                    Font = 3, 
                                    Name = "Cancel", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(1, -105, 1, -28), 
                                    Size = UDim2.new(0, 100, 0, 25), 
                                    Text = "Cancel", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14
                                }
                            }, 
                            {
                                97, 
                                "TextButton", 
                                {
                                    AutoButtonColor = false, 
                                    BackgroundColor3 = Color3.new(0.2352941185236, 0.2352941185236, 0.2352941185236), 
                                    BorderColor3 = Color3.new(0.21568627655506, 0.21568627655506, 0.21568627655506), 
                                    Font = 3, 
                                    Name = "Ok", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(1, -210, 1, -28), 
                                    Size = UDim2.new(0, 100, 0, 25), 
                                    Text = "OK", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14
                                }
                            }, 
                            {
                                98, 
                                "ImageLabel", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BorderColor3 = Color3.new(0.21568627655506, 0.21568627655506, 0.21568627655506), 
                                    Image = "rbxassetid://1072518502", 
                                    Name = "ColorStrip", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(1, -30, 0, 5), 
                                    Size = UDim2.new(0, 13, 0, 200)
                                }
                            }, 
                            {
                                99, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.3137255012989, 0.3137255012989, 0.3137255012989), 
                                    BackgroundTransparency = 1, 
                                    BorderSizePixel = 0, 
                                    Name = "ArrowFrame", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(1, -16, 0, 1), 
                                    Size = UDim2.new(0, 5, 0, 208)
                                }
                            }, 
                            {
                                100, 
                                "Frame", 
                                {
                                    BackgroundTransparency = 1, 
                                    Name = "Arrow", 
                                    Parent = {
                                        99
                                    }, 
                                    Position = UDim2.new(0, -2, 0, -4), 
                                    Size = UDim2.new(0, 8, 0, 16)
                                }
                            }, 
                            {
                                101, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0, 0, 0), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        100
                                    }, 
                                    Position = UDim2.new(0, 2, 0, 8), 
                                    Size = UDim2.new(0, 1, 0, 1)
                                }
                            }, 
                            {
                                102, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0, 0, 0), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        100
                                    }, 
                                    Position = UDim2.new(0, 3, 0, 7), 
                                    Size = UDim2.new(0, 1, 0, 3)
                                }
                            }, 
                            {
                                103, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0, 0, 0), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        100
                                    }, 
                                    Position = UDim2.new(0, 4, 0, 6), 
                                    Size = UDim2.new(0, 1, 0, 5)
                                }
                            }, 
                            {
                                104, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0, 0, 0), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        100
                                    }, 
                                    Position = UDim2.new(0, 5, 0, 5), 
                                    Size = UDim2.new(0, 1, 0, 7)
                                }
                            }, 
                            {
                                105, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0, 0, 0), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        100
                                    }, 
                                    Position = UDim2.new(0, 6, 0, 4), 
                                    Size = UDim2.new(0, 1, 0, 9)
                                }
                            }
                        });
                        local v2254 = v1144.Window.new();
                        v2254.Resizable = false;
                        v2254.Alignable = false;
                        v2254:SetTitle("Color Picker");
                        v2254:Resize(450, 330);
                        for __, v2256 in pairs(v2253:GetChildren()) do
                            v2256.Parent = v2254.GuiElems.Content;
                        end;
                        v2252.Window = v2254;
                        v2252.Gui = v2254.Gui;
                        local l_Main_2 = v2254.Gui.Main;
                        local l_TopBar_1 = l_Main_2.TopBar;
                        local l_Content_0 = l_Main_2.Content;
                        local l_ColorSpace_0 = l_Content_0.ColorSpaceFrame.ColorSpace;
                        local l_ColorStrip_0 = l_Content_0.ColorStrip;
                        local l_Preview_0 = l_Content_0.Preview;
                        local l_BasicColors_0 = l_Content_0.BasicColors;
                        local l_CustomColors_0 = l_Content_0.CustomColors;
                        local l_Ok_0 = l_Content_0.Ok;
                        local l_Cancel_0 = l_Content_0.Cancel;
                        local __ = l_TopBar_1.Close;
                        local l_Scope_0 = l_ColorSpace_0.Scope;
                        local l_Arrow_0 = l_Content_0.ArrowFrame.Arrow;
                        local l_Input_0 = l_Content_0.Hue.Input;
                        local l_Input_1 = l_Content_0.Sat.Input;
                        local l_Input_2 = l_Content_0.Val.Input;
                        local l_Input_3 = l_Content_0.Red.Input;
                        local l_Input_4 = l_Content_0.Green.Input;
                        local l_Input_5 = l_Content_0.Blue.Input;
                        local v2276 = v2(game:GetService("UserInputService"));
                        local l_Mouse_4 = v2(game:GetService("Players")).LocalPlayer:GetMouse();
                        local v2278 = 0;
                        local v2279 = 0;
                        local v2280 = 1;
                        local v2281 = 1;
                        local v2282 = 1;
                        local v2283 = 1;
                        local v2284 = Color3.new(0, 0, 0);
                        local v2285 = {
                            Color3.new(0, 0, 0), 
                            Color3.new(0.66666668653488, 0, 0), 
                            Color3.new(0, 0.33333334326744, 0), 
                            Color3.new(0.66666668653488, 0.33333334326744, 0), 
                            Color3.new(0, 0.66666668653488, 0), 
                            Color3.new(0.66666668653488, 0.66666668653488, 0), 
                            Color3.new(0, 1, 0), 
                            Color3.new(0.66666668653488, 1, 0), 
                            Color3.new(0, 0, 0.49803924560547), 
                            Color3.new(0.66666668653488, 0, 0.49803924560547), 
                            Color3.new(0, 0.33333334326744, 0.49803924560547), 
                            Color3.new(0.66666668653488, 0.33333334326744, 0.49803924560547), 
                            Color3.new(0, 0.66666668653488, 0.49803924560547), 
                            Color3.new(0.66666668653488, 0.66666668653488, 0.49803924560547), 
                            Color3.new(0, 1, 0.49803924560547), 
                            Color3.new(0.66666668653488, 1, 0.49803924560547), 
                            Color3.new(0, 0, 1), 
                            Color3.new(0.66666668653488, 0, 1), 
                            Color3.new(0, 0.33333334326744, 1), 
                            Color3.new(0.66666668653488, 0.33333334326744, 1), 
                            Color3.new(0, 0.66666668653488, 1), 
                            Color3.new(0.66666668653488, 0.66666668653488, 1), 
                            Color3.new(0, 1, 1), 
                            Color3.new(0.66666668653488, 1, 1), 
                            Color3.new(0.33333334326744, 0, 0), 
                            Color3.new(1, 0, 0), 
                            Color3.new(0.33333334326744, 0.33333334326744, 0), 
                            Color3.new(1, 0.33333334326744, 0), 
                            Color3.new(0.33333334326744, 0.66666668653488, 0), 
                            Color3.new(1, 0.66666668653488, 0), 
                            Color3.new(0.33333334326744, 1, 0), 
                            Color3.new(1, 1, 0), 
                            Color3.new(0.33333334326744, 0, 0.49803924560547), 
                            Color3.new(1, 0, 0.49803924560547), 
                            Color3.new(0.33333334326744, 0.33333334326744, 0.49803924560547), 
                            Color3.new(1, 0.33333334326744, 0.49803924560547), 
                            Color3.new(0.33333334326744, 0.66666668653488, 0.49803924560547), 
                            Color3.new(1, 0.66666668653488, 0.49803924560547), 
                            Color3.new(0.33333334326744, 1, 0.49803924560547), 
                            Color3.new(1, 1, 0.49803924560547), 
                            Color3.new(0.33333334326744, 0, 1), 
                            Color3.new(1, 0, 1), 
                            Color3.new(0.33333334326744, 0.33333334326744, 1), 
                            Color3.new(1, 0.33333334326744, 1), 
                            Color3.new(0.33333334326744, 0.66666668653488, 1), 
                            Color3.new(1, 0.66666668653488, 1), 
                            Color3.new(0.33333334326744, 1, 1), 
                            Color3.new(1, 1, 1)
                        };
                        local v2286 = {};
                        local function v2292(v2287) --[[ Line: 8594 ]] --[[ Name: updateColor ]]
                            local v2288 = 219 - v2278 * 219;
                            local v2289 = 199 - v2279 * 199;
                            local v2290 = 199 - v2280 * 199;
                            local __ = Color3.fromHSV(v2278, v2279, v2280);
                            if v2287 == 2 or not v2287 then
                                l_Input_0.Text = tostring((math.ceil(359 * v2278)));
                                l_Input_1.Text = tostring((math.ceil(255 * v2279)));
                                l_Input_2.Text = tostring((math.floor(255 * v2280)));
                            end;
                            if v2287 == 1 or not v2287 then
                                l_Input_3.Text = tostring((math.floor(255 * v2281)));
                                l_Input_4.Text = tostring((math.floor(255 * v2282)));
                                l_Input_5.Text = tostring((math.floor(255 * v2283)));
                            end;
                            v2284 = Color3.new(v2281, v2282, v2283);
                            l_Scope_0.Position = UDim2.new(0, v2288 - 9, 0, v2289 - 9);
                            l_ColorStrip_0.ImageColor3 = Color3.fromHSV(v2278, v2279, 1);
                            l_Arrow_0.Position = UDim2.new(0, -2, 0, v2290 - 4);
                            l_Preview_0.BackgroundColor3 = v2284;
                            v2252.Color = v2284;
                            v2252.OnPreview:Fire(v2284);
                        end;
                        local function v2299() --[[ Line: 8620 ]] --[[ Name: colorSpaceInput ]]
                            local v2293 = l_Mouse_4.X - l_ColorSpace_0.AbsolutePosition.X;
                            local v2294 = l_Mouse_4.Y - l_ColorSpace_0.AbsolutePosition.Y;
                            if v2293 < 0 then
                                v2293 = 0;
                            elseif v2293 > 219 then
                                v2293 = 219;
                            end;
                            if v2294 < 0 then
                                v2294 = 0;
                            elseif v2294 > 199 then
                                v2294 = 199;
                            end;
                            v2278 = (219 - v2293) / 219;
                            v2279 = (199 - v2294) / 199;
                            local v2295 = Color3.fromHSV(v2278, v2279, v2280);
                            local l_r_0 = v2295.r;
                            local l_g_0 = v2295.g;
                            local l_b_0 = v2295.b;
                            v2281 = l_r_0;
                            v2282 = l_g_0;
                            v2283 = l_b_0;
                            v2292();
                        end;
                        local function v2305() --[[ Line: 8636 ]] --[[ Name: colorStripInput ]]
                            local v2300 = l_Mouse_4.Y - l_ColorStrip_0.AbsolutePosition.Y;
                            if v2300 < 0 then
                                v2300 = 0;
                            elseif v2300 > 199 then
                                v2300 = 199;
                            end;
                            v2280 = (199 - v2300) / 199;
                            local v2301 = Color3.fromHSV(v2278, v2279, v2280);
                            local l_r_1 = v2301.r;
                            local l_g_1 = v2301.g;
                            local l_b_1 = v2301.b;
                            v2281 = l_r_1;
                            v2282 = l_g_1;
                            v2283 = l_b_1;
                            v2292();
                        end;
                        local function v2328(v2306, v2307) --[[ Line: 8649 ]] --[[ Name: hookButtons ]]
                            v2306.ArrowFrame.Up.InputBegan:Connect(function(v2308) --[[ Line: 8650 ]]
                                if v2308.UserInputType == Enum.UserInputType.MouseMovement then
                                    v2306.ArrowFrame.Up.BackgroundTransparency = 0.5;
                                    return;
                                else
                                    if v2308.UserInputType == Enum.UserInputType.MouseButton1 then
                                        local v2309 = nil;
                                        local __ = nil;
                                        local v2311 = tick();
                                        local v2312 = true;
                                        local v2313 = tonumber(v2306.Text);
                                        if not v2313 then
                                            return;
                                        else
                                            do
                                                local l_v2309_0, l_v2312_0 = v2309, v2312;
                                                l_v2309_0 = v2276.InputEnded:Connect(function(v2316) --[[ Line: 8662 ]]
                                                    if v2316.UserInputType ~= Enum.UserInputType.MouseButton1 then
                                                        return;
                                                    else
                                                        l_v2309_0:Disconnect();
                                                        l_v2312_0 = false;
                                                        return;
                                                    end;
                                                end);
                                                v2313 = v2313 + 1;
                                                v2307(v2313);
                                                while l_v2312_0 do
                                                    if tick() - v2311 > 0.3 then
                                                        v2313 = v2313 + 1;
                                                        v2307(v2313);
                                                    end;
                                                    wait(0.1);
                                                end;
                                            end;
                                        end;
                                    end;
                                    return;
                                end;
                            end);
                            v2306.ArrowFrame.Up.InputEnded:Connect(function(v2317) --[[ Line: 8680 ]]
                                if v2317.UserInputType == Enum.UserInputType.MouseMovement then
                                    v2306.ArrowFrame.Up.BackgroundTransparency = 1;
                                end;
                            end);
                            v2306.ArrowFrame.Down.InputBegan:Connect(function(v2318) --[[ Line: 8686 ]]
                                if v2318.UserInputType == Enum.UserInputType.MouseMovement then
                                    v2306.ArrowFrame.Down.BackgroundTransparency = 0.5;
                                    return;
                                else
                                    if v2318.UserInputType == Enum.UserInputType.MouseButton1 then
                                        local v2319 = nil;
                                        local __ = nil;
                                        local v2321 = tick();
                                        local v2322 = true;
                                        local v2323 = tonumber(v2306.Text);
                                        if not v2323 then
                                            return;
                                        else
                                            do
                                                local l_v2319_0, l_v2322_0 = v2319, v2322;
                                                l_v2319_0 = v2276.InputEnded:Connect(function(v2326) --[[ Line: 8698 ]]
                                                    if v2326.UserInputType ~= Enum.UserInputType.MouseButton1 then
                                                        return;
                                                    else
                                                        l_v2319_0:Disconnect();
                                                        l_v2322_0 = false;
                                                        return;
                                                    end;
                                                end);
                                                v2323 = v2323 - 1;
                                                v2307(v2323);
                                                while l_v2322_0 do
                                                    if tick() - v2321 > 0.3 then
                                                        v2323 = v2323 - 1;
                                                        v2307(v2323);
                                                    end;
                                                    wait(0.1);
                                                end;
                                            end;
                                        end;
                                    end;
                                    return;
                                end;
                            end);
                            v2306.ArrowFrame.Down.InputEnded:Connect(function(v2327) --[[ Line: 8716 ]]
                                if v2327.UserInputType == Enum.UserInputType.MouseMovement then
                                    v2306.ArrowFrame.Down.BackgroundTransparency = 1;
                                end;
                            end);
                        end;
                        l_ColorSpace_0.InputBegan:Connect(function(v2329) --[[ Line: 8723 ]]
                            if v2329.UserInputType == Enum.UserInputType.MouseButton1 then
                                local v2330 = nil;
                                local v2331 = nil;
                                do
                                    local l_v2330_0, l_v2331_0 = v2330, v2331;
                                    l_v2330_0 = v2276.InputEnded:Connect(function(v2334) --[[ Line: 8727 ]]
                                        if v2334.UserInputType ~= Enum.UserInputType.MouseButton1 then
                                            return;
                                        else
                                            l_v2330_0:Disconnect();
                                            l_v2331_0:Disconnect();
                                            return;
                                        end;
                                    end);
                                    l_v2331_0 = v2276.InputChanged:Connect(function(v2335) --[[ Line: 8733 ]]
                                        if v2335.UserInputType == Enum.UserInputType.MouseMovement then
                                            v2299();
                                        end;
                                    end);
                                    v2299();
                                end;
                            end;
                        end);
                        l_ColorStrip_0.InputBegan:Connect(function(v2336) --[[ Line: 8743 ]]
                            if v2336.UserInputType == Enum.UserInputType.MouseButton1 then
                                local v2337 = nil;
                                local v2338 = nil;
                                do
                                    local l_v2337_0, l_v2338_0 = v2337, v2338;
                                    l_v2337_0 = v2276.InputEnded:Connect(function(v2341) --[[ Line: 8747 ]]
                                        if v2341.UserInputType ~= Enum.UserInputType.MouseButton1 then
                                            return;
                                        else
                                            l_v2337_0:Disconnect();
                                            l_v2338_0:Disconnect();
                                            return;
                                        end;
                                    end);
                                    l_v2338_0 = v2276.InputChanged:Connect(function(v2342) --[[ Line: 8753 ]]
                                        if v2342.UserInputType == Enum.UserInputType.MouseMovement then
                                            v2305();
                                        end;
                                    end);
                                    v2305();
                                end;
                            end;
                        end);
                        local function v2349(v2343) --[[ Line: 8763 ]] --[[ Name: updateHue ]]
                            local v2344 = tonumber(v2343);
                            if v2344 then
                                v2278 = math.clamp(math.floor(v2344), 0, 359) / 359;
                                local v2345 = Color3.fromHSV(v2278, v2279, v2280);
                                local l_r_2 = v2345.r;
                                local l_g_2 = v2345.g;
                                local l_b_2 = v2345.b;
                                v2281 = l_r_2;
                                v2282 = l_g_2;
                                v2283 = l_b_2;
                                l_Input_0.Text = tostring(v2278 * 359);
                                v2292(1);
                            end;
                        end;
                        l_Input_0.FocusLost:Connect(function() --[[ Line: 8773 ]]
                            v2349(l_Input_0.Text);
                        end);
                        v2328(l_Input_0, v2349);
                        local function v2356(v2350) --[[ Line: 8775 ]] --[[ Name: updateSat ]]
                            local v2351 = tonumber(v2350);
                            if v2351 then
                                v2279 = math.clamp(math.floor(v2351), 0, 255) / 255;
                                local v2352 = Color3.fromHSV(v2278, v2279, v2280);
                                local l_r_3 = v2352.r;
                                local l_g_3 = v2352.g;
                                local l_b_3 = v2352.b;
                                v2281 = l_r_3;
                                v2282 = l_g_3;
                                v2283 = l_b_3;
                                l_Input_1.Text = tostring(v2279 * 255);
                                v2292(1);
                            end;
                        end;
                        l_Input_1.FocusLost:Connect(function() --[[ Line: 8785 ]]
                            v2356(l_Input_1.Text);
                        end);
                        v2328(l_Input_1, v2356);
                        local function v2363(v2357) --[[ Line: 8787 ]] --[[ Name: updateVal ]]
                            local v2358 = tonumber(v2357);
                            if v2358 then
                                v2280 = math.clamp(math.floor(v2358), 0, 255) / 255;
                                local v2359 = Color3.fromHSV(v2278, v2279, v2280);
                                local l_r_4 = v2359.r;
                                local l_g_4 = v2359.g;
                                local l_b_4 = v2359.b;
                                v2281 = l_r_4;
                                v2282 = l_g_4;
                                v2283 = l_b_4;
                                l_Input_2.Text = tostring(v2280 * 255);
                                v2292(1);
                            end;
                        end;
                        l_Input_2.FocusLost:Connect(function() --[[ Line: 8797 ]]
                            v2363(l_Input_2.Text);
                        end);
                        v2328(l_Input_2, v2363);
                        local function v2370(v2364) --[[ Line: 8799 ]] --[[ Name: updateRed ]]
                            local v2365 = tonumber(v2364);
                            if v2365 then
                                v2281 = math.clamp(math.floor(v2365), 0, 255) / 255;
                                local v2366 = Color3.new(v2281, v2282, v2283);
                                local v2367, v2368, v2369 = Color3.toHSV(v2366);
                                v2278 = v2367;
                                v2279 = v2368;
                                v2280 = v2369;
                                l_Input_3.Text = tostring(v2281 * 255);
                                v2292(2);
                            end;
                        end;
                        l_Input_3.FocusLost:Connect(function() --[[ Line: 8809 ]]
                            v2370(l_Input_3.Text);
                        end);
                        v2328(l_Input_3, v2370);
                        local function v2377(v2371) --[[ Line: 8811 ]] --[[ Name: updateGreen ]]
                            local v2372 = tonumber(v2371);
                            if v2372 then
                                v2282 = math.clamp(math.floor(v2372), 0, 255) / 255;
                                local v2373 = Color3.new(v2281, v2282, v2283);
                                local v2374, v2375, v2376 = Color3.toHSV(v2373);
                                v2278 = v2374;
                                v2279 = v2375;
                                v2280 = v2376;
                                l_Input_4.Text = tostring(v2282 * 255);
                                v2292(2);
                            end;
                        end;
                        l_Input_4.FocusLost:Connect(function() --[[ Line: 8821 ]]
                            v2377(l_Input_4.Text);
                        end);
                        v2328(l_Input_4, v2377);
                        local function v2384(v2378) --[[ Line: 8823 ]] --[[ Name: updateBlue ]]
                            local v2379 = tonumber(v2378);
                            if v2379 then
                                v2283 = math.clamp(math.floor(v2379), 0, 255) / 255;
                                local v2380 = Color3.new(v2281, v2282, v2283);
                                local v2381, v2382, v2383 = Color3.toHSV(v2380);
                                v2278 = v2381;
                                v2279 = v2382;
                                v2280 = v2383;
                                l_Input_5.Text = tostring(v2283 * 255);
                                v2292(2);
                            end;
                        end;
                        l_Input_5.FocusLost:Connect(function() --[[ Line: 8833 ]]
                            v2384(l_Input_5.Text);
                        end);
                        v2328(l_Input_5, v2384);
                        local l_TextButton_0 = Instance.new("TextButton");
                        l_TextButton_0.Name = "Choice";
                        l_TextButton_0.Size = UDim2.new(0, 25, 0, 18);
                        l_TextButton_0.BorderColor3 = Color3.fromRGB(55, 55, 55);
                        l_TextButton_0.Text = "";
                        l_TextButton_0.AutoButtonColor = false;
                        local v2386 = 0;
                        local v2387 = 0;
                        for __, v2389 in pairs(v2285) do
                            local v2390 = l_TextButton_0:Clone();
                            v2390.BackgroundColor3 = v2389;
                            v2390.Position = UDim2.new(0, 1 + 30 * v2387, 0, 21 + 23 * v2386);
                            v2390.MouseButton1Click:Connect(function() --[[ Line: 8849 ]]
                                local l_r_5 = v2389.r;
                                local l_g_5 = v2389.g;
                                local l_b_5 = v2389.b;
                                v2281 = l_r_5;
                                v2282 = l_g_5;
                                v2283 = l_b_5;
                                l_r_5 = Color3.new(v2281, v2282, v2283);
                                local v2394;
                                l_g_5, l_b_5, v2394 = Color3.toHSV(l_r_5);
                                v2278 = l_g_5;
                                v2279 = l_b_5;
                                v2280 = v2394;
                                v2292();
                            end);
                            v2390.Parent = l_BasicColors_0;
                            v2387 = v2387 + 1;
                            if v2387 == 6 then
                                v2386 = v2386 + 1;
                                v2387 = 0;
                            end;
                        end;
                        v2386 = 0;
                        v2387 = 0;
                        for v2395 = 1, 12 do
                            local v2396 = v2286[v2395] or Color3.new(0, 0, 0);
                            local v2397 = l_TextButton_0:Clone();
                            v2397.BackgroundColor3 = v2396;
                            v2397.Position = UDim2.new(0, 1 + 30 * v2387, 0, 20 + 23 * v2386);
                            v2397.MouseButton1Click:Connect(function() --[[ Line: 8869 ]]
                                local v2398 = v2286[v2395] or Color3.new(0, 0, 0);
                                local l_r_6 = v2398.r;
                                local l_g_6 = v2398.g;
                                local l_b_6 = v2398.b;
                                v2281 = l_r_6;
                                v2282 = l_g_6;
                                v2283 = l_b_6;
                                l_r_6, l_g_6, l_b_6 = Color3.toHSV(v2398);
                                v2278 = l_r_6;
                                v2279 = l_g_6;
                                v2280 = l_b_6;
                                v2292();
                            end);
                            v2397.MouseButton2Click:Connect(function() --[[ Line: 8876 ]]
                                v2286[v2395] = v2284;
                                v2397.BackgroundColor3 = v2284;
                            end);
                            v2397.Parent = l_CustomColors_0;
                            v2387 = v2387 + 1;
                            if v2387 == 6 then
                                v2386 = v2386 + 1;
                                v2387 = 0;
                            end;
                        end;
                        l_Ok_0.MouseButton1Click:Connect(function() --[[ Line: 8886 ]]
                            v2252.OnSelect:Fire(v2284);
                            v2254:Close();
                        end);
                        l_Ok_0.InputBegan:Connect(function(v2402) --[[ Line: 8887 ]]
                            if v2402.UserInputType == Enum.UserInputType.MouseMovement then
                                l_Ok_0.BackgroundTransparency = 0.4;
                            end;
                        end);
                        l_Ok_0.InputEnded:Connect(function(v2403) --[[ Line: 8888 ]]
                            if v2403.UserInputType == Enum.UserInputType.MouseMovement then
                                l_Ok_0.BackgroundTransparency = 0;
                            end;
                        end);
                        l_Cancel_0.MouseButton1Click:Connect(function() --[[ Line: 8890 ]]
                            v2252.OnCancel:Fire();
                            v2254:Close();
                        end);
                        l_Cancel_0.InputBegan:Connect(function(v2404) --[[ Line: 8891 ]]
                            if v2404.UserInputType == Enum.UserInputType.MouseMovement then
                                l_Cancel_0.BackgroundTransparency = 0.4;
                            end;
                        end);
                        l_Cancel_0.InputEnded:Connect(function(v2405) --[[ Line: 8892 ]]
                            if v2405.UserInputType == Enum.UserInputType.MouseMovement then
                                l_Cancel_0.BackgroundTransparency = 0;
                            end;
                        end);
                        v2292();
                        v2252.SetColor = function(__, v2407) --[[ Line: 8896 ]]
                            local l_r_7 = v2407.r;
                            local l_g_7 = v2407.g;
                            local l_b_7 = v2407.b;
                            v2281 = l_r_7;
                            v2282 = l_g_7;
                            v2283 = l_b_7;
                            l_r_7, l_g_7, l_b_7 = Color3.toHSV(v2407);
                            v2278 = l_r_7;
                            v2279 = l_g_7;
                            v2280 = l_b_7;
                            v2292();
                        end;
                        v2252.Show = function(v2411) --[[ Line: 8902 ]]
                            v2411.Window:Show();
                        end;
                        return v2252;
                    end
                };
            end)();
            v1144.NumberSequenceEditor = (function() --[[ Line: 8912 ]]
                return {
                    new = function() --[[ Line: 8913 ]] --[[ Name: new ]]
                        local v2412 = setmetatable({}, {});
                        v2412.OnSelect = v1144.Signal.new();
                        v2412.OnCancel = v1144.Signal.new();
                        v2412.OnPreview = v1144.Signal.new();
                        local v2413 = v1139({
                            {
                                1, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.17647059261799, 0.17647059261799, 0.17647059261799), 
                                    BorderSizePixel = 0, 
                                    ClipsDescendants = true, 
                                    Name = "Content", 
                                    Position = UDim2.new(0, 0, 0, 20), 
                                    Size = UDim2.new(1, 0, 1, -20)
                                }
                            }, 
                            {
                                2, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.14901961386204, 0.14901961386204, 0.14901961386204), 
                                    BorderColor3 = Color3.new(0.12549020349979, 0.12549020349979, 0.12549020349979), 
                                    Name = "Time", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(0, 40, 0, 210), 
                                    Size = UDim2.new(0, 60, 0, 20)
                                }
                            }, 
                            {
                                3, 
                                "TextBox", 
                                {
                                    BackgroundColor3 = Color3.new(0.25098040699959, 0.25098040699959, 0.25098040699959), 
                                    BackgroundTransparency = 1, 
                                    BorderColor3 = Color3.new(0.37647062540054, 0.37647062540054, 0.37647062540054), 
                                    ClipsDescendants = true, 
                                    Font = 3, 
                                    Name = "Input", 
                                    Parent = {
                                        2
                                    }, 
                                    Position = UDim2.new(0, 2, 0, 0), 
                                    Size = UDim2.new(0, 58, 0, 20), 
                                    Text = "0", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 0
                                }
                            }, 
                            {
                                4, 
                                "TextLabel", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    Font = 3, 
                                    Name = "Title", 
                                    Parent = {
                                        2
                                    }, 
                                    Position = UDim2.new(0, -40, 0, 0), 
                                    Size = UDim2.new(0, 34, 1, 0), 
                                    Text = "Time", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 1
                                }
                            }, 
                            {
                                5, 
                                "TextButton", 
                                {
                                    AutoButtonColor = false, 
                                    BackgroundColor3 = Color3.new(0.2352941185236, 0.2352941185236, 0.2352941185236), 
                                    BorderColor3 = Color3.new(0.21568627655506, 0.21568627655506, 0.21568627655506), 
                                    Font = 3, 
                                    Name = "Close", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(1, -90, 0, 210), 
                                    Size = UDim2.new(0, 80, 0, 20), 
                                    Text = "Close", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14
                                }
                            }, 
                            {
                                6, 
                                "TextButton", 
                                {
                                    AutoButtonColor = false, 
                                    BackgroundColor3 = Color3.new(0.2352941185236, 0.2352941185236, 0.2352941185236), 
                                    BorderColor3 = Color3.new(0.21568627655506, 0.21568627655506, 0.21568627655506), 
                                    Font = 3, 
                                    Name = "Reset", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(1, -180, 0, 210), 
                                    Size = UDim2.new(0, 80, 0, 20), 
                                    Text = "Reset", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14
                                }
                            }, 
                            {
                                7, 
                                "TextButton", 
                                {
                                    AutoButtonColor = false, 
                                    BackgroundColor3 = Color3.new(0.2352941185236, 0.2352941185236, 0.2352941185236), 
                                    BorderColor3 = Color3.new(0.21568627655506, 0.21568627655506, 0.21568627655506), 
                                    Font = 3, 
                                    Name = "Delete", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(0, 380, 0, 210), 
                                    Size = UDim2.new(0, 80, 0, 20), 
                                    Text = "Delete", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14
                                }
                            }, 
                            {
                                8, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.17647059261799, 0.17647059261799, 0.17647059261799), 
                                    BorderColor3 = Color3.new(0.21568627655506, 0.21568627655506, 0.21568627655506), 
                                    Name = "NumberLineOutlines", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(0, 10, 0, 20), 
                                    Size = UDim2.new(1, -20, 0, 170)
                                }
                            }, 
                            {
                                9, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.25098040699959, 0.25098040699959, 0.25098040699959), 
                                    BackgroundTransparency = 1, 
                                    BorderColor3 = Color3.new(0.37647062540054, 0.37647062540054, 0.37647062540054), 
                                    Name = "NumberLine", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(0, 10, 0, 20), 
                                    Size = UDim2.new(1, -20, 0, 170)
                                }
                            }, 
                            {
                                10, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.14901961386204, 0.14901961386204, 0.14901961386204), 
                                    BorderColor3 = Color3.new(0.12549020349979, 0.12549020349979, 0.12549020349979), 
                                    Name = "Value", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(0, 170, 0, 210), 
                                    Size = UDim2.new(0, 60, 0, 20)
                                }
                            }, 
                            {
                                11, 
                                "TextLabel", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    Font = 3, 
                                    Name = "Title", 
                                    Parent = {
                                        10
                                    }, 
                                    Position = UDim2.new(0, -40, 0, 0), 
                                    Size = UDim2.new(0, 34, 1, 0), 
                                    Text = "Value", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 1
                                }
                            }, 
                            {
                                12, 
                                "TextBox", 
                                {
                                    BackgroundColor3 = Color3.new(0.25098040699959, 0.25098040699959, 0.25098040699959), 
                                    BackgroundTransparency = 1, 
                                    BorderColor3 = Color3.new(0.37647062540054, 0.37647062540054, 0.37647062540054), 
                                    ClipsDescendants = true, 
                                    Font = 3, 
                                    Name = "Input", 
                                    Parent = {
                                        10
                                    }, 
                                    Position = UDim2.new(0, 2, 0, 0), 
                                    Size = UDim2.new(0, 58, 0, 20), 
                                    Text = "0", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 0
                                }
                            }, 
                            {
                                13, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.14901961386204, 0.14901961386204, 0.14901961386204), 
                                    BorderColor3 = Color3.new(0.12549020349979, 0.12549020349979, 0.12549020349979), 
                                    Name = "Envelope", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(0, 300, 0, 210), 
                                    Size = UDim2.new(0, 60, 0, 20)
                                }
                            }, 
                            {
                                14, 
                                "TextBox", 
                                {
                                    BackgroundColor3 = Color3.new(0.25098040699959, 0.25098040699959, 0.25098040699959), 
                                    BackgroundTransparency = 1, 
                                    BorderColor3 = Color3.new(0.37647062540054, 0.37647062540054, 0.37647062540054), 
                                    ClipsDescendants = true, 
                                    Font = 3, 
                                    Name = "Input", 
                                    Parent = {
                                        13
                                    }, 
                                    Position = UDim2.new(0, 2, 0, 0), 
                                    Size = UDim2.new(0, 58, 0, 20), 
                                    Text = "0", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 0
                                }
                            }, 
                            {
                                15, 
                                "TextLabel", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    Font = 3, 
                                    Name = "Title", 
                                    Parent = {
                                        13
                                    }, 
                                    Position = UDim2.new(0, -40, 0, 0), 
                                    Size = UDim2.new(0, 34, 1, 0), 
                                    Text = "Envelope", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 1
                                }
                            }
                        });
                        local v2414 = v1144.Window.new();
                        v2414.Resizable = false;
                        v2414:Resize(680, 265);
                        v2414:SetTitle("NumberSequence Editor");
                        v2412.Window = v2414;
                        v2412.Gui = v2414.Gui;
                        for __, v2416 in pairs(v2413:GetChildren()) do
                            v2416.Parent = v2414.GuiElems.Content;
                        end;
                        local l_Main_3 = v2414.Gui.Main;
                        local l_TopBar_2 = l_Main_3.TopBar;
                        local l_Content_1 = l_Main_3.Content;
                        local l_NumberLine_0 = l_Content_1.NumberLine;
                        local l_NumberLineOutlines_0 = l_Content_1.NumberLineOutlines;
                        local l_Input_6 = l_Content_1.Time.Input;
                        local l_Input_7 = l_Content_1.Value.Input;
                        local l_Input_8 = l_Content_1.Envelope.Input;
                        local l_Delete_0 = l_Content_1.Delete;
                        local l_Reset_0 = l_Content_1.Reset;
                        local l_Close_1 = l_Content_1.Close;
                        local __ = l_TopBar_2.Close;
                        local v2429 = {
                            {
                                1, 
                                0, 
                                3
                            }, 
                            {
                                8, 
                                0.05, 
                                1
                            }, 
                            {
                                5, 
                                0.6, 
                                2
                            }, 
                            {
                                4, 
                                0.7, 
                                4
                            }, 
                            {
                                6, 
                                1, 
                                4
                            }
                        };
                        local v2430 = {};
                        local v2431 = {};
                        local v2432 = v2429[1];
                        local v2433 = v2429[#v2429];
                        local v2434 = nil;
                        local v2435 = nil;
                        local v2436 = nil;
                        local v2437 = v2(game:GetService("UserInputService"));
                        local l_Mouse_5 = v2(game:GetService("Players")).LocalPlayer:GetMouse();
                        for v2439 = 2, 10 do
                            local l_Frame_5 = Instance.new("Frame");
                            l_Frame_5.BackgroundTransparency = 0.5;
                            l_Frame_5.BackgroundColor3 = Color3.new(0.3764705882352941, 0.3764705882352941, 0.3764705882352941);
                            l_Frame_5.BorderSizePixel = 0;
                            l_Frame_5.Size = UDim2.new(0, 1, 1, 0);
                            l_Frame_5.Position = UDim2.new((v2439 - 1) / 10, 0, 0, 0);
                            l_Frame_5.Parent = l_NumberLineOutlines_0;
                        end;
                        for v2441 = 2, 4 do
                            local l_Frame_6 = Instance.new("Frame");
                            l_Frame_6.BackgroundTransparency = 0.5;
                            l_Frame_6.BackgroundColor3 = Color3.new(0.3764705882352941, 0.3764705882352941, 0.3764705882352941);
                            l_Frame_6.BorderSizePixel = 0;
                            l_Frame_6.Size = UDim2.new(1, 0, 0, 1);
                            l_Frame_6.Position = UDim2.new(0, 0, (v2441 - 1) / 4, 0);
                            l_Frame_6.Parent = l_NumberLineOutlines_0;
                        end;
                        local l_Frame_7 = Instance.new("Frame");
                        l_Frame_7.BackgroundColor3 = Color3.new(0, 0, 0);
                        l_Frame_7.BorderSizePixel = 0;
                        l_Frame_7.Size = UDim2.new(0, 1, 0, 1);
                        local l_Frame_8 = Instance.new("Frame");
                        l_Frame_8.BackgroundColor3 = Color3.new(0, 0, 0);
                        l_Frame_8.BorderSizePixel = 0;
                        l_Frame_8.Size = UDim2.new(0, 1, 0, 0);
                        for v2445 = 1, l_NumberLine_0.AbsoluteSize.X do
                            local v2446 = l_Frame_8:Clone();
                            v2431[v2445] = v2446;
                            v2446.Name = "E" .. tostring(v2445);
                            v2446.BackgroundTransparency = 0.5;
                            v2446.BackgroundColor3 = Color3.new(0.7803921568627451, 0.17254901960784313, 0.10980392156862745);
                            v2446.Position = UDim2.new(0, v2445 - 1, 0, 0);
                            v2446.Parent = l_NumberLine_0;
                        end;
                        for v2447 = 1, l_NumberLine_0.AbsoluteSize.X do
                            local v2448 = l_Frame_8:Clone();
                            v2430[v2447] = v2448;
                            v2448.Name = tostring(v2447);
                            v2448.Position = UDim2.new(0, v2447 - 1, 0, 0);
                            v2448.Parent = l_NumberLine_0;
                        end;
                        local l_Frame_9 = Instance.new("Frame");
                        l_Frame_9.BackgroundTransparency = 1;
                        l_Frame_9.BackgroundColor3 = Color3.new(0, 0, 0);
                        l_Frame_9.BorderSizePixel = 0;
                        l_Frame_9.Size = UDim2.new(0, 7, 0, 20);
                        l_Frame_9.Visible = false;
                        l_Frame_9.ZIndex = 2;
                        local v2450 = Instance.new("Frame", l_Frame_9);
                        v2450.Name = "Line";
                        v2450.BackgroundColor3 = Color3.new(0, 0, 0);
                        v2450.BorderSizePixel = 0;
                        v2450.Position = UDim2.new(0, 3, 0, 0);
                        v2450.Size = UDim2.new(0, 1, 0, 20);
                        v2450.ZIndex = 2;
                        local v2451 = l_Frame_9:Clone();
                        local v2452 = l_Frame_9:Clone();
                        v2451.Parent = l_NumberLine_0;
                        v2452.Parent = l_NumberLine_0;
                        local function v2456() --[[ Line: 9038 ]] --[[ Name: buildSequence ]]
                            local v2453 = {};
                            for __, v2455 in pairs(v2429) do
                                table.insert(v2453, NumberSequenceKeypoint.new(v2455[2], v2455[1], v2455[3]));
                            end;
                            v2412.Sequence = NumberSequence.new(v2453);
                            v2412.OnSelect:Fire(v2412.Sequence);
                        end;
                        local function v2460(v2457, v2458) --[[ Line: 9047 ]] --[[ Name: round ]]
                            local v2459 = 10 ^ v2458;
                            return math.floor(v2457 * v2459 + 0.5) / v2459;
                        end;
                        local function v2466(v2461) --[[ Line: 9052 ]] --[[ Name: updateInputs ]]
                            if v2461 then
                                v2435 = v2461;
                                local v2462 = v2461[2];
                                local v2463 = v2461[1];
                                local v2464 = v2461[3];
                                l_Input_6.Text = v2460(v2462, v2462 < 0.01 and 5 or v2462 < 0.1 and 4 or 3);
                                l_Input_7.Text = v2460(v2463, v2463 < 0.01 and 5 or v2463 < 0.1 and 4 or v2463 < 1 and 3 or 2);
                                l_Input_8.Text = v2460(v2464, v2464 < 0.01 and 5 or v2464 < 0.1 and 4 or v2463 < 1 and 3 or 2);
                                local v2465 = l_NumberLine_0.AbsoluteSize.Y * (v2461[3] / 10);
                                v2451.Position = UDim2.new(0, v2461[4].Position.X.Offset - 1, 0, v2461[4].Position.Y.Offset - v2465 - 17);
                                v2451.Visible = true;
                                v2452.Position = UDim2.new(0, v2461[4].Position.X.Offset - 1, 0, v2461[4].Position.Y.Offset + v2465 + 2);
                                v2452.Visible = true;
                            end;
                        end;
                        v2451.InputBegan:Connect(function(v2467) --[[ Line: 9068 ]]
                            if v2467.UserInputType ~= Enum.UserInputType.MouseButton1 or not v2435 or v1144.CheckMouseInGui(v2435[4].Select) then
                                return;
                            else
                                local v2468 = nil;
                                local v2469 = nil;
                                local l_Y_12 = l_NumberLine_0.AbsoluteSize.Y;
                                local v2471 = math.abs(v2451.AbsolutePosition.Y - l_Mouse_5.Y);
                                v2451.Line.Position = UDim2.new(0, 2, 0, 0);
                                v2451.Line.Size = UDim2.new(0, 3, 0, 20);
                                v2469 = v2437.InputEnded:Connect(function(v2472) --[[ Line: 9078 ]]
                                    if v2472.UserInputType ~= Enum.UserInputType.MouseButton1 then
                                        return;
                                    else
                                        v2468:Disconnect();
                                        v2469:Disconnect();
                                        v2451.Line.Position = UDim2.new(0, 3, 0, 0);
                                        v2451.Line.Size = UDim2.new(0, 1, 0, 20);
                                        return;
                                    end;
                                end);
                                v2468 = v2437.InputChanged:Connect(function(v2473) --[[ Line: 9086 ]]
                                    if v2473.UserInputType == Enum.UserInputType.MouseMovement then
                                        v2435[3] = math.min(10 * (math.max(v2435[4].AbsolutePosition.Y + 2 - (l_Mouse_5.Y - v2471) - 19, 0) / l_Y_12), (math.min(v2435[1], 10 - v2435[1])));
                                        v2412:Redraw();
                                        v2456();
                                        v2466(v2435);
                                    end;
                                end);
                                return;
                            end;
                        end);
                        v2452.InputBegan:Connect(function(v2474) --[[ Line: 9099 ]]
                            if v2474.UserInputType ~= Enum.UserInputType.MouseButton1 or not v2435 or v1144.CheckMouseInGui(v2435[4].Select) then
                                return;
                            else
                                local v2475 = nil;
                                local v2476 = nil;
                                local l_Y_13 = l_NumberLine_0.AbsoluteSize.Y;
                                local v2478 = math.abs(v2452.AbsolutePosition.Y - l_Mouse_5.Y);
                                v2452.Line.Position = UDim2.new(0, 2, 0, 0);
                                v2452.Line.Size = UDim2.new(0, 3, 0, 20);
                                v2476 = v2437.InputEnded:Connect(function(v2479) --[[ Line: 9109 ]]
                                    if v2479.UserInputType ~= Enum.UserInputType.MouseButton1 then
                                        return;
                                    else
                                        v2475:Disconnect();
                                        v2476:Disconnect();
                                        v2452.Line.Position = UDim2.new(0, 3, 0, 0);
                                        v2452.Line.Size = UDim2.new(0, 1, 0, 20);
                                        return;
                                    end;
                                end);
                                v2475 = v2437.InputChanged:Connect(function(v2480) --[[ Line: 9117 ]]
                                    if v2480.UserInputType == Enum.UserInputType.MouseMovement then
                                        v2435[3] = math.min(10 * (math.max(l_Mouse_5.Y + (20 - v2478) - (v2435[4].AbsolutePosition.Y + 2) - 19, 0) / l_Y_13), (math.min(v2435[1], 10 - v2435[1])));
                                        v2412:Redraw();
                                        v2456();
                                        v2466(v2435);
                                    end;
                                end);
                                return;
                            end;
                        end);
                        local function v2501(v2481) --[[ Line: 9130 ]] --[[ Name: placePoint ]]
                            local l_Frame_10 = Instance.new("Frame");
                            l_Frame_10.Name = "Point";
                            l_Frame_10.BorderSizePixel = 0;
                            l_Frame_10.Size = UDim2.new(0, 5, 0, 5);
                            l_Frame_10.Position = UDim2.new(0, math.floor((l_NumberLine_0.AbsoluteSize.X - 1) * v2481[2]) - 2, 0, l_NumberLine_0.AbsoluteSize.Y * (10 - v2481[1]) / 10 - 2);
                            l_Frame_10.BackgroundColor3 = Color3.new(0, 0, 0);
                            local l_Frame_11 = Instance.new("Frame");
                            l_Frame_11.Name = "Select";
                            l_Frame_11.BackgroundTransparency = 1;
                            l_Frame_11.BackgroundColor3 = Color3.new(0.7803921568627451, 0.17254901960784313, 0.10980392156862745);
                            l_Frame_11.Position = UDim2.new(0, -2, 0, -2);
                            l_Frame_11.Size = UDim2.new(0, 9, 0, 9);
                            l_Frame_11.Parent = l_Frame_10;
                            l_Frame_10.Parent = l_NumberLine_0;
                            l_Frame_11.InputBegan:Connect(function(v2484) --[[ Line: 9148 ]]
                                if v2484.UserInputType == Enum.UserInputType.MouseMovement then
                                    for __, v2486 in pairs(v2429) do
                                        v2486[4].Select.BackgroundTransparency = 1;
                                    end;
                                    l_Frame_11.BackgroundTransparency = 0;
                                    v2466(v2481);
                                end;
                                if v2484.UserInputType == Enum.UserInputType.MouseButton1 and not v2434 then
                                    v2435 = v2481;
                                    local v2487 = nil;
                                    local v2488 = nil;
                                    v2434 = true;
                                    l_Frame_11.BackgroundColor3 = Color3.new(0.9764705882352941, 0.7490196078431373, 0.23137254901960785);
                                    local v2489 = v2481[3];
                                    do
                                        local l_v2487_0, l_v2488_0 = v2487, v2488;
                                        l_v2488_0 = v2437.InputEnded:Connect(function(v2492) --[[ Line: 9162 ]]
                                            if v2492.UserInputType ~= Enum.UserInputType.MouseButton1 then
                                                return;
                                            else
                                                l_v2487_0:Disconnect();
                                                l_v2488_0:Disconnect();
                                                v2434 = nil;
                                                l_Frame_11.BackgroundColor3 = Color3.new(0.7803921568627451, 0.17254901960784313, 0.10980392156862745);
                                                return;
                                            end;
                                        end);
                                        l_v2487_0 = v2437.InputChanged:Connect(function(v2493) --[[ Line: 9170 ]]
                                            if v2493.UserInputType == Enum.UserInputType.MouseMovement then
                                                local v2494 = l_NumberLine_0.AbsoluteSize.X - 1;
                                                local v2495 = l_Mouse_5.X - l_NumberLine_0.AbsolutePosition.X;
                                                if v2495 < 0 then
                                                    v2495 = 0;
                                                end;
                                                if v2494 < v2495 then
                                                    v2495 = v2494;
                                                end;
                                                local v2496 = l_NumberLine_0.AbsoluteSize.Y - 1;
                                                local v2497 = l_Mouse_5.Y - l_NumberLine_0.AbsolutePosition.Y;
                                                if v2497 < 0 then
                                                    v2497 = 0;
                                                end;
                                                if v2496 < v2497 then
                                                    v2497 = v2496;
                                                end;
                                                if v2481 ~= v2432 and v2481 ~= v2433 then
                                                    v2481[2] = v2495 / v2494;
                                                end;
                                                v2481[1] = 10 - v2497 / v2496 * 10;
                                                local v2498 = math.min(v2481[1], 10 - v2481[1]);
                                                v2481[3] = math.min(v2489, v2498);
                                                v2412:Redraw();
                                                v2466(v2481);
                                                for __, v2500 in pairs(v2429) do
                                                    v2500[4].Select.BackgroundTransparency = 1;
                                                end;
                                                l_Frame_11.BackgroundTransparency = 0;
                                                v2456();
                                            end;
                                        end);
                                    end;
                                end;
                            end);
                            return l_Frame_10;
                        end;
                        local function v2504() --[[ Line: 9199 ]] --[[ Name: placePoints ]]
                            for __, v2503 in pairs(v2429) do
                                v2503[4] = v2501(v2503);
                            end;
                        end;
                        local function v2528(__) --[[ Line: 9205 ]] --[[ Name: redraw ]]
                            local l_AbsoluteSize_4 = l_NumberLine_0.AbsoluteSize;
                            table.sort(v2429, function(v2507, v2508) --[[ Line: 9207 ]]
                                return v2507[2] < v2508[2];
                            end);
                            for __, v2510 in pairs(v2429) do
                                v2510[4].Position = UDim2.new(0, math.floor((l_AbsoluteSize_4.X - 1) * v2510[2]) - 2, 0, (l_AbsoluteSize_4.Y - 1) * (10 - v2510[1]) / 10 - 2);
                            end;
                            v2430[1].Size = UDim2.new(0, 1, 0, 0);
                            for v2511 = 1, #v2429 - 1 do
                                local v2512 = v2429[v2511];
                                local v2513 = v2429[v2511 + 1];
                                local v2514 = v2513[4].Position.Y.Offset - v2512[4].Position.Y.Offset;
                                local v2515 = v2513[4].Position.X.Offset - v2512[4].Position.X.Offset;
                                local v2516 = v2514 / v2515;
                                local v2517 = v2512[3];
                                local v2518 = v2513[3];
                                local v2519 = math.abs(v2516);
                                local v2520 = 0;
                                local v2521 = math.abs(v2513[4].Position.Y.Offset - v2512[4].Position.Y.Offset);
                                for v2522 = math.min(v2512[4].Position.X.Offset + 1, v2513[4].Position.X.Offset), v2513[4].Position.X.Offset do
                                    if v2515 == 0 and v2514 == 0 then
                                        return;
                                    else
                                        local v2523 = math.floor(v2519);
                                        local v2524 = v2430[v2522 + 3];
                                        if v2524 then
                                            if v2521 < v2520 + v2523 then
                                                v2523 = v2521 - v2520;
                                            end;
                                            if math.sign(v2516) == -1 then
                                                v2524.Position = UDim2.new(0, v2522 + 2, 0, v2512[4].Position.Y.Offset + -(v2520 + v2523) + 2);
                                            else
                                                v2524.Position = UDim2.new(0, v2522 + 2, 0, v2512[4].Position.Y.Offset + v2520 + 2);
                                            end;
                                            v2524.Size = UDim2.new(0, 1, 0, (math.max(v2523, 1)));
                                        end;
                                        v2520 = v2520 + v2523;
                                        v2519 = v2519 - v2523 + math.abs(v2516);
                                        local v2525 = (v2522 - v2512[4].Position.X.Offset) / (v2513[4].Position.X.Offset - v2512[4].Position.X.Offset);
                                        local v2526 = (v2517 + (v2518 - v2517) * v2525) / 10 * l_AbsoluteSize_4.Y;
                                        local v2527 = v2431[v2522 + 3];
                                        if v2527 then
                                            v2527.Position = UDim2.new(0, v2522 + 2, 0, v2430[v2522 + 3].Position.Y.Offset - math.floor(v2526));
                                            v2527.Size = UDim2.new(0, 1, 0, (math.floor(v2526 * 2)));
                                        end;
                                    end;
                                end;
                            end;
                        end;
                        v2412.Redraw = v2528;
                        v2412.SetSequence = function(__, v2530) --[[ Line: 9256 ]] --[[ Name: loadSequence ]]
                            v2436 = v2530;
                            for __, v2532 in pairs(v2429) do
                                if v2532[4] then
                                    v2532[4]:Destroy();
                                end;
                            end;
                            v2429 = {};
                            for __, v2534 in pairs(v2530.Keypoints) do
                                local v2535 = math.min(v2534.Value, 10 - v2534.Value);
                                local v2536 = {
                                    v2534.Value, 
                                    v2534.Time, 
                                    (math.min(v2534.Envelope, v2535))
                                };
                                v2536[4] = v2501(v2536);
                                table.insert(v2429, v2536);
                            end;
                            v2432 = v2429[1];
                            v2433 = v2429[#v2429];
                            v2434 = nil;
                            v2528();
                            v2451.Visible = false;
                            v2452.Visible = false;
                        end;
                        l_Input_6.FocusLost:Connect(function() --[[ Line: 9275 ]]
                            local l_v2435_0 = v2435;
                            local v2538 = tonumber(l_Input_6.Text);
                            if l_v2435_0 and v2538 and l_v2435_0 ~= v2432 and l_v2435_0 ~= v2433 then
                                l_v2435_0[2] = math.clamp(v2538, 0, 1);
                                v2528();
                                v2456();
                                v2466(l_v2435_0);
                            end;
                        end);
                        l_Input_7.FocusLost:Connect(function() --[[ Line: 9287 ]]
                            local l_v2435_1 = v2435;
                            local v2540 = tonumber(l_Input_7.Text);
                            if l_v2435_1 and v2540 then
                                local v2541 = l_v2435_1[3];
                                l_v2435_1[1] = math.clamp(v2540, 0, 10);
                                l_v2435_1[3] = math.min(v2541, (math.min(l_v2435_1[1], 10 - l_v2435_1[1])));
                                v2528();
                                v2456();
                                v2466(l_v2435_1);
                            end;
                        end);
                        l_Input_8.FocusLost:Connect(function() --[[ Line: 9302 ]]
                            local l_v2435_2 = v2435;
                            local v2543 = tonumber(l_Input_8.Text);
                            if l_v2435_2 and v2543 then
                                l_v2435_2[3] = math.min(math.clamp(v2543, 0, 5), (math.min(l_v2435_2[1], 10 - l_v2435_2[1])));
                                v2528();
                                v2456();
                                v2466(l_v2435_2);
                            end;
                        end);
                        local function v2548(v2544, v2545) --[[ Line: 9315 ]] --[[ Name: buttonAnimations ]]
                            v2544.InputBegan:Connect(function(v2546) --[[ Line: 9316 ]]
                                if v2546.UserInputType == Enum.UserInputType.MouseMovement then
                                    v2544.BackgroundTransparency = v2545 and 0.5 or 0.4;
                                end;
                            end);
                            v2544.InputEnded:Connect(function(v2547) --[[ Line: 9317 ]]
                                if v2547.UserInputType == Enum.UserInputType.MouseMovement then
                                    v2544.BackgroundTransparency = v2545 and 1 or 0;
                                end;
                            end);
                        end;
                        l_NumberLine_0.InputBegan:Connect(function(v2549) --[[ Line: 9320 ]]
                            if v2549.UserInputType == Enum.UserInputType.MouseButton1 and #v2429 < 20 then
                                if v1144.CheckMouseInGui(v2451) or v1144.CheckMouseInGui(v2452) then
                                    return;
                                else
                                    for __, v2551 in pairs(v2429) do
                                        if v1144.CheckMouseInGui(v2551[4].Select) then
                                            return;
                                        end;
                                    end;
                                    local v2552 = l_NumberLine_0.AbsoluteSize.X - 1;
                                    local v2553 = l_Mouse_5.X - l_NumberLine_0.AbsolutePosition.X;
                                    if v2553 < 0 then
                                        v2553 = 0;
                                    end;
                                    if v2552 < v2553 then
                                        v2553 = v2552;
                                    end;
                                    local v2554 = l_NumberLine_0.AbsoluteSize.Y - 1;
                                    local v2555 = l_Mouse_5.Y - l_NumberLine_0.AbsolutePosition.Y;
                                    if v2555 < 0 then
                                        v2555 = 0;
                                    end;
                                    if v2554 < v2555 then
                                        v2555 = v2554;
                                    end;
                                    local v2556 = v2553 / v2552;
                                    local v2557 = {
                                        10 - v2555 / v2554 * 10, 
                                        v2556, 
                                        0
                                    };
                                    v2557[4] = v2501(v2557);
                                    table.insert(v2429, v2557);
                                    v2528();
                                    v2456();
                                end;
                            end;
                        end);
                        l_Delete_0.MouseButton1Click:Connect(function() --[[ Line: 9344 ]]
                            if v2435 and v2435 ~= v2432 and v2435 ~= v2433 then
                                for v2558, v2559 in pairs(v2429) do
                                    if v2559 == v2435 then
                                        v2559[4]:Destroy();
                                        table.remove(v2429, v2558);
                                        break;
                                    end;
                                end;
                                v2434 = nil;
                                v2528();
                                v2456();
                                v2466(v2429[1]);
                            end;
                        end);
                        l_Reset_0.MouseButton1Click:Connect(function() --[[ Line: 9360 ]]
                            if v2436 then
                                v2412:SetSequence(v2436);
                                v2456();
                            end;
                        end);
                        l_Close_1.MouseButton1Click:Connect(function() --[[ Line: 9367 ]]
                            v2414:Close();
                        end);
                        v2548(l_Delete_0);
                        v2548(l_Reset_0);
                        v2548(l_Close_1);
                        v2504();
                        v2528();
                        v2412.Show = function(__) --[[ Line: 9378 ]]
                            v2414:Show();
                        end;
                        return v2412;
                    end
                };
            end)();
            v1144.ColorSequenceEditor = (function() --[[ Line: 9388 ]]
                return {
                    new = function() --[[ Line: 9389 ]] --[[ Name: new ]]
                        local v2561 = setmetatable({}, {});
                        v2561.OnSelect = v1144.Signal.new();
                        v2561.OnCancel = v1144.Signal.new();
                        v2561.OnPreview = v1144.Signal.new();
                        v2561.OnPickColor = v1144.Signal.new();
                        local v2562 = v1139({
                            {
                                1, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.17647059261799, 0.17647059261799, 0.17647059261799), 
                                    BorderSizePixel = 0, 
                                    ClipsDescendants = true, 
                                    Name = "Content", 
                                    Position = UDim2.new(0, 0, 0, 20), 
                                    Size = UDim2.new(1, 0, 1, -20)
                                }
                            }, 
                            {
                                2, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.17647059261799, 0.17647059261799, 0.17647059261799), 
                                    BorderColor3 = Color3.new(0.21568627655506, 0.21568627655506, 0.21568627655506), 
                                    Name = "ColorLine", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(0, 10, 0, 5), 
                                    Size = UDim2.new(1, -20, 0, 70)
                                }
                            }, 
                            {
                                3, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BorderSizePixel = 0, 
                                    Name = "Gradient", 
                                    Parent = {
                                        2
                                    }, 
                                    Size = UDim2.new(1, 0, 1, 0)
                                }
                            }, 
                            {
                                4, 
                                "UIGradient", 
                                {
                                    Parent = {
                                        3
                                    }
                                }
                            }, 
                            {
                                5, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    BorderSizePixel = 0, 
                                    Name = "Arrows", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(0, 1, 0, 73), 
                                    Size = UDim2.new(1, -2, 0, 16)
                                }
                            }, 
                            {
                                6, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0, 0, 0), 
                                    BackgroundTransparency = 0.5, 
                                    BorderSizePixel = 0, 
                                    Name = "Cursor", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(0, 10, 0, 0), 
                                    Size = UDim2.new(0, 1, 0, 80)
                                }
                            }, 
                            {
                                7, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.14901961386204, 0.14901961386204, 0.14901961386204), 
                                    BorderColor3 = Color3.new(0.12549020349979, 0.12549020349979, 0.12549020349979), 
                                    Name = "Time", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(0, 40, 0, 95), 
                                    Size = UDim2.new(0, 100, 0, 20)
                                }
                            }, 
                            {
                                8, 
                                "TextBox", 
                                {
                                    BackgroundColor3 = Color3.new(0.25098040699959, 0.25098040699959, 0.25098040699959), 
                                    BackgroundTransparency = 1, 
                                    BorderColor3 = Color3.new(0.37647062540054, 0.37647062540054, 0.37647062540054), 
                                    ClipsDescendants = true, 
                                    Font = 3, 
                                    Name = "Input", 
                                    Parent = {
                                        7
                                    }, 
                                    Position = UDim2.new(0, 2, 0, 0), 
                                    Size = UDim2.new(0, 98, 0, 20), 
                                    Text = "0", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 0
                                }
                            }, 
                            {
                                9, 
                                "TextLabel", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    Font = 3, 
                                    Name = "Title", 
                                    Parent = {
                                        7
                                    }, 
                                    Position = UDim2.new(0, -40, 0, 0), 
                                    Size = UDim2.new(0, 34, 1, 0), 
                                    Text = "Time", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 1
                                }
                            }, 
                            {
                                10, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BorderColor3 = Color3.new(0.21568627655506, 0.21568627655506, 0.21568627655506), 
                                    Name = "ColorBox", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(0, 220, 0, 95), 
                                    Size = UDim2.new(0, 20, 0, 20)
                                }
                            }, 
                            {
                                11, 
                                "TextLabel", 
                                {
                                    BackgroundColor3 = Color3.new(1, 1, 1), 
                                    BackgroundTransparency = 1, 
                                    Font = 3, 
                                    Name = "Title", 
                                    Parent = {
                                        10
                                    }, 
                                    Position = UDim2.new(0, -40, 0, 0), 
                                    Size = UDim2.new(0, 34, 1, 0), 
                                    Text = "Color", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14, 
                                    TextXAlignment = 1
                                }
                            }, 
                            {
                                12, 
                                "TextButton", 
                                {
                                    AutoButtonColor = false, 
                                    BackgroundColor3 = Color3.new(0.2352941185236, 0.2352941185236, 0.2352941185236), 
                                    BorderColor3 = Color3.new(0.21568627655506, 0.21568627655506, 0.21568627655506), 
                                    BorderSizePixel = 0, 
                                    Font = 3, 
                                    Name = "Close", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(1, -90, 0, 95), 
                                    Size = UDim2.new(0, 80, 0, 20), 
                                    Text = "Close", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14
                                }
                            }, 
                            {
                                13, 
                                "TextButton", 
                                {
                                    AutoButtonColor = false, 
                                    BackgroundColor3 = Color3.new(0.2352941185236, 0.2352941185236, 0.2352941185236), 
                                    BorderColor3 = Color3.new(0.21568627655506, 0.21568627655506, 0.21568627655506), 
                                    BorderSizePixel = 0, 
                                    Font = 3, 
                                    Name = "Reset", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(1, -180, 0, 95), 
                                    Size = UDim2.new(0, 80, 0, 20), 
                                    Text = "Reset", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14
                                }
                            }, 
                            {
                                14, 
                                "TextButton", 
                                {
                                    AutoButtonColor = false, 
                                    BackgroundColor3 = Color3.new(0.2352941185236, 0.2352941185236, 0.2352941185236), 
                                    BorderColor3 = Color3.new(0.21568627655506, 0.21568627655506, 0.21568627655506), 
                                    BorderSizePixel = 0, 
                                    Font = 3, 
                                    Name = "Delete", 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(0, 280, 0, 95), 
                                    Size = UDim2.new(0, 80, 0, 20), 
                                    Text = "Delete", 
                                    TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489), 
                                    TextSize = 14
                                }
                            }, 
                            {
                                15, 
                                "Frame", 
                                {
                                    BackgroundTransparency = 1, 
                                    Name = "Arrow", 
                                    Parent = {
                                        1
                                    }, 
                                    Size = UDim2.new(0, 16, 0, 16), 
                                    Visible = false
                                }
                            }, 
                            {
                                16, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        15
                                    }, 
                                    Position = UDim2.new(0, 8, 0, 3), 
                                    Size = UDim2.new(0, 1, 0, 2)
                                }
                            }, 
                            {
                                17, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        15
                                    }, 
                                    Position = UDim2.new(0, 7, 0, 5), 
                                    Size = UDim2.new(0, 3, 0, 2)
                                }
                            }, 
                            {
                                18, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        15
                                    }, 
                                    Position = UDim2.new(0, 6, 0, 7), 
                                    Size = UDim2.new(0, 5, 0, 2)
                                }
                            }, 
                            {
                                19, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        15
                                    }, 
                                    Position = UDim2.new(0, 5, 0, 9), 
                                    Size = UDim2.new(0, 7, 0, 2)
                                }
                            }, 
                            {
                                20, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        15
                                    }, 
                                    Position = UDim2.new(0, 4, 0, 11), 
                                    Size = UDim2.new(0, 9, 0, 2)
                                }
                            }
                        });
                        local v2563 = v1144.Window.new();
                        v2563.Resizable = false;
                        v2563:Resize(650, 150);
                        v2563:SetTitle("ColorSequence Editor");
                        v2561.Window = v2563;
                        v2561.Gui = v2563.Gui;
                        for __, v2565 in pairs(v2562:GetChildren()) do
                            v2565.Parent = v2563.GuiElems.Content;
                        end;
                        local l_Main_4 = v2563.Gui.Main;
                        local l_TopBar_3 = l_Main_4.TopBar;
                        local l_Content_2 = l_Main_4.Content;
                        local l_ColorLine_0 = l_Content_2.ColorLine;
                        local l_UIGradient_0 = l_ColorLine_0.Gradient.UIGradient;
                        local l_Arrows_0 = l_Content_2.Arrows;
                        local l_Arrow_1 = l_Content_2.Arrow;
                        local l_Cursor_2 = l_Content_2.Cursor;
                        local l_Input_9 = l_Content_2.Time.Input;
                        local l_ColorBox_0 = l_Content_2.ColorBox;
                        local l_Delete_1 = l_Content_2.Delete;
                        local l_Reset_1 = l_Content_2.Reset;
                        local l_Close_3 = l_Content_2.Close;
                        local l_Close_4 = l_TopBar_3.Close;
                        local v2580 = v2(game:GetService("UserInputService"));
                        local l_Mouse_6 = v2(game:GetService("Players")).LocalPlayer:GetMouse();
                        local v2582 = {
                            {
                                Color3.new(1, 0, 1), 
                                0
                            }, 
                            {
                                Color3.new(0.2, 0.9, 0.2), 
                                0.2
                            }, 
                            {
                                Color3.new(0.4, 0.5, 0.9), 
                                0.7
                            }, 
                            {
                                Color3.new(0.6, 1, 1), 
                                1
                            }
                        };
                        local v2583 = nil;
                        local v2584 = v2582[1];
                        local v2585 = v2582[#v2582];
                        local v2586 = nil;
                        local v2587 = nil;
                        local l_Frame_12 = Instance.new("Frame");
                        l_Frame_12.BorderSizePixel = 0;
                        l_Frame_12.Size = UDim2.new(0, 1, 1, 0);
                        v2561.Sequence = ColorSequence.new(Color3.new(1, 1, 1));
                        local function v2595(v2589) --[[ Line: 9460 ]] --[[ Name: buildSequence ]]
                            local v2590 = {};
                            table.sort(v2582, function(v2591, v2592) --[[ Line: 9462 ]]
                                return v2591[2] < v2592[2];
                            end);
                            for __, v2594 in pairs(v2582) do
                                table.insert(v2590, ColorSequenceKeypoint.new(v2594[2], v2594[1]));
                            end;
                            v2561.Sequence = ColorSequence.new(v2590);
                            if not v2589 then
                                v2561.OnSelect:Fire(v2561.Sequence);
                            end;
                        end;
                        local function v2599(v2596, v2597) --[[ Line: 9470 ]] --[[ Name: round ]]
                            local v2598 = 10 ^ v2597;
                            return math.floor(v2596 * v2598 + 0.5) / v2598;
                        end;
                        local function v2602(v2600) --[[ Line: 9475 ]] --[[ Name: updateInputs ]]
                            if v2600 then
                                v2587 = v2600;
                                local v2601 = v2600[2];
                                l_Input_9.Text = v2599(v2601, v2601 < 0.01 and 5 or v2601 < 0.1 and 4 or 3);
                                l_ColorBox_0.BackgroundColor3 = v2600[1];
                            end;
                        end;
                        local function v2617(v2603, v2604) --[[ Line: 9484 ]] --[[ Name: placeArrow ]]
                            local v2605 = l_Arrow_1:Clone();
                            v2605.Position = UDim2.new(0, v2603 - 1, 0, 0);
                            v2605.Visible = true;
                            v2605.Parent = l_Arrows_0;
                            v2605.InputBegan:Connect(function(v2606) --[[ Line: 9490 ]]
                                if v2606.UserInputType == Enum.UserInputType.MouseMovement then
                                    l_Cursor_2.Visible = true;
                                    l_Cursor_2.Position = UDim2.new(0, 9 + v2605.Position.X.Offset, 0, 0);
                                end;
                                if v2606.UserInputType == Enum.UserInputType.MouseButton1 then
                                    v2602(v2604);
                                    if v2604 == v2584 or v2604 == v2585 or v2586 then
                                        return;
                                    else
                                        local v2607 = nil;
                                        local v2608 = nil;
                                        v2586 = true;
                                        do
                                            local l_v2607_0, l_v2608_0 = v2607, v2608;
                                            l_v2608_0 = v2580.InputEnded:Connect(function(v2611) --[[ Line: 9502 ]]
                                                if v2611.UserInputType ~= Enum.UserInputType.MouseButton1 then
                                                    return;
                                                else
                                                    l_v2607_0:Disconnect();
                                                    l_v2608_0:Disconnect();
                                                    v2586 = nil;
                                                    l_Cursor_2.Visible = false;
                                                    return;
                                                end;
                                            end);
                                            l_v2607_0 = v2580.InputChanged:Connect(function(v2612) --[[ Line: 9510 ]]
                                                if v2612.UserInputType == Enum.UserInputType.MouseMovement then
                                                    local v2613 = l_ColorLine_0.AbsoluteSize.X - 1;
                                                    local v2614 = l_Mouse_6.X - l_ColorLine_0.AbsolutePosition.X;
                                                    if v2614 < 0 then
                                                        v2614 = 0;
                                                    end;
                                                    if v2613 < v2614 then
                                                        v2614 = v2613;
                                                    end;
                                                    local __ = v2614 / v2613;
                                                    v2604[2] = v2614 / v2613;
                                                    v2602(v2604);
                                                    l_Cursor_2.Visible = true;
                                                    l_Cursor_2.Position = UDim2.new(0, 9 + v2605.Position.X.Offset, 0, 0);
                                                    v2595();
                                                    v2561:Redraw();
                                                end;
                                            end);
                                        end;
                                    end;
                                end;
                            end);
                            v2605.InputEnded:Connect(function(v2616) --[[ Line: 9528 ]]
                                if v2616.UserInputType == Enum.UserInputType.MouseMovement then
                                    l_Cursor_2.Visible = false;
                                end;
                            end);
                            return v2605;
                        end;
                        local function v2620() --[[ Line: 9537 ]] --[[ Name: placeArrows ]]
                            for __, v2619 in pairs(v2582) do
                                v2619[3] = v2617(math.floor((l_ColorLine_0.AbsoluteSize.X - 1) * v2619[2]) + 1, v2619);
                            end;
                        end;
                        local function v2625(__) --[[ Line: 9543 ]] --[[ Name: redraw ]]
                            l_UIGradient_0.Color = v2561.Sequence or ColorSequence.new(Color3.new(1, 1, 1));
                            for v2622 = 2, #v2582 do
                                local v2623 = v2582[v2622];
                                local v2624 = math.floor((l_ColorLine_0.AbsoluteSize.X - 1) * v2623[2]) + 1;
                                v2623[3].Position = UDim2.new(0, v2624, 0, 0);
                            end;
                        end;
                        v2561.Redraw = v2625;
                        v2561.SetSequence = function(__, v2627) --[[ Line: 9554 ]] --[[ Name: loadSequence ]]
                            v2583 = v2627;
                            for __, v2629 in pairs(v2582) do
                                if v2629[3] then
                                    v2629[3]:Destroy();
                                end;
                            end;
                            v2582 = {};
                            v2586 = nil;
                            for __, v2631 in pairs(v2627.Keypoints) do
                                local v2632 = {
                                    v2631.Value, 
                                    v2631.Time
                                };
                                v2632[3] = v2617(v2631.Time, v2632);
                                table.insert(v2582, v2632);
                            end;
                            v2584 = v2582[1];
                            v2585 = v2582[#v2582];
                            v2586 = nil;
                            v2602(v2582[1]);
                            v2595(true);
                            v2625();
                        end;
                        local function v2637(v2633, v2634) --[[ Line: 9573 ]] --[[ Name: buttonAnimations ]]
                            v2633.InputBegan:Connect(function(v2635) --[[ Line: 9574 ]]
                                if v2635.UserInputType == Enum.UserInputType.MouseMovement then
                                    v2633.BackgroundTransparency = v2634 and 0.5 or 0.4;
                                end;
                            end);
                            v2633.InputEnded:Connect(function(v2636) --[[ Line: 9575 ]]
                                if v2636.UserInputType == Enum.UserInputType.MouseMovement then
                                    v2633.BackgroundTransparency = v2634 and 1 or 0;
                                end;
                            end);
                        end;
                        l_ColorLine_0.InputBegan:Connect(function(v2638) --[[ Line: 9578 ]]
                            if v2638.UserInputType == Enum.UserInputType.MouseButton1 and #v2582 < 20 then
                                local v2639 = l_ColorLine_0.AbsoluteSize.X - 1;
                                local v2640 = l_Mouse_6.X - l_ColorLine_0.AbsolutePosition.X;
                                if v2640 < 0 then
                                    v2640 = 0;
                                end;
                                if v2639 < v2640 then
                                    v2640 = v2639;
                                end;
                                local v2641 = v2640 / v2639;
                                local v2642 = nil;
                                local v2643 = nil;
                                for v2644, v2645 in pairs(v2582) do
                                    if v2641 <= v2645[2] then
                                        v2642 = v2582[math.max(v2644 - 1, 1)];
                                        v2643 = v2582[v2644];
                                        break;
                                    end;
                                end;
                                local v2646 = {
                                    v2642[1]:lerp(v2643[1], (v2641 - v2642[2]) / (v2643[2] - v2642[2])), 
                                    v2641
                                };
                                v2646[3] = v2617(v2646[2], v2646);
                                table.insert(v2582, v2646);
                                v2602(v2646);
                                v2595();
                                v2625();
                            end;
                        end);
                        l_ColorLine_0.InputChanged:Connect(function(v2647) --[[ Line: 9605 ]]
                            if v2647.UserInputType == Enum.UserInputType.MouseMovement then
                                local v2648 = l_ColorLine_0.AbsoluteSize.X - 1;
                                local v2649 = l_Mouse_6.X - l_ColorLine_0.AbsolutePosition.X;
                                if v2649 < 0 then
                                    v2649 = 0;
                                end;
                                if v2648 < v2649 then
                                    v2649 = v2648;
                                end;
                                l_Cursor_2.Visible = true;
                                l_Cursor_2.Position = UDim2.new(0, 10 + v2649, 0, 0);
                            end;
                        end);
                        l_ColorLine_0.InputEnded:Connect(function(v2650) --[[ Line: 9616 ]]
                            if v2650.UserInputType == Enum.UserInputType.MouseMovement then
                                local v2651 = false;
                                for __, v2653 in pairs(v2582) do
                                    if v1144.CheckMouseInGui(v2653[3]) then
                                        v2651 = v2653[3];
                                    end;
                                end;
                                l_Cursor_2.Visible = v2651 and true or false;
                                if v2651 then
                                    l_Cursor_2.Position = UDim2.new(0, 9 + v2651.Position.X.Offset, 0, 0);
                                end;
                            end;
                        end);
                        l_Input_9:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 9629 ]]
                            local l_v2587_0 = v2587;
                            local v2655 = tonumber(l_Input_9.Text);
                            if l_v2587_0 and v2655 and l_v2587_0 ~= v2584 and l_v2587_0 ~= v2585 then
                                l_v2587_0[2] = math.clamp(v2655, 0, 1);
                                v2595();
                                v2625();
                            end;
                        end);
                        l_ColorBox_0.InputBegan:Connect(function(v2656) --[[ Line: 9640 ]]
                            if v2656.UserInputType == Enum.UserInputType.MouseButton1 then
                                local l_ColorPicker_0 = v2561.ColorPicker;
                                if not l_ColorPicker_0 then
                                    l_ColorPicker_0 = v1144.ColorPicker.new();
                                    l_ColorPicker_0.Window:SetTitle("ColorSequence Color Picker");
                                    l_ColorPicker_0.OnSelect:Connect(function(v2658) --[[ Line: 9647 ]]
                                        if v2587 then
                                            v2587[1] = v2658;
                                        end;
                                        v2595();
                                        v2625();
                                    end);
                                    v2561.ColorPicker = l_ColorPicker_0;
                                end;
                                l_ColorPicker_0.Window:ShowAndFocus();
                            end;
                        end);
                        l_Delete_1.MouseButton1Click:Connect(function() --[[ Line: 9662 ]]
                            if v2587 and v2587 ~= v2584 and v2587 ~= v2585 then
                                for v2659, v2660 in pairs(v2582) do
                                    if v2660 == v2587 then
                                        v2660[3]:Destroy();
                                        table.remove(v2582, v2659);
                                        break;
                                    end;
                                end;
                                v2586 = nil;
                                v2602(v2582[1]);
                                v2595();
                                v2625();
                            end;
                        end);
                        l_Reset_1.MouseButton1Click:Connect(function() --[[ Line: 9678 ]]
                            if v2583 then
                                v2561:SetSequence(v2583);
                            end;
                        end);
                        l_Close_3.MouseButton1Click:Connect(function() --[[ Line: 9684 ]]
                            v2563:Close();
                        end);
                        l_Close_4.MouseButton1Click:Connect(function() --[[ Line: 9688 ]]
                            v2563:Close();
                        end);
                        v2637(l_Delete_1);
                        v2637(l_Reset_1);
                        v2637(l_Close_3);
                        v2620();
                        v2625();
                        v2561.Show = function(__) --[[ Line: 9699 ]]
                            v2563:Show();
                        end;
                        return v2561;
                    end
                };
            end)();
            v1144.ViewportTextBox = (function() --[[ Line: 9709 ]]
                local v2662 = v2(game:GetService("TextService"));
                local v2663 = {
                    OffsetX = 0, 
                    TextBox = v1147, 
                    CursorPos = -1, 
                    Gui = v1147, 
                    View = v1147
                };
                local v2676 = {
                    Update = function(v2664) --[[ Line: 9720 ]]
                        local v2665 = v2664.CursorPos or -1;
                        local l_Text_3 = v2664.TextBox.Text;
                        if l_Text_3 == "" then
                            v2664.TextBox.Position = UDim2.new(0, 0, 0, 0);
                            return;
                        elseif v2665 == -1 then
                            return;
                        else
                            local v2667 = l_Text_3:sub(1, v2665 - 1);
                            local v2668 = nil;
                            local v2669 = -v2664.TextBox.Position.X.Offset;
                            local v2670 = v2669 + v2664.View.AbsoluteSize.X;
                            local l_X_19 = v2662:GetTextSize(l_Text_3, v2664.TextBox.TextSize, v2664.TextBox.Font, Vector2.new(999999999, 100)).X;
                            local l_X_20 = v2662:GetTextSize(v2667, v2664.TextBox.TextSize, v2664.TextBox.Font, Vector2.new(999999999, 100)).X;
                            if v2670 < l_X_20 then
                                v2668 = math.max(-1, l_X_20 - v2664.View.AbsoluteSize.X + 2);
                            elseif l_X_20 < v2669 then
                                v2668 = math.max(-1, l_X_20 - 2);
                            elseif l_X_19 < v2670 then
                                v2668 = math.max(-1, l_X_19 - v2664.View.AbsoluteSize.X + 2);
                            end;
                            if v2668 then
                                v2664.TextBox.Position = UDim2.new(0, -v2668, 0, 0);
                                v2664.TextBox.Size = UDim2.new(1, v2668, 1, 0);
                            end;
                            return;
                        end;
                    end, 
                    GetText = function(v2673) --[[ Line: 9748 ]]
                        return v2673.TextBox.Text;
                    end, 
                    SetText = function(v2674, v2675) --[[ Line: 9752 ]]
                        v2674.TextBox.Text = v2675;
                    end
                };
                local v2677 = v1165(v2663, v2676);
                local function v2683(v2678) --[[ Line: 9758 ]] --[[ Name: convert ]]
                    local v2679 = v1157(v2663, v2677);
                    local l_Frame_13 = Instance.new("Frame");
                    l_Frame_13.BackgroundTransparency = v2678.BackgroundTransparency;
                    l_Frame_13.BackgroundColor3 = v2678.BackgroundColor3;
                    l_Frame_13.BorderSizePixel = v2678.BorderSizePixel;
                    l_Frame_13.BorderColor3 = v2678.BorderColor3;
                    l_Frame_13.Position = v2678.Position;
                    l_Frame_13.Size = v2678.Size;
                    l_Frame_13.ClipsDescendants = true;
                    l_Frame_13.Name = v2678.Name;
                    v2678.BackgroundTransparency = 1;
                    v2678.Position = UDim2.new(0, 0, 0, 0);
                    v2678.Size = UDim2.new(1, 0, 1, 0);
                    v2678.TextXAlignment = Enum.TextXAlignment.Left;
                    v2678.Name = "Input";
                    v2679.TextBox = v2678;
                    v2679.View = l_Frame_13;
                    v2679.Gui = l_Frame_13;
                    v2678.Changed:Connect(function(v2681) --[[ Line: 9780 ]]
                        if v2681 == "Text" or v2681 == "CursorPosition" or v2681 == "AbsoluteSize" then
                            local l_CursorPosition_0 = v2679.TextBox.CursorPosition;
                            if l_CursorPosition_0 ~= -1 then
                                v2679.CursorPos = l_CursorPosition_0;
                            end;
                            v2679:Update();
                        end;
                    end);
                    v2679:Update();
                    l_Frame_13.Parent = v2678.Parent;
                    v2678.Parent = l_Frame_13;
                    return v2679;
                end;
                return {
                    new = function() --[[ Line: 9796 ]] --[[ Name: new ]]
                        local l_TextBox_1 = Instance.new("TextBox");
                        l_TextBox_1.Size = UDim2.new(0, 100, 0, 20);
                        l_TextBox_1.BackgroundColor3 = v1129.Theme.TextBox;
                        l_TextBox_1.BorderColor3 = v1129.Theme.Outline3;
                        l_TextBox_1.ClearTextOnFocus = false;
                        l_TextBox_1.TextColor3 = v1129.Theme.Text;
                        l_TextBox_1.Font = Enum.Font.SourceSans;
                        l_TextBox_1.TextSize = 14;
                        l_TextBox_1.Text = "";
                        return v2683(l_TextBox_1);
                    end, 
                    convert = v2683
                };
            end)();
            v1144.Label = (function() --[[ Line: 9812 ]]
                local v2685 = v1165({}, {});
                return {
                    new = function() --[[ Line: 9817 ]] --[[ Name: new ]]
                        local l_TextLabel_2 = Instance.new("TextLabel");
                        l_TextLabel_2.BackgroundTransparency = 1;
                        l_TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left;
                        l_TextLabel_2.TextColor3 = v1129.Theme.Text;
                        l_TextLabel_2.TextTransparency = 0.1;
                        l_TextLabel_2.Size = UDim2.new(0, 100, 0, 20);
                        l_TextLabel_2.Font = Enum.Font.SourceSans;
                        l_TextLabel_2.TextSize = 14;
                        return (setmetatable({
                            Gui = l_TextLabel_2
                        }, v2685));
                    end
                };
            end)();
            v1144.Frame = (function() --[[ Line: 9836 ]]
                local v2687 = v1165({}, {});
                return {
                    new = function() --[[ Line: 9841 ]] --[[ Name: new ]]
                        local l_Frame_14 = Instance.new("Frame");
                        l_Frame_14.BackgroundColor3 = v1129.Theme.Main1;
                        l_Frame_14.BorderColor3 = v1129.Theme.Outline1;
                        l_Frame_14.Size = UDim2.new(0, 50, 0, 50);
                        return (setmetatable({
                            Gui = l_Frame_14
                        }, v2687));
                    end
                };
            end)();
            v1144.Button = (function() --[[ Line: 9856 ]]
                local v2689 = {
                    Gui = v1147, 
                    Anim = v1147, 
                    Disabled = false, 
                    OnClick = v1148, 
                    OnDown = v1148, 
                    OnUp = v1148, 
                    AllowedButtons = {
                        1
                    }
                };
                local v2690 = {};
                local l_find_10 = table.find;
                v2690.Trigger = function(v2692, v2693, v2694) --[[ Line: 9869 ]]
                    if not v2692.Disabled and l_find_10(v2692.AllowedButtons, v2694) then
                        v2692["On" .. v2693]:Fire(v2694);
                    end;
                end;
                v2690.SetDisabled = function(v2695, v2696) --[[ Line: 9875 ]]
                    v2695.Disabled = v2696;
                    if v2696 then
                        v2695.Anim:Disable();
                        v2695.Gui.TextTransparency = 0.5;
                        return;
                    else
                        v2695.Anim.Enable();
                        v2695.Gui.TextTransparency = 0;
                        return;
                    end;
                end;
                local v2697 = v1165(v2689, v2690);
                return {
                    new = function() --[[ Line: 9889 ]] --[[ Name: new ]]
                        local l_TextButton_1 = Instance.new("TextButton");
                        l_TextButton_1.AutoButtonColor = false;
                        l_TextButton_1.TextColor3 = v1129.Theme.Text;
                        l_TextButton_1.TextTransparency = 0.1;
                        l_TextButton_1.Size = UDim2.new(0, 100, 0, 20);
                        l_TextButton_1.Font = Enum.Font.SourceSans;
                        l_TextButton_1.TextSize = 14;
                        l_TextButton_1.BackgroundColor3 = v1129.Theme.Button;
                        l_TextButton_1.BorderColor3 = v1129.Theme.Outline2;
                        local v2699 = v1157(v2689, v2697);
                        v2699.Gui = l_TextButton_1;
                        v2699.Anim = v1144.ButtonAnim(l_TextButton_1, {
                            Mode = 2, 
                            StartColor = v1129.Theme.Button, 
                            HoverColor = v1129.Theme.ButtonHover, 
                            PressColor = v1129.Theme.ButtonPress, 
                            OutlineColor = v1129.Theme.Outline2
                        });
                        l_TextButton_1.MouseButton1Click:Connect(function() --[[ Line: 9904 ]]
                            v2699:Trigger("Click", 1);
                        end);
                        l_TextButton_1.MouseButton1Down:Connect(function() --[[ Line: 9905 ]]
                            v2699:Trigger("Down", 1);
                        end);
                        l_TextButton_1.MouseButton1Up:Connect(function() --[[ Line: 9906 ]]
                            v2699:Trigger("Up", 1);
                        end);
                        l_TextButton_1.MouseButton2Click:Connect(function() --[[ Line: 9908 ]]
                            v2699:Trigger("Click", 2);
                        end);
                        l_TextButton_1.MouseButton2Down:Connect(function() --[[ Line: 9909 ]]
                            v2699:Trigger("Down", 2);
                        end);
                        l_TextButton_1.MouseButton2Up:Connect(function() --[[ Line: 9910 ]]
                            v2699:Trigger("Up", 2);
                        end);
                        return v2699;
                    end
                };
            end)();
            v1144.DropDown = (function() --[[ Line: 9918 ]]
                local v2700 = {
                    Gui = v1147, 
                    Anim = v1147, 
                    Context = v1147, 
                    Selected = v1147, 
                    Disabled = false, 
                    CanBeEmpty = true, 
                    Options = {}, 
                    GuiElems = {}, 
                    OnSelect = v1148
                };
                local v2714 = {
                    Update = function(v2701) --[[ Line: 9932 ]]
                        local l_Options_0 = v2701.Options;
                        if #l_Options_0 > 0 then
                            if not v2701.Selected then
                                if not v2701.CanBeEmpty then
                                    v2701.Selected = l_Options_0[1];
                                    v2701.GuiElems.Label.Text = l_Options_0[1];
                                    return;
                                else
                                    v2701.GuiElems.Label.Text = "- Select -";
                                    return;
                                end;
                            else
                                v2701.GuiElems.Label.Text = v2701.Selected;
                                return;
                            end;
                        else
                            v2701.GuiElems.Label.Text = "- Select -";
                            return;
                        end;
                    end, 
                    ShowOptions = function(v2703) --[[ Line: 9951 ]]
                        local l_Context_0 = v2703.Context;
                        l_Context_0.Width = v2703.Gui.AbsoluteSize.X;
                        l_Context_0.ReverseYOffset = v2703.Gui.AbsoluteSize.Y;
                        l_Context_0:Show(v2703.Gui.AbsolutePosition.X, v2703.Gui.AbsolutePosition.Y + l_Context_0.ReverseYOffset);
                    end, 
                    SetOptions = function(v2705, v2706) --[[ Line: 9959 ]]
                        v2705.Options = v2706;
                        local l_Context_1 = v2705.Context;
                        local l_Options_1 = v2705.Options;
                        l_Context_1:Clear();
                        local function v2710(v2709) --[[ Line: 9966 ]]
                            v2705.Selected = v2709;
                            v2705.OnSelect:Fire(v2709);
                            v2705:Update();
                        end;
                        if v2705.CanBeEmpty then
                            l_Context_1:Add({
                                Name = "- Select -", 
                                OnClick = function() --[[ Line: 9969 ]] --[[ Name: OnClick ]]
                                    v2705.Selected = nil;
                                    v2705.OnSelect:Fire(nil);
                                    v2705:Update();
                                end
                            });
                        end;
                        for v2711 = 1, #l_Options_1 do
                            l_Context_1:Add({
                                Name = l_Options_1[v2711], 
                                OnClick = v2710
                            });
                        end;
                        v2705:Update();
                    end, 
                    SetSelected = function(v2712, v2713) --[[ Line: 9979 ]]
                        v2712.Selected = type(v2713) == "number" and v2712.Options[v2713] or v2713;
                        v2712:Update();
                    end
                };
                local v2715 = v1165(v2700, v2714);
                return {
                    new = function() --[[ Line: 9986 ]] --[[ Name: new ]]
                        local l_TextButton_2 = Instance.new("TextButton");
                        l_TextButton_2.AutoButtonColor = false;
                        l_TextButton_2.Text = "";
                        l_TextButton_2.Size = UDim2.new(0, 100, 0, 20);
                        l_TextButton_2.BackgroundColor3 = v1129.Theme.TextBox;
                        l_TextButton_2.BorderColor3 = v1129.Theme.Outline3;
                        local v2717 = v1144.Label.new();
                        v2717.Position = UDim2.new(0, 2, 0, 0);
                        v2717.Size = UDim2.new(1, -22, 1, 0);
                        v2717.TextTruncate = Enum.TextTruncate.AtEnd;
                        v2717.Parent = l_TextButton_2;
                        v1139({
                            {
                                1, 
                                "Frame", 
                                {
                                    BackgroundTransparency = 1, 
                                    Name = "EnumArrow", 
                                    Position = UDim2.new(1, -16, 0, 2), 
                                    Size = UDim2.new(0, 16, 0, 16)
                                }
                            }, 
                            {
                                2, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(0, 8, 0, 9), 
                                    Size = UDim2.new(0, 1, 0, 1)
                                }
                            }, 
                            {
                                3, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(0, 7, 0, 8), 
                                    Size = UDim2.new(0, 3, 0, 1)
                                }
                            }, 
                            {
                                4, 
                                "Frame", 
                                {
                                    BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025), 
                                    BorderSizePixel = 0, 
                                    Parent = {
                                        1
                                    }, 
                                    Position = UDim2.new(0, 6, 0, 7), 
                                    Size = UDim2.new(0, 5, 0, 1)
                                }
                            }
                        }).Parent = l_TextButton_2;
                        local v2718 = v1157(v2700, v2715);
                        v2718.Gui = l_TextButton_2;
                        v2718.Anim = v1144.ButtonAnim(l_TextButton_2, {
                            Mode = 2, 
                            StartColor = v1129.Theme.TextBox, 
                            LerpTo = v1129.Theme.Button, 
                            LerpDelta = 0.15
                        });
                        v2718.Context = v1144.ContextMenu.new();
                        v2718.Context.Iconless = true;
                        v2718.Context.MaxHeight = 200;
                        v2718.Selected = nil;
                        v2718.GuiElems = {
                            Label = v2717
                        };
                        l_TextButton_2.MouseButton1Down:Connect(function() --[[ Line: 10015 ]]
                            v2718:ShowOptions();
                        end);
                        v2718:Update();
                        return v2718;
                    end
                };
            end)();
            v1144.ClickSystem = (function() --[[ Line: 10023 ]]
                local v2719 = {
                    LastItem = v1147, 
                    OnDown = v1148, 
                    OnRelease = v1148, 
                    AllowedButtons = {
                        1
                    }, 
                    Combo = 0, 
                    MaxCombo = 2, 
                    ComboTime = 0.5, 
                    Items = {}, 
                    ItemCons = {}, 
                    ClickId = -1, 
                    LastButton = ""
                };
                local v2720 = {};
                local __ = tostring;
                local function __(v2722) --[[ Line: 10040 ]]
                    local v2723 = table.find(v2722.Signal.Connections, v2722);
                    if v2723 then
                        table.remove(v2722.Signal.Connections, v2723);
                    end;
                end;
                v2720.Trigger = function(v2725, v2726, v2727) --[[ Line: 10045 ]]
                    if table.find(v2725.AllowedButtons, v2727) then
                        if v2725.LastButton ~= v2727 or v2725.LastItem ~= v2726 or v2725.Combo == v2725.MaxCombo or tick() - v2725.ClickId > v2725.ComboTime then
                            v2725.Combo = 0;
                            v2725.LastButton = v2727;
                            v2725.LastItem = v2726;
                        end;
                        v2725.Combo = v2725.Combo + 1;
                        v2725.ClickId = tick();
                        local v2728 = nil;
                        do
                            local l_v2728_0 = v2728;
                            l_v2728_0 = v1137.UserInputService.InputEnded:Connect(function(v2730) --[[ Line: 10056 ]]
                                if v2730.UserInputType == Enum.UserInputType["MouseButton" .. v2727] then
                                    l_v2728_0:Disconnect();
                                    if v1144.CheckMouseInGui(v2726) and v2725.LastButton == v2727 and v2725.LastItem == v2726 then
                                        v2725.OnRelease:Fire(v2726, v2725.Combo, v2727);
                                    end;
                                end;
                            end);
                            v2725.OnDown:Fire(v2726, v2725.Combo, v2727);
                        end;
                    end;
                end;
                v2720.Add = function(v2731, v2732) --[[ Line: 10069 ]]
                    if table.find(v2731.Items, v2732) then
                        return;
                    else
                        local v2733 = {
                            [1] = v2732.MouseButton1Down:Connect(function() --[[ Line: 10073 ]]
                                v2731:Trigger(v2732, 1);
                            end), 
                            [2] = v2732.MouseButton2Down:Connect(function() --[[ Line: 10074 ]]
                                v2731:Trigger(v2732, 2);
                            end)
                        };
                        v2731.ItemCons[v2732] = v2733;
                        v2731.Items[#v2731.Items + 1] = v2732;
                        return;
                    end;
                end;
                v2720.Remove = function(v2734, v2735) --[[ Line: 10080 ]]
                    local v2736 = table.find(v2734.Items, v2735);
                    if not v2736 then
                        return;
                    else
                        for __, v2738 in pairs(v2734.ItemCons[v2735]) do
                            v2738:Disconnect();
                        end;
                        v2734.ItemCons[v2735] = nil;
                        table.remove(v2734.Items, v2736);
                        return;
                    end;
                end;
                local v2739 = {
                    __index = v2720
                };
                return {
                    new = function() --[[ Line: 10093 ]] --[[ Name: new ]]
                        return (v1157(v2719, v2739));
                    end
                };
            end)();
            return v1144;
        end;
        return {
            InitDeps = v1142, 
            InitAfterMain = v1143, 
            Main = v2740
        };
    end
};
local __ = nil;
local v2743 = nil;
local v2744 = nil;
local v2745 = nil;
local v2746 = nil;
local v2747 = nil;
local __ = nil;
local v2749 = nil;
local v2750 = nil;
local v2751 = nil;
v2746 = (function() --[[ Line: 10114 ]]
    local l_fromRGB_1 = Color3.fromRGB;
    return {
        Explorer = {
            _Recurse = true, 
            Sorting = true, 
            TeleportToOffset = Vector3.new(0, 0, 0), 
            ClickToRename = true, 
            AutoUpdateSearch = true, 
            AutoUpdateMode = 0, 
            PartSelectionBox = true, 
            GuiSelectionBox = true, 
            CopyPathUseGetChildren = true
        }, 
        Properties = {
            _Recurse = true, 
            MaxConflictCheck = 50, 
            ShowDeprecated = false, 
            ShowHidden = false, 
            ClearOnFocus = false, 
            LoadstringInput = true, 
            NumberRounding = 3, 
            ShowAttributes = false, 
            MaxAttributes = 50, 
            ScaleType = 1
        }, 
        Theme = {
            _Recurse = true, 
            Main1 = l_fromRGB_1(52, 52, 52), 
            Main2 = l_fromRGB_1(45, 45, 45), 
            Outline1 = l_fromRGB_1(33, 33, 33), 
            Outline2 = l_fromRGB_1(55, 55, 55), 
            Outline3 = l_fromRGB_1(30, 30, 30), 
            TextBox = l_fromRGB_1(38, 38, 38), 
            Menu = l_fromRGB_1(32, 32, 32), 
            ListSelection = l_fromRGB_1(11, 90, 175), 
            Button = l_fromRGB_1(60, 60, 60), 
            ButtonHover = l_fromRGB_1(68, 68, 68), 
            ButtonPress = l_fromRGB_1(40, 40, 40), 
            Highlight = l_fromRGB_1(75, 75, 75), 
            Text = l_fromRGB_1(255, 255, 255), 
            PlaceholderText = l_fromRGB_1(100, 100, 100), 
            Important = l_fromRGB_1(255, 0, 0), 
            ExplorerIconMap = "", 
            MiscIconMap = "", 
            Syntax = {
                Text = l_fromRGB_1(204, 204, 204), 
                Background = l_fromRGB_1(36, 36, 36), 
                Selection = l_fromRGB_1(255, 255, 255), 
                SelectionBack = l_fromRGB_1(11, 90, 175), 
                Operator = l_fromRGB_1(204, 204, 204), 
                Number = l_fromRGB_1(255, 198, 0), 
                String = l_fromRGB_1(173, 241, 149), 
                Comment = l_fromRGB_1(102, 102, 102), 
                Keyword = l_fromRGB_1(248, 109, 124), 
                Error = l_fromRGB_1(255, 0, 0), 
                FindBackground = l_fromRGB_1(141, 118, 0), 
                MatchingWord = l_fromRGB_1(85, 85, 85), 
                BuiltIn = l_fromRGB_1(132, 214, 247), 
                CurrentLine = l_fromRGB_1(45, 50, 65), 
                LocalMethod = l_fromRGB_1(253, 251, 172), 
                LocalProperty = l_fromRGB_1(97, 161, 241), 
                Nil = l_fromRGB_1(255, 198, 0), 
                Bool = l_fromRGB_1(255, 198, 0), 
                Function = l_fromRGB_1(248, 109, 124), 
                Local = l_fromRGB_1(248, 109, 124), 
                Self = l_fromRGB_1(248, 109, 124), 
                FunctionName = l_fromRGB_1(253, 251, 172), 
                Bracket = l_fromRGB_1(204, 204, 204)
            }
        }
    };
end)();
local v2753 = {};
local v2754 = {};
local v2755 = {};
local v2759 = setmetatable({}, {
    __index = function(v2756, v2757) --[[ Line: 10192 ]] --[[ Name: __index ]]
        local v2758 = v2(game:GetService(v2757));
        v2756[v2757] = v2758;
        return v2758;
    end
});
local v2760 = v2759.Players.LocalPlayer or v2759.Players.PlayerAdded:wait();
local function v2769(v2761) --[[ Line: 10199 ]]
    local v2762 = {};
    for __, v2764 in pairs(v2761) do
        v2762[v2764[1]] = Instance.new(v2764[2]);
    end;
    for __, v2766 in pairs(v2761) do
        for v2767, v2768 in pairs(v2766[3]) do
            if type(v2768) == "table" then
                v2762[v2766[1]][v2767] = v2762[v2768[1]];
            else
                v2762[v2766[1]][v2767] = v2768;
            end;
        end;
    end;
    return v2762[1];
end;
local function v2775(v2770, v2771) --[[ Line: 10216 ]]
    local v2772 = Instance.new(v2770);
    for v2773, v2774 in next, v2771 do
        v2772[v2773] = v2774;
    end;
    return v2772;
end;
(function() --[[ Line: 10224 ]]
    local v2776 = {
        ModuleList = {
            "Explorer", 
            "Properties", 
            "ScriptViewer"
        }, 
        Elevated = false, 
        MissingEnv = {}, 
        Version = "", 
        Mouse = v2760:GetMouse(), 
        AppControls = {}, 
        Apps = v2754, 
        MenuApps = {}, 
        DisplayOrders = {
            SideWindow = 8, 
            Window = 10, 
            Menu = 100000, 
            Core = 101000
        }
    };
    v2776.GetInitDeps = function() --[[ Line: 10243 ]]
        return {
            Main = v2776, 
            Lib = v2749, 
            Apps = v2754, 
            Settings = v2753, 
            API = v2750, 
            RMD = v2751, 
            env = v2755, 
            service = v2759, 
            plr = v2760, 
            create = v2769, 
            createSimple = v2775
        };
    end;
    v2776.Error = function(v2777) --[[ Line: 10260 ]]
        if rconsoleprint then
            rconsoleprint("DEX ERROR: " .. tostring(v2777) .. "\n");
            wait(9000000000);
            return;
        else
            error(v2777);
            return;
        end;
    end;
    v2776.LoadModule = function(v2778) --[[ Line: 10269 ]]
        if v2776.Elevated then
            local v2779 = nil;
            if v2741 then
                v2779 = v2741[v2778]();
                if not v2779 then
                    v2776.Error("Missing Embedded Module: " .. v2778);
                end;
            end;
            v2776.AppControls[v2778] = v2779;
            v2779.InitDeps(v2776.GetInitDeps());
            local v2780 = v2779.Main();
            v2754[v2778] = v2780;
            return v2780;
        else
            local v2781 = script:WaitForChild("Modules"):WaitForChild(v2778, 2);
            if not v2781 then
                v2776.Error("CANNOT FIND MODULE " .. v2778);
            end;
            local v2782 = require(v2781);
            v2776.AppControls[v2778] = v2782;
            v2782.InitDeps(v2776.GetInitDeps());
            local v2783 = v2782.Main();
            v2754[v2778] = v2783;
            return v2783;
        end;
    end;
    v2776.LoadModules = function() --[[ Line: 10299 ]]
        for __, v2785 in pairs(v2776.ModuleList) do
            local l_status_14, l_result_14 = pcall(v2776.LoadModule, v2785);
            if not l_status_14 then
                v2776.Error("FAILED LOADING " + v2785 + " CAUSE " + l_result_14);
            end;
        end;
        v2743 = v2754.Explorer;
        v2744 = v2754.Properties;
        v2745 = v2754.ScriptViewer;
        v2747 = v2754.Notebook;
        local v2788 = {
            Explorer = v2743, 
            Properties = v2744, 
            ScriptViewer = v2745, 
            Notebook = v2747
        };
        v2776.AppControls.Lib.InitAfterMain(v2788);
        for __, v2790 in pairs(v2776.ModuleList) do
            local v2791 = v2776.AppControls[v2790];
            if v2791 then
                v2791.InitAfterMain(v2788);
            end;
        end;
    end;
    v2776.InitEnv = function() --[[ Line: 10328 ]]
        setmetatable(v2755, {
            __newindex = function(v2792, v2793, v2794) --[[ Line: 10329 ]] --[[ Name: __newindex ]]
                if not v2794 then
                    v2776.MissingEnv[#v2776.MissingEnv + 1] = v2793;
                    return;
                else
                    rawset(v2792, v2793, v2794);
                    return;
                end;
            end
        });
        v2755.readfile = readfile;
        v2755.writefile = writefile;
        v2755.appendfile = appendfile;
        v2755.makefolder = makefolder;
        v2755.listfiles = listfiles;
        v2755.loadfile = loadfile;
        v2755.movefileas = movefileas;
        v2755.saveinstance = saveinstance;
        v2755.getupvalues = debug and debug.getupvalues or getupvalues or getupvals;
        v2755.getconstants = debug and debug.getconstants or getconstants or getconsts;
        v2755.getinfo = debug and (debug.getinfo or debug.info) or getinfo;
        v2755.islclosure = islclosure or is_l_closure or is_lclosure;
        v2755.checkcaller = checkcaller;
        v2755.getgc = getgc or get_gc_objects;
        v2755.base64encode = crypt and crypt.base64 and crypt.base64.encode;
        v2755.getscriptbytecode = getscriptbytecode;
        v2755.request = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request;
        v2755.decompile = decompile or v2755.getscriptbytecode and v2755.request and v2755.base64encode and function(v2795) --[[ Line: 10358 ]]
            local l_status_15, l_result_15 = pcall(v2755.getscriptbytecode, v2795);
            if not l_status_15 then
                return "failed to get bytecode " .. tostring(l_result_15);
            else
                local v2798 = v2755.request({
                    Url = "https://unluau.lonegladiator.dev/unluau/decompile", 
                    Method = "POST", 
                    Headers = {
                        ["Content-Type"] = "application/json"
                    }, 
                    Body = v2759.HttpService:JSONEncode({
                        version = 5, 
                        bytecode = v2755.base64encode(l_result_15)
                    })
                });
                local v2799 = v2759.HttpService:JSONDecode(v2798.Body);
                if v2799.status ~= "ok" then
                    return "decompilation failed: " .. tostring(v2799.status);
                else
                    return v2799.output;
                end;
            end;
        end;
        v2755.protectgui = protect_gui or syn and syn.protect_gui;
        v2755.gethui = gethui or get_hidden_gui;
        v2755.setclipboard = setclipboard or toclipboard or set_clipboard or Clipboard and Clipboard.set;
        v2755.getnilinstances = getnilinstances or get_nil_instances;
        v2755.getloadedmodules = getloadedmodules;
        v2776.GuiHolder = v2776.Elevated and v2759.CoreGui or v2760:FindFirstChildWhichIsA("PlayerGui");
        setmetatable(v2755, nil);
    end;
    v2776.LoadSettings = function() --[[ Line: 10396 ]]
        local l_status_16, l_result_16 = pcall(v2755.readfile or error, "DexSettings.json");
        if l_status_16 and l_result_16 and l_result_16 ~= "" then
            local v2802, v2803 = v2759.HttpService:JSONDecode(l_result_16);
            if v2802 and v2803 then
                for __, __ in next, v2803 do

                end;
                return;
            end;
        else
            v2776.ResetSettings();
        end;
    end;
    v2776.ResetSettings = function() --[[ Line: 10412 ]]
        local function v2806(v2807, v2808) --[[ Line: 10413 ]] --[[ Name: recur ]]
            for v2809, v2810 in pairs(v2807) do
                if type(v2810) == "table" and v2810._Recurse then
                    if type(v2808[v2809]) ~= "table" then
                        v2808[v2809] = {};
                    end;
                    v2806(v2810, v2808[v2809]);
                else
                    v2808[v2809] = v2810;
                end;
            end;
            return v2808;
        end;
        v2806(v2746, v2753);
    end;
    v2776.FetchAPI = function() --[[ Line: 10429 ]]
        local v2811 = nil;
        local v2812 = nil;
        if v2776.Elevated then
            if v2776.LocalDepsUpToDate() then
                local v2813 = v2749.ReadFile("dex/rbx_api.dat");
                if v2813 then
                    v2812 = v2813;
                else
                    v2776.DepsVersionData[1] = "";
                end;
            end;
            v2812 = v2812 or game:HttpGet("http://setup.roblox.com/" .. v2776.RobloxVersion .. "-API-Dump.json");
        elseif script:FindFirstChild("API") then
            v2812 = require(script.API);
        else
            error("NO API EXISTS");
        end;
        v2776.RawAPI = v2812;
        v2811 = v2759.HttpService:JSONDecode(v2812);
        local v2814 = {};
        local v2815 = {};
        local v2816 = {};
        local v2817 = {};
        local function v2823(v2818, v2819, v2820) --[[ Line: 10454 ]] --[[ Name: insertAbove ]]
            local v2821 = table.find(v2818, v2819);
            if not v2821 then
                return;
            else
                table.remove(v2818, v2821);
                local v2822 = table.find(v2818, v2820);
                if not v2822 then
                    return;
                else
                    table.insert(v2818, v2822, v2819);
                    return;
                end;
            end;
        end;
        for __, v2825 in pairs(v2811.Classes) do
            local v2826 = {
                Name = v2825.Name, 
                Superclass = v2825.Superclass, 
                Properties = {}, 
                Functions = {}, 
                Events = {}, 
                Callbacks = {}, 
                Tags = {}
            };
            if v2825.Tags then
                for __, v2828 in pairs(v2825.Tags) do
                    v2826.Tags[v2828] = true;
                end;
            end;
            for __, v2830 in pairs(v2825.Members) do
                local v2831 = {
                    Name = v2830.Name, 
                    Class = v2825.Name, 
                    Security = v2830.Security, 
                    Tags = {}
                };
                if v2830.Tags then
                    for __, v2833 in pairs(v2830.Tags) do
                        v2831.Tags[v2833] = true;
                    end;
                end;
                local l_MemberType_0 = v2830.MemberType;
                if l_MemberType_0 == "Property" then
                    local v2835 = (v2830.Category or "Other"):match("^%s*(.-)%s*$");
                    if not v2817[v2835] then
                        v2816[#v2816 + 1] = v2835;
                        v2817[v2835] = true;
                    end;
                    v2831.ValueType = v2830.ValueType;
                    v2831.Category = v2835;
                    v2831.Serialization = v2830.Serialization;
                    table.insert(v2826.Properties, v2831);
                elseif l_MemberType_0 == "Function" then
                    v2831.Parameters = {};
                    v2831.ReturnType = v2830.ReturnType.Name;
                    for __, v2837 in pairs(v2830.Parameters) do
                        table.insert(v2831.Parameters, {
                            Name = v2837.Name, 
                            Type = v2837.Type.Name
                        });
                    end;
                    table.insert(v2826.Functions, v2831);
                elseif l_MemberType_0 == "Event" then
                    v2831.Parameters = {};
                    for __, v2839 in pairs(v2830.Parameters) do
                        table.insert(v2831.Parameters, {
                            Name = v2839.Name, 
                            Type = v2839.Type.Name
                        });
                    end;
                    table.insert(v2826.Events, v2831);
                end;
            end;
            v2814[v2825.Name] = v2826;
        end;
        for __, v2841 in pairs(v2814) do
            v2841.Superclass = v2814[v2841.Superclass];
        end;
        for __, v2843 in pairs(v2811.Enums) do
            local v2844 = {
                Name = v2843.Name, 
                Items = {}, 
                Tags = {}
            };
            if v2843.Tags then
                for __, v2846 in pairs(v2843.Tags) do
                    v2844.Tags[v2846] = true;
                end;
            end;
            for __, v2848 in pairs(v2843.Items) do
                local v2849 = {
                    Name = v2848.Name, 
                    Value = v2848.Value
                };
                table.insert(v2844.Items, v2849);
            end;
            v2815[v2843.Name] = v2844;
        end;
        local function v2858(v2850, v2851) --[[ Line: 10535 ]] --[[ Name: getMember ]]
            if not v2814[v2850] or not v2814[v2850][v2851] then
                return;
            else
                local v2852 = {};
                local v2853 = v2814[v2850];
                while v2853 do
                    for __, v2855 in pairs(v2853[v2851]) do
                        v2852[#v2852 + 1] = v2855;
                    end;
                    v2853 = v2853.Superclass;
                end;
                table.sort(v2852, function(v2856, v2857) --[[ Line: 10547 ]]
                    return v2856.Name < v2857.Name;
                end);
                return v2852;
            end;
        end;
        v2823(v2816, "Behavior", "Tuning");
        v2823(v2816, "Appearance", "Data");
        v2823(v2816, "Attachments", "Axes");
        v2823(v2816, "Cylinder", "Slider");
        v2823(v2816, "Localization", "Jump Settings");
        v2823(v2816, "Surface", "Motion");
        v2823(v2816, "Surface Inputs", "Surface");
        v2823(v2816, "Part", "Surface Inputs");
        v2823(v2816, "Assembly", "Surface Inputs");
        v2823(v2816, "Character", "Controls");
        v2816[#v2816 + 1] = "Unscriptable";
        v2816[#v2816 + 1] = "Attributes";
        local v2859 = {};
        for v2860 = 1, #v2816 do
            v2859[v2816[v2860]] = v2860;
        end;
        return {
            Classes = v2814, 
            Enums = v2815, 
            CategoryOrder = v2859, 
            GetMember = v2858
        };
    end;
    v2776.FetchRMD = function() --[[ Line: 10577 ]]
        local v2861 = nil;
        if v2776.Elevated then
            if v2776.LocalDepsUpToDate() then
                local v2862 = v2749.ReadFile("dex/rbx_rmd.dat");
                if v2862 then
                    v2861 = v2862;
                else
                    v2776.DepsVersionData[1] = "";
                end;
            end;
            v2861 = v2861 or game:HttpGet("https://raw.githubusercontent.com/CloneTrooper1019/Roblox-Client-Tracker/roblox/ReflectionMetadata.xml");
        elseif script:FindFirstChild("RMD") then
            v2861 = require(script.RMD);
        else
            error("NO RMD EXISTS");
        end;
        v2776.RawRMD = v2861;
        local v2863 = v2749.ParseXML(v2861);
        local l_children_0 = v2863.children[1].children[1].children;
        local l_children_1 = v2863.children[1].children[2].children;
        local v2866 = {};
        local v2867 = {};
        local v2868 = {};
        for __, v2870 in pairs(l_children_0) do
            local v2871 = "";
            for __, v2873 in pairs(v2870.children) do
                if v2873.tag == "Properties" then
                    local v2874 = {
                        Properties = {}, 
                        Functions = {}
                    };
                    local l_children_2 = v2873.children;
                    for __, v2877 in pairs(l_children_2) do
                        local l_name_1 = v2877.attrs.name;
                        v2874[l_name_1:sub(1, 1):upper() .. l_name_1:sub(2)] = v2877.children[1].text;
                    end;
                    v2871 = v2874.Name;
                    v2867[v2871] = v2874;
                elseif v2873.attrs.class == "ReflectionMetadataProperties" then
                    local l_children_3 = v2873.children;
                    for __, v2881 in pairs(l_children_3) do
                        if v2881.attrs.class == "ReflectionMetadataMember" then
                            local v2882 = {};
                            if v2881.children[1].tag == "Properties" then
                                local l_children_4 = v2881.children[1].children;
                                for __, v2885 in pairs(l_children_4) do
                                    if v2885.attrs then
                                        local l_name_2 = v2885.attrs.name;
                                        v2882[l_name_2:sub(1, 1):upper() .. l_name_2:sub(2)] = v2885.children[1].text;
                                    end;
                                end;
                                if v2882.PropertyOrder then
                                    local v2887 = v2866[v2871];
                                    if not v2887 then
                                        v2887 = {};
                                        v2866[v2871] = v2887;
                                    end;
                                    v2887[v2882.Name] = tonumber(v2882.PropertyOrder);
                                end;
                                v2867[v2871].Properties[v2882.Name] = v2882;
                            end;
                        end;
                    end;
                elseif v2873.attrs.class == "ReflectionMetadataFunctions" then
                    local l_children_5 = v2873.children;
                    for __, v2890 in pairs(l_children_5) do
                        if v2890.attrs.class == "ReflectionMetadataMember" then
                            local v2891 = {};
                            if v2890.children[1].tag == "Properties" then
                                local l_children_6 = v2890.children[1].children;
                                for __, v2894 in pairs(l_children_6) do
                                    if v2894.attrs then
                                        local l_name_3 = v2894.attrs.name;
                                        v2891[l_name_3:sub(1, 1):upper() .. l_name_3:sub(2)] = v2894.children[1].text;
                                    end;
                                end;
                                v2867[v2871].Functions[v2891.Name] = v2891;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        for __, v2897 in pairs(l_children_1) do
            local v2898 = "";
            for __, v2900 in pairs(v2897.children) do
                if v2900.tag == "Properties" then
                    local v2901 = {
                        Items = {}
                    };
                    local l_children_7 = v2900.children;
                    for __, v2904 in pairs(l_children_7) do
                        local l_name_4 = v2904.attrs.name;
                        v2901[l_name_4:sub(1, 1):upper() .. l_name_4:sub(2)] = v2904.children[1].text;
                    end;
                    v2898 = v2901.Name;
                    v2868[v2898] = v2901;
                elseif v2900.attrs.class == "ReflectionMetadataEnumItem" then
                    local v2906 = {};
                    if v2900.children[1].tag == "Properties" then
                        local l_children_8 = v2900.children[1].children;
                        for __, v2909 in pairs(l_children_8) do
                            local l_name_5 = v2909.attrs.name;
                            v2906[l_name_5:sub(1, 1):upper() .. l_name_5:sub(2)] = v2909.children[1].text;
                        end;
                        v2868[v2898].Items[v2906.Name] = v2906;
                    end;
                end;
            end;
        end;
        return {
            Classes = v2867, 
            Enums = v2868, 
            PropertyOrders = v2866
        };
    end;
    v2776.ShowGui = function(v2911) --[[ Line: 10692 ]]
        if v2755.gethui then
            v2911.Parent = v2755.gethui();
            return;
        elseif v2755.protectgui then
            v2755.protectgui(v2911);
            v2911.Parent = v2776.GuiHolder;
            return;
        else
            v2911.Parent = v2776.GuiHolder;
            return;
        end;
    end;
    v2776.CreateIntro = function(v2912) --[[ Line: 10703 ]]
        local v2913 = v2769({
            {
                1, 
                "ScreenGui", 
                {
                    Name = "Intro"
                }
            }, 
            {
                2, 
                "Frame", 
                {
                    Active = true, 
                    BackgroundColor3 = Color3.new(0.20392157137394, 0.20392157137394, 0.20392157137394), 
                    BorderSizePixel = 0, 
                    Name = "Main", 
                    Parent = {
                        1
                    }, 
                    Position = UDim2.new(0.5, -175, 0.5, -100), 
                    Size = UDim2.new(0, 350, 0, 200)
                }
            }, 
            {
                3, 
                "Frame", 
                {
                    BackgroundColor3 = Color3.new(0.17647059261799, 0.17647059261799, 0.17647059261799), 
                    BorderSizePixel = 0, 
                    ClipsDescendants = true, 
                    Name = "Holder", 
                    Parent = {
                        2
                    }, 
                    Size = UDim2.new(1, 0, 1, 0)
                }
            }, 
            {
                4, 
                "UIGradient", 
                {
                    Parent = {
                        3
                    }, 
                    Rotation = 30, 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1, 0), 
                        NumberSequenceKeypoint.new(1, 1, 0)
                    })
                }
            }, 
            {
                5, 
                "TextLabel", 
                {
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    BackgroundTransparency = 1, 
                    Font = 4, 
                    Name = "Title", 
                    Parent = {
                        3
                    }, 
                    Position = UDim2.new(0, -190, 0, 15), 
                    Size = UDim2.new(0, 100, 0, 50), 
                    Text = "Dex", 
                    TextColor3 = Color3.new(1, 1, 1), 
                    TextSize = 50, 
                    TextTransparency = 1
                }
            }, 
            {
                6, 
                "TextLabel", 
                {
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    BackgroundTransparency = 1, 
                    Font = 3, 
                    Name = "Desc", 
                    Parent = {
                        3
                    }, 
                    Position = UDim2.new(0, -230, 0, 60), 
                    Size = UDim2.new(0, 180, 0, 25), 
                    Text = "Ultimate Debugging Suite", 
                    TextColor3 = Color3.new(1, 1, 1), 
                    TextSize = 18, 
                    TextTransparency = 1
                }
            }, 
            {
                7, 
                "TextLabel", 
                {
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    BackgroundTransparency = 1, 
                    Font = 3, 
                    Name = "StatusText", 
                    Parent = {
                        3
                    }, 
                    Position = UDim2.new(0, 20, 0, 110), 
                    Size = UDim2.new(0, 180, 0, 25), 
                    Text = "Fetching API", 
                    TextColor3 = Color3.new(1, 1, 1), 
                    TextSize = 14, 
                    TextTransparency = 1
                }
            }, 
            {
                8, 
                "Frame", 
                {
                    BackgroundColor3 = Color3.new(0.20392157137394, 0.20392157137394, 0.20392157137394), 
                    BorderSizePixel = 0, 
                    Name = "ProgressBar", 
                    Parent = {
                        3
                    }, 
                    Position = UDim2.new(0, 110, 0, 145), 
                    Size = UDim2.new(0, 0, 0, 4)
                }
            }, 
            {
                9, 
                "Frame", 
                {
                    BackgroundColor3 = Color3.new(0.2392156869173, 0.56078433990479, 0.86274510622025), 
                    BorderSizePixel = 0, 
                    Name = "Bar", 
                    Parent = {
                        8
                    }, 
                    Size = UDim2.new(0, 0, 1, 0)
                }
            }, 
            {
                10, 
                "ImageLabel", 
                {
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    BackgroundTransparency = 1, 
                    Image = "rbxassetid://2764171053", 
                    ImageColor3 = Color3.new(0.17647059261799, 0.17647059261799, 0.17647059261799), 
                    Parent = {
                        8
                    }, 
                    ScaleType = 1, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    SliceCenter = Rect.new(2, 2, 254, 254)
                }
            }, 
            {
                11, 
                "TextLabel", 
                {
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    BackgroundTransparency = 1, 
                    Font = 3, 
                    Name = "Creator", 
                    Parent = {
                        2
                    }, 
                    Position = UDim2.new(1, -110, 1, -20), 
                    Size = UDim2.new(0, 105, 0, 20), 
                    Text = "Developed by Moon", 
                    TextColor3 = Color3.new(1, 1, 1), 
                    TextSize = 14, 
                    TextXAlignment = 1
                }
            }, 
            {
                12, 
                "UIGradient", 
                {
                    Parent = {
                        11
                    }, 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1, 0), 
                        NumberSequenceKeypoint.new(1, 1, 0)
                    })
                }
            }, 
            {
                13, 
                "TextLabel", 
                {
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    BackgroundTransparency = 1, 
                    Font = 3, 
                    Name = "Version", 
                    Parent = {
                        2
                    }, 
                    Position = UDim2.new(1, -110, 1, -35), 
                    Size = UDim2.new(0, 105, 0, 20), 
                    Text = v2776.Version, 
                    TextColor3 = Color3.new(1, 1, 1), 
                    TextSize = 14, 
                    TextXAlignment = 1
                }
            }, 
            {
                14, 
                "UIGradient", 
                {
                    Parent = {
                        13
                    }, 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1, 0), 
                        NumberSequenceKeypoint.new(1, 1, 0)
                    })
                }
            }, 
            {
                15, 
                "ImageLabel", 
                {
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Image = "rbxassetid://1427967925", 
                    Name = "Outlines", 
                    Parent = {
                        2
                    }, 
                    Position = UDim2.new(0, -5, 0, -5), 
                    ScaleType = 1, 
                    Size = UDim2.new(1, 10, 1, 10), 
                    SliceCenter = Rect.new(6, 6, 25, 25), 
                    TileSize = UDim2.new(0, 20, 0, 20)
                }
            }, 
            {
                16, 
                "UIGradient", 
                {
                    Parent = {
                        15
                    }, 
                    Rotation = -30, 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1, 0), 
                        NumberSequenceKeypoint.new(1, 1, 0)
                    })
                }
            }, 
            {
                17, 
                "UIGradient", 
                {
                    Parent = {
                        2
                    }, 
                    Rotation = -30, 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1, 0), 
                        NumberSequenceKeypoint.new(1, 1, 0)
                    })
                }
            }
        });
        v2776.ShowGui(v2913);
        local l_UIGradient_1 = v2913.Main.UIGradient;
        local l_UIGradient_2 = v2913.Main.Outlines.UIGradient;
        local l_UIGradient_3 = v2913.Main.Holder.UIGradient;
        local l_Title_0 = v2913.Main.Holder.Title;
        local l_Desc_0 = v2913.Main.Holder.Desc;
        local l_Version_0 = v2913.Main.Version;
        local l_UIGradient_4 = l_Version_0.UIGradient;
        local l_Creator_0 = v2913.Main.Creator;
        local l_UIGradient_5 = l_Creator_0.UIGradient;
        local l_StatusText_0 = v2913.Main.Holder.StatusText;
        local l_ProgressBar_0 = v2913.Main.Holder.ProgressBar;
        local l_TweenService_1 = v2759.TweenService;
        local l_RenderStepped_1 = v2759.RunService.RenderStepped;
        local l_wait_1 = l_RenderStepped_1.wait;
        local function v2930(v2928) --[[ Line: 10739 ]]
            if not v2928 then
                return l_wait_1(l_RenderStepped_1);
            else
                local v2929 = tick();
                while tick() - v2929 < v2928 do
                    l_wait_1(l_RenderStepped_1);
                end;
                return;
            end;
        end;
        l_StatusText_0.Text = v2912;
        local function v2936(v2931, v2932, v2933) --[[ Line: 10747 ]] --[[ Name: tweenNumber ]]
            local l_IntValue_0 = Instance.new("IntValue");
            l_IntValue_0.Value = 0;
            l_IntValue_0.Changed:Connect(v2933);
            local v2935 = l_TweenService_1:Create(l_IntValue_0, v2932, {
                Value = v2931
            });
            v2935:Play();
            v2935.Completed:Connect(function() --[[ Line: 10753 ]]
                l_IntValue_0:Destroy();
            end);
        end;
        local v2937 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        v2936(100, v2937, function(v2938) --[[ Line: 10759 ]]
            v2938 = v2938 / 200;
            local v2939 = NumberSequenceKeypoint.new(0, 0);
            local v2940 = NumberSequenceKeypoint.new(v2938, 0);
            local v2941 = NumberSequenceKeypoint.new(math.min(0.5, v2938 + math.min(0.05, v2938)), 1);
            if v2940.Time == v2941.Time then
                v2941 = v2940;
            end;
            local v2942 = NumberSequenceKeypoint.new(1 - v2938, 0);
            local v2943 = NumberSequenceKeypoint.new(math.max(0.5, 1 - v2938 - math.min(0.05, v2938)), 1);
            if v2942.Time == v2943.Time then
                v2943 = v2942;
            end;
            local v2944 = NumberSequenceKeypoint.new(1, 0);
            l_UIGradient_1.Transparency = NumberSequence.new({
                v2939, 
                v2940, 
                v2941, 
                v2943, 
                v2942, 
                v2944
            });
            l_UIGradient_2.Transparency = NumberSequence.new({
                v2939, 
                v2940, 
                v2941, 
                v2943, 
                v2942, 
                v2944
            });
        end);
        v2930(0.4);
        v2936(100, v2937, function(v2945) --[[ Line: 10775 ]]
            v2945 = v2945 / 166.66;
            local v2946 = NumberSequenceKeypoint.new(0, 0);
            local v2947 = NumberSequenceKeypoint.new(v2945, 0);
            local v2948 = NumberSequenceKeypoint.new(v2945 + 0.01, 1);
            local v2949 = NumberSequenceKeypoint.new(1, 1);
            l_UIGradient_3.Transparency = NumberSequence.new({
                v2946, 
                v2947, 
                v2948, 
                v2949
            });
        end);
        l_TweenService_1:Create(l_Title_0, v2937, {
            Position = UDim2.new(0, 60, 0, 15), 
            TextTransparency = 0
        }):Play();
        l_TweenService_1:Create(l_Desc_0, v2937, {
            Position = UDim2.new(0, 20, 0, 60), 
            TextTransparency = 0
        }):Play();
        local function v2956(v2950) --[[ Line: 10787 ]] --[[ Name: rightTextTransparency ]]
            v2936(100, v2937, function(v2951) --[[ Line: 10788 ]]
                v2951 = v2951 / 100;
                local v2952 = NumberSequenceKeypoint.new(1 - v2951, 0);
                local v2953 = NumberSequenceKeypoint.new(math.max(0, 1 - v2951 - 0.01), 1);
                if v2952.Time == v2953.Time then
                    v2953 = v2952;
                end;
                local v2954 = NumberSequenceKeypoint.new(0, v2952 == v2953 and 0 or 1);
                local v2955 = NumberSequenceKeypoint.new(1, 0);
                v2950.Transparency = NumberSequence.new({
                    v2954, 
                    v2953, 
                    v2952, 
                    v2955
                });
            end);
        end;
        v2956(l_UIGradient_4);
        v2956(l_UIGradient_5);
        v2930(0.9);
        local v2957 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        l_TweenService_1:Create(l_StatusText_0, v2957, {
            Position = UDim2.new(0, 20, 0, 120), 
            TextTransparency = 0
        }):Play();
        l_TweenService_1:Create(l_ProgressBar_0, v2957, {
            Position = UDim2.new(0, 60, 0, 145), 
            Size = UDim2.new(0, 100, 0, 4)
        }):Play();
        v2930(0.25);
        return {
            SetProgress = function(v2958, v2959) --[[ Line: 10810 ]] --[[ Name: setProgress ]]
                l_StatusText_0.Text = v2958;
                l_TweenService_1:Create(l_ProgressBar_0.Bar, v2957, {
                    Size = UDim2.new(v2959, 0, 1, 0)
                }):Play();
            end, 
            Close = function() --[[ Line: 10815 ]] --[[ Name: close ]]
                l_TweenService_1:Create(l_Title_0, v2957, {
                    TextTransparency = 1
                }):Play();
                l_TweenService_1:Create(l_Desc_0, v2957, {
                    TextTransparency = 1
                }):Play();
                l_TweenService_1:Create(l_Version_0, v2957, {
                    TextTransparency = 1
                }):Play();
                l_TweenService_1:Create(l_Creator_0, v2957, {
                    TextTransparency = 1
                }):Play();
                l_TweenService_1:Create(l_StatusText_0, v2957, {
                    TextTransparency = 1
                }):Play();
                l_TweenService_1:Create(l_ProgressBar_0, v2957, {
                    BackgroundTransparency = 1
                }):Play();
                l_TweenService_1:Create(l_ProgressBar_0.Bar, v2957, {
                    BackgroundTransparency = 1
                }):Play();
                l_TweenService_1:Create(l_ProgressBar_0.ImageLabel, v2957, {
                    ImageTransparency = 1
                }):Play();
                v2936(100, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), function(v2960) --[[ Line: 10825 ]]
                    v2960 = v2960 / 250;
                    local v2961 = NumberSequenceKeypoint.new(0, 0);
                    local v2962 = NumberSequenceKeypoint.new(0.6 + v2960, 0);
                    local v2963 = NumberSequenceKeypoint.new(math.min(1, 0.601 + v2960), 1);
                    if v2962.Time == v2963.Time then
                        v2963 = v2962;
                    end;
                    local v2964 = NumberSequenceKeypoint.new(1, v2962 == v2963 and 0 or 1);
                    l_UIGradient_3.Transparency = NumberSequence.new({
                        v2961, 
                        v2962, 
                        v2963, 
                        v2964
                    });
                end);
                v2930(0.5);
                v2913.Main.BackgroundTransparency = 1;
                l_UIGradient_2.Rotation = 30;
                v2936(100, v2937, function(v2965) --[[ Line: 10839 ]]
                    v2965 = v2965 / 100;
                    local v2966 = NumberSequenceKeypoint.new(0, 1);
                    local v2967 = NumberSequenceKeypoint.new(v2965, 1);
                    local v2968 = NumberSequenceKeypoint.new(math.min(1, v2965 + math.min(0.05, v2965)), 0);
                    if v2967.Time == v2968.Time then
                        v2968 = v2967;
                    end;
                    local v2969 = NumberSequenceKeypoint.new(1, v2967 == v2968 and 1 or 0);
                    l_UIGradient_2.Transparency = NumberSequence.new({
                        v2966, 
                        v2967, 
                        v2968, 
                        v2969
                    });
                    l_UIGradient_3.Transparency = NumberSequence.new({
                        v2966, 
                        v2967, 
                        v2968, 
                        v2969
                    });
                end);
                v2930(0.45);
                v2913:Destroy();
            end
        };
    end;
    v2776.CreateApp = function(v2970) --[[ Line: 10857 ]]
        if v2776.MenuApps[v2970.Name] then
            return;
        else
            local v2971 = {};
            local v2972 = v2776.AppTemplate:Clone();
            local l_Icon_0 = v2970.Icon;
            if v2970.IconMap and l_Icon_0 then
                if type(l_Icon_0) == "number" then
                    v2970.IconMap:Display(v2972.Main.Icon, l_Icon_0);
                elseif type(l_Icon_0) == "string" then
                    v2970.IconMap:DisplayByKey(v2972.Main.Icon, l_Icon_0);
                end;
            elseif type(l_Icon_0) == "string" then
                v2972.Main.Icon.Image = l_Icon_0;
            else
                v2972.Main.Icon.Image = "";
            end;
            local function v2974() --[[ Line: 10876 ]] --[[ Name: updateState ]]
                v2972.Main.BackgroundTransparency = v2970.Open and 0 or v2749.CheckMouseInGui(v2972.Main) and 0 or 1;
                v2972.Main.Highlight.Visible = v2970.Open;
            end;
            local function v2976(v2975) --[[ Line: 10881 ]] --[[ Name: enable ]]
                if v2970.Open then
                    return;
                else
                    v2970.Open = true;
                    v2974();
                    if not v2975 then
                        if v2970.Window then
                            v2970.Window:Show();
                        end;
                        if v2970.OnClick then
                            v2970.OnClick(v2970.Open);
                        end;
                    end;
                    return;
                end;
            end;
            local function v2978(v2977) --[[ Line: 10891 ]] --[[ Name: disable ]]
                if not v2970.Open then
                    return;
                else
                    v2970.Open = false;
                    v2974();
                    if not v2977 then
                        if v2970.Window then
                            v2970.Window:Hide();
                        end;
                        if v2970.OnClick then
                            v2970.OnClick(v2970.Open);
                        end;
                    end;
                    return;
                end;
            end;
            v2974();
            local l_Y_14 = v2759.TextService:GetTextSize(v2970.Name, 14, Enum.Font.SourceSans, Vector2.new(62, 999999)).Y;
            v2972.Main.Size = UDim2.new(1, 0, 0, (math.clamp(46 + l_Y_14, 60, 74)));
            v2972.Main.AppName.Text = v2970.Name;
            v2972.Main.InputBegan:Connect(function(v2980) --[[ Line: 10907 ]]
                if v2980.UserInputType == Enum.UserInputType.MouseMovement then
                    v2972.Main.BackgroundTransparency = 0;
                    v2972.Main.BackgroundColor3 = v2753.Theme.ButtonHover;
                end;
            end);
            v2972.Main.InputEnded:Connect(function(v2981) --[[ Line: 10914 ]]
                if v2981.UserInputType == Enum.UserInputType.MouseMovement then
                    v2972.Main.BackgroundTransparency = v2970.Open and 0 or 1;
                    v2972.Main.BackgroundColor3 = v2753.Theme.Button;
                end;
            end);
            v2972.Main.MouseButton1Click:Connect(function() --[[ Line: 10921 ]]
                if v2970.Open then
                    v2978();
                    return;
                else
                    v2976();
                    return;
                end;
            end);
            local l_Window_0 = v2970.Window;
            if l_Window_0 then
                l_Window_0.OnActivate:Connect(function() --[[ Line: 10927 ]]
                    v2976(true);
                end);
                l_Window_0.OnDeactivate:Connect(function() --[[ Line: 10928 ]]
                    v2978(true);
                end);
            end;
            v2972.Visible = true;
            v2972.Parent = v2776.AppsContainer;
            v2776.AppsFrame.CanvasSize = UDim2.new(0, 0, 0, v2776.AppsContainerGrid.AbsoluteCellCount.Y * 82 + 8);
            v2971.Enable = v2976;
            v2971.Disable = v2978;
            v2776.MenuApps[v2970.Name] = v2971;
            return v2971;
        end;
    end;
    v2776.SetMainGuiOpen = function(v2983) --[[ Line: 10941 ]]
        v2776.MainGuiOpen = v2983;
        v2776.MainGui.OpenButton.Text = v2983 and "X" or "Dex";
        if v2983 then
            v2776.MainGui.OpenButton.MainFrame.Visible = true;
        end;
        v2776.MainGui.OpenButton.MainFrame:TweenSize(v2983 and UDim2.new(0, 224, 0, 200) or UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
        v2759.TweenService:Create(v2776.MainGui.OpenButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = v2983 and 0 or v2749.CheckMouseInGui(v2776.MainGui.OpenButton) and 0 or 0.2
        }):Play();
        if v2776.MainGuiMouseEvent then
            v2776.MainGuiMouseEvent:Disconnect();
        end;
        if not v2983 then
            local v2984 = tick();
            v2776.MainGuiCloseTime = v2984;
            coroutine.wrap(function() --[[ Line: 10955 ]]
                v2749.FastWait(0.2);
                if not v2776.MainGuiOpen and v2984 == v2776.MainGuiCloseTime then
                    v2776.MainGui.OpenButton.MainFrame.Visible = false;
                end;
            end)();
            return;
        else
            v2776.MainGuiMouseEvent = v2759.UserInputService.InputBegan:Connect(function(v2985) --[[ Line: 10960 ]]
                if v2985.UserInputType == Enum.UserInputType.MouseButton1 and not v2749.CheckMouseInGui(v2776.MainGui.OpenButton) and not v2749.CheckMouseInGui(v2776.MainGui.OpenButton.MainFrame) then
                    v2776.SetMainGuiOpen(false);
                end;
            end);
            return;
        end;
    end;
    v2776.CreateMainGui = function() --[[ Line: 10968 ]]
        local v2986 = v2769({
            {
                1, 
                "ScreenGui", 
                {
                    IgnoreGuiInset = true, 
                    Name = "MainMenu"
                }
            }, 
            {
                2, 
                "TextButton", 
                {
                    AnchorPoint = Vector2.new(0.5, 0), 
                    AutoButtonColor = false, 
                    BackgroundColor3 = Color3.new(0.17647059261799, 0.17647059261799, 0.17647059261799), 
                    BorderSizePixel = 0, 
                    Font = 4, 
                    Name = "OpenButton", 
                    Parent = {
                        1
                    }, 
                    Position = UDim2.new(0.5, 0, 0, 2), 
                    Size = UDim2.new(0, 32, 0, 32), 
                    Text = "Dex", 
                    TextColor3 = Color3.new(1, 1, 1), 
                    TextSize = 16, 
                    TextTransparency = 0.20000000298023
                }
            }, 
            {
                3, 
                "UICorner", 
                {
                    CornerRadius = UDim.new(0, 4), 
                    Parent = {
                        2
                    }
                }
            }, 
            {
                4, 
                "Frame", 
                {
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundColor3 = Color3.new(0.17647059261799, 0.17647059261799, 0.17647059261799), 
                    ClipsDescendants = true, 
                    Name = "MainFrame", 
                    Parent = {
                        2
                    }, 
                    Position = UDim2.new(0.5, 0, 1, -4), 
                    Size = UDim2.new(0, 224, 0, 200)
                }
            }, 
            {
                5, 
                "UICorner", 
                {
                    CornerRadius = UDim.new(0, 4), 
                    Parent = {
                        4
                    }
                }
            }, 
            {
                6, 
                "Frame", 
                {
                    BackgroundColor3 = Color3.new(0.20392157137394, 0.20392157137394, 0.20392157137394), 
                    Name = "BottomFrame", 
                    Parent = {
                        4
                    }, 
                    Position = UDim2.new(0, 0, 1, -24), 
                    Size = UDim2.new(1, 0, 0, 24)
                }
            }, 
            {
                7, 
                "UICorner", 
                {
                    CornerRadius = UDim.new(0, 4), 
                    Parent = {
                        6
                    }
                }
            }, 
            {
                8, 
                "Frame", 
                {
                    BackgroundColor3 = Color3.new(0.20392157137394, 0.20392157137394, 0.20392157137394), 
                    BorderSizePixel = 0, 
                    Name = "CoverFrame", 
                    Parent = {
                        6
                    }, 
                    Size = UDim2.new(1, 0, 0, 4)
                }
            }, 
            {
                9, 
                "Frame", 
                {
                    BackgroundColor3 = Color3.new(0.1294117718935, 0.1294117718935, 0.1294117718935), 
                    BorderSizePixel = 0, 
                    Name = "Line", 
                    Parent = {
                        8
                    }, 
                    Position = UDim2.new(0, 0, 0, -1), 
                    Size = UDim2.new(1, 0, 0, 1)
                }
            }, 
            {
                10, 
                "TextButton", 
                {
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    BackgroundTransparency = 1, 
                    Font = 3, 
                    Name = "Settings", 
                    Parent = {
                        6
                    }, 
                    Position = UDim2.new(1, -48, 0, 0), 
                    Size = UDim2.new(0, 24, 1, 0), 
                    Text = "", 
                    TextColor3 = Color3.new(1, 1, 1), 
                    TextSize = 14
                }
            }, 
            {
                11, 
                "ImageLabel", 
                {
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    BackgroundTransparency = 1, 
                    Image = "rbxassetid://6578871732", 
                    ImageTransparency = 0.20000000298023, 
                    Name = "Icon", 
                    Parent = {
                        10
                    }, 
                    Position = UDim2.new(0, 4, 0, 4), 
                    Size = UDim2.new(0, 16, 0, 16)
                }
            }, 
            {
                12, 
                "TextButton", 
                {
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    BackgroundTransparency = 1, 
                    Font = 3, 
                    Name = "Information", 
                    Parent = {
                        6
                    }, 
                    Position = UDim2.new(1, -24, 0, 0), 
                    Size = UDim2.new(0, 24, 1, 0), 
                    Text = "", 
                    TextColor3 = Color3.new(1, 1, 1), 
                    TextSize = 14
                }
            }, 
            {
                13, 
                "ImageLabel", 
                {
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    BackgroundTransparency = 1, 
                    Image = "rbxassetid://6578933307", 
                    ImageTransparency = 0.20000000298023, 
                    Name = "Icon", 
                    Parent = {
                        12
                    }, 
                    Position = UDim2.new(0, 4, 0, 4), 
                    Size = UDim2.new(0, 16, 0, 16)
                }
            }, 
            {
                14, 
                "ScrollingFrame", 
                {
                    Active = true, 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    BackgroundTransparency = 1, 
                    BorderColor3 = Color3.new(0.1294117718935, 0.1294117718935, 0.1294117718935), 
                    BorderSizePixel = 0, 
                    Name = "AppsFrame", 
                    Parent = {
                        4
                    }, 
                    Position = UDim2.new(0.5, 0, 0, 0), 
                    ScrollBarImageColor3 = Color3.new(0, 0, 0), 
                    ScrollBarThickness = 4, 
                    Size = UDim2.new(0, 222, 1, -25)
                }
            }, 
            {
                15, 
                "Frame", 
                {
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    BackgroundTransparency = 1, 
                    Name = "Container", 
                    Parent = {
                        14
                    }, 
                    Position = UDim2.new(0, 7, 0, 8), 
                    Size = UDim2.new(1, -14, 0, 2)
                }
            }, 
            {
                16, 
                "UIGridLayout", 
                {
                    CellSize = UDim2.new(0, 66, 0, 74), 
                    Parent = {
                        15
                    }, 
                    SortOrder = 2
                }
            }, 
            {
                17, 
                "Frame", 
                {
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    BackgroundTransparency = 1, 
                    Name = "App", 
                    Parent = {
                        1
                    }, 
                    Size = UDim2.new(0, 100, 0, 100), 
                    Visible = false
                }
            }, 
            {
                18, 
                "TextButton", 
                {
                    AutoButtonColor = false, 
                    BackgroundColor3 = Color3.new(0.2352941185236, 0.2352941185236, 0.2352941185236), 
                    BorderSizePixel = 0, 
                    Font = 3, 
                    Name = "Main", 
                    Parent = {
                        17
                    }, 
                    Size = UDim2.new(1, 0, 0, 60), 
                    Text = "", 
                    TextColor3 = Color3.new(0, 0, 0), 
                    TextSize = 14
                }
            }, 
            {
                19, 
                "ImageLabel", 
                {
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    BackgroundTransparency = 1, 
                    Image = "rbxassetid://6579106223", 
                    ImageRectSize = Vector2.new(32, 32), 
                    Name = "Icon", 
                    Parent = {
                        18
                    }, 
                    Position = UDim2.new(0.5, -16, 0, 4), 
                    ScaleType = 4, 
                    Size = UDim2.new(0, 32, 0, 32)
                }
            }, 
            {
                20, 
                "TextLabel", 
                {
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Font = 3, 
                    Name = "AppName", 
                    Parent = {
                        18
                    }, 
                    Position = UDim2.new(0, 2, 0, 38), 
                    Size = UDim2.new(1, -4, 1, -40), 
                    Text = "Explorer", 
                    TextColor3 = Color3.new(1, 1, 1), 
                    TextSize = 14, 
                    TextTransparency = 0.10000000149012, 
                    TextTruncate = 1, 
                    TextWrapped = true, 
                    TextYAlignment = 0
                }
            }, 
            {
                21, 
                "Frame", 
                {
                    BackgroundColor3 = Color3.new(0, 0.66666668653488, 1), 
                    BorderSizePixel = 0, 
                    Name = "Highlight", 
                    Parent = {
                        18
                    }, 
                    Position = UDim2.new(0, 0, 1, -2), 
                    Size = UDim2.new(1, 0, 0, 2)
                }
            }
        });
        v2776.MainGui = v2986;
        v2776.AppsFrame = v2986.OpenButton.MainFrame.AppsFrame;
        v2776.AppsContainer = v2776.AppsFrame.Container;
        v2776.AppsContainerGrid = v2776.AppsContainer.UIGridLayout;
        v2776.AppTemplate = v2986.App;
        v2776.MainGuiOpen = false;
        local l_OpenButton_0 = v2986.OpenButton;
        l_OpenButton_0.BackgroundTransparency = 0.2;
        l_OpenButton_0.MainFrame.Size = UDim2.new(0, 0, 0, 0);
        l_OpenButton_0.MainFrame.Visible = false;
        l_OpenButton_0.MouseButton1Click:Connect(function() --[[ Line: 11003 ]]
            v2776.SetMainGuiOpen(not v2776.MainGuiOpen);
        end);
        l_OpenButton_0.InputBegan:Connect(function(v2988) --[[ Line: 11007 ]]
            if v2988.UserInputType == Enum.UserInputType.MouseMovement then
                v2759.TweenService:Create(v2776.MainGui.OpenButton, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundTransparency = 0
                }):Play();
            end;
        end);
        l_OpenButton_0.InputEnded:Connect(function(v2989) --[[ Line: 11013 ]]
            if v2989.UserInputType == Enum.UserInputType.MouseMovement then
                v2759.TweenService:Create(v2776.MainGui.OpenButton, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundTransparency = v2776.MainGuiOpen and 0 or 0.2
                }):Play();
            end;
        end);
        v2776.CreateApp({
            Name = "Explorer", 
            IconMap = v2776.LargeIcons, 
            Icon = "Explorer", 
            Open = true, 
            Window = v2743.Window
        });
        v2776.CreateApp({
            Name = "Properties", 
            IconMap = v2776.LargeIcons, 
            Icon = "Properties", 
            Open = true, 
            Window = v2744.Window
        });
        v2776.CreateApp({
            Name = "Script Viewer", 
            IconMap = v2776.LargeIcons, 
            Icon = "Script_Viewer", 
            Window = v2745.Window
        });
        local v2990 = nil;
        v2776.CreateApp({
            Name = "Click part to select", 
            IconMap = v2776.LargeIcons, 
            Icon = 6, 
            OnClick = function(v2991) --[[ Line: 11027 ]] --[[ Name: OnClick ]]
                if v2991 then
                    local l_Mouse_7 = v2776.Mouse;
                    v2990 = l_Mouse_7.Button1Down:Connect(function() --[[ Line: 11030 ]]
                        pcall(function() --[[ Line: 11031 ]]
                            local l_Target_0 = l_Mouse_7.Target;
                            if v0[l_Target_0] then
                                v1:Set(v0[l_Target_0]);
                                v2743.ViewNode(v0[l_Target_0]);
                            end;
                        end);
                    end);
                    return;
                else
                    if v2990 ~= nil then
                        v2990:Disconnect();
                        v2990 = nil;
                    end;
                    return;
                end;
            end
        });
        v2749.ShowGui(v2986);
    end;
    v2776.SetupFilesystem = function() --[[ Line: 11045 ]]
        if not v2755.writefile or not v2755.makefolder then
            return;
        else
            local __ = v2755.writefile;
            local l_makefolder_0 = v2755.makefolder;
            l_makefolder_0("dex");
            l_makefolder_0("dex/assets");
            l_makefolder_0("dex/saved");
            l_makefolder_0("dex/plugins");
            l_makefolder_0("dex/ModuleCache");
            return;
        end;
    end;
    v2776.LocalDepsUpToDate = function() --[[ Line: 11055 ]]
        return v2776.DepsVersionData and v2776.ClientVersion == v2776.DepsVersionData[1];
    end;
    v2776.Init = function() --[[ Line: 11059 ]]
        v2776.Elevated = pcall(function() --[[ Line: 11060 ]]
            local __ = v2(game:GetService("CoreGui")):GetFullName();
        end);
        v2776.InitEnv();
        v2776.LoadSettings();
        v2776.SetupFilesystem();
        local v2997 = v2776.CreateIntro("Initializing Library");
        v2749 = v2776.LoadModule("Lib");
        v2749.FastWait();
        v2776.MiscIcons = v2749.IconMap.new("rbxassetid://6511490623", 256, 256, 16, 16);
        v2776.MiscIcons:SetDict({
            Reference = 0, 
            Cut = 1, 
            Cut_Disabled = 2, 
            Copy = 3, 
            Copy_Disabled = 4, 
            Paste = 5, 
            Paste_Disabled = 6, 
            Delete = 7, 
            Delete_Disabled = 8, 
            Group = 9, 
            Group_Disabled = 10, 
            Ungroup = 11, 
            Ungroup_Disabled = 12, 
            TeleportTo = 13, 
            Rename = 14, 
            JumpToParent = 15, 
            ExploreData = 16, 
            Save = 17, 
            CallFunction = 18, 
            CallRemote = 19, 
            Undo = 20, 
            Undo_Disabled = 21, 
            Redo = 22, 
            Redo_Disabled = 23, 
            Expand_Over = 24, 
            Expand = 25, 
            Collapse_Over = 26, 
            Collapse = 27, 
            SelectChildren = 28, 
            SelectChildren_Disabled = 29, 
            InsertObject = 30, 
            ViewScript = 31, 
            AddStar = 32, 
            RemoveStar = 33, 
            Script_Disabled = 34, 
            LocalScript_Disabled = 35, 
            Play = 36, 
            Pause = 37, 
            Rename_Disabled = 38
        });
        v2776.LargeIcons = v2749.IconMap.new("rbxassetid://6579106223", 256, 256, 32, 32);
        v2776.LargeIcons:SetDict({
            Explorer = 0, 
            Properties = 1, 
            Script_Viewer = 2
        });
        v2997.SetProgress("Fetching Roblox Version", 0.2);
        if v2776.Elevated then
            local v2998 = v2749.ReadFile("dex/deps_version.dat");
            v2776.ClientVersion = Version();
            if v2998 then
                v2776.DepsVersionData = string.split(v2998, "\n");
                if v2776.LocalDepsUpToDate() then
                    v2776.RobloxVersion = v2776.DepsVersionData[2];
                end;
            end;
            v2776.RobloxVersion = v2776.RobloxVersion or game:HttpGet("http://setup.roblox.com/versionQTStudio");
        end;
        v2997.SetProgress("Fetching API", 0.35);
        v2750 = v2776.FetchAPI();
        v2749.FastWait();
        v2997.SetProgress("Fetching RMD", 0.5);
        v2751 = v2776.FetchRMD();
        v2749.FastWait();
        if v2776.Elevated and v2755.writefile and not v2776.LocalDepsUpToDate() then
            v2755.writefile("dex/deps_version.dat", v2776.ClientVersion .. "\n" .. v2776.RobloxVersion);
            v2755.writefile("dex/rbx_api.dat", v2776.RawAPI);
            v2755.writefile("dex/rbx_rmd.dat", v2776.RawRMD);
        end;
        v2997.SetProgress("Loading Modules", 0.75);
        v2776.AppControls.Lib.InitDeps(v2776.GetInitDeps());
        v2776.LoadModules();
        v2749.FastWait();
        v2997.SetProgress("Initializing Modules", 0.9);
        v2743.Init();
        v2744.Init();
        v2745.Init();
        v2749.FastWait();
        v2997.SetProgress("Complete", 1);
        coroutine.wrap(function() --[[ Line: 11132 ]]
            v2749.FastWait(1.25);
            v2997.Close();
        end)();
        v2749.Window.Init();
        v2776.CreateMainGui();
        v2743.Window:Show({
            Align = "right", 
            Pos = 1, 
            Size = 0.5, 
            Silent = true
        });
        v2744.Window:Show({
            Align = "right", 
            Pos = 2, 
            Size = 0.5, 
            Silent = true
        });
        v2749.DeferFunc(function() --[[ Line: 11142 ]]
            v2749.Window.ToggleSide("right");
        end);
    end;
    return v2776;
end)().Init();
