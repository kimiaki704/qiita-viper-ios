closeXcode("QiitaVIPER.xcodeproj")

on closeXcode(workspaceName)
  tell application "Xcode"
    set workspace to windows where name of document of it = workspaceName
    if length of workspace > 0 then
      return close workspace
    else
      return false
    end if
  end tell
end closeXcode
