---@class MyFirstPageDlg : BaseDlg
---@field _humanImage CS.UnityEngine.UI.Image
---@field _switchButton CS.UnityEngine.UI.Button
---@field _switchText CS.UnityEngine.UI.Text
---@field _titleText CS.UnityEngine.UI.Text
---@field _descriptionText CS.UnityEngine.UI.Text
---@field _isRight boolean
MyFirstPageDlg = DefineInheritedClass(MyFirstPageDlg, BaseDlg)

---@return string
function MyFirstPageDlg:GetPrefabPath()
    -- todo (prefab路径可以通过右键菜单 - Copy Path获取)
    return "Assets/Assets_UI/MyFirstPage/Prefab/MyFirstPageDlg.prefab"
end

---@return string
function MyFirstPageDlg:GetLayerName()
    -- todo
    return DlgLayer.Middle
end

function MyFirstPageDlg:_OnInit()

    self._humanImage = self:GetUIImage("Image_Human")
    self._switchButton = self:GetUIButton("Button_Switch")
    self:RegisterButtonClick(self._switchButton, self._SwitchOnClick)
    self._switchText = self:GetUIText("Text_Switch")
    self._titleText = self:GetUIText("Text_Title")
    self._descriptionText = self:GetUIText("Text_Description")


    self._titleText.text = "这里是标题"
    self._descriptionText.text = "这里有很多很多很多很多很多很多很多很多很多很多很多描述"
    
    self._isRight = true

    self:_RefreshSwitchState()
end

function MyFirstPageDlg:_OnVisible(visible)
    -- todo
end

function MyFirstPageDlg:_OnWillClose()
    -- todo
end

function MyFirstPageDlg:_OnDestroy()
    -- todo
end

function MyFirstPageDlg:_SwitchOnClick()
    self._isRight = not self._isRight
    self:_RefreshSwitchState()
end

function MyFirstPageDlg:_RefreshSwitchState()
    if (self._isRight) then
        self._switchText.text = "朝左看"
        self._humanImage.transform.localScale = CS.UnityEngine.Vector3(1, 1, 1)
    else
        self._switchText.text = "朝右看"
        self._humanImage.transform.localScale = CS.UnityEngine.Vector3(-1, 1, 1)
    end
end