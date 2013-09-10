(setq cc-other-file-alist
  '(("\\.c"   (".h"".hpp"))
    ("\\.cpp" (".h"".hpp"))
    ("\\.h"   (".c"".cpp"))
    ("\\.hpp" (".c"".cpp"))))

(setq ff-search-directories '("."))

(global-set-key "\M-s" 'ff-find-other-file)
