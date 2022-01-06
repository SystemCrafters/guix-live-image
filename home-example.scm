(use-modules (gnu home)
             (gnu home services)
             (gnu home services shepherd)
             (gnu home services shells)
             (gnu packages emacs)
             (gnu packages syncthing)
             (gnu services)
             (gnu services shepherd)
             (guix gexp))

(define my-syncthing-service
  (shepherd-service
   (provision '(syncthing))
   (documentation "Run and control syncthing.")
   (start #~(make-forkexec-constructor '("syncthing" "-no-browser")))
   (stop #~(make-kill-destructor))))

(home-environment
 (packages (list emacs syncthing))
 (services
  (list
   (service home-bash-service-type
            (home-bash-configuration
             (environment-variables
              '(("VISUAL" . "emacsclient")
                ("EDITOR" . "emacsclient")))))
   (simple-service 'my-services
                   home-shepherd-service-type
                   (list my-syncthing-service)))))
