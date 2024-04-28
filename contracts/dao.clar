
;; Track yields received by each principal
(define-map received-yields
  { recipient: principal }
  { balance: uint })

;; Function to receive yield from the staking contract
(define-public (receive-yield (sender principal) (amount uint))
  (let ((current-balance (get balance (unwrap! (map-get? received-yields { recipient: sender }) (err "No balance found")))))
    ;; Update the balance of yields for the sender
    (map-set received-yields
      { recipient: sender }
      { balance: (+ current-balance amount) })
    (ok amount)))