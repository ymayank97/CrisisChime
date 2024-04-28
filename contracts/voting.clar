
;; ;; (define-read-only (get-staker-balance (address (buff 20)))
;; ;;   (get-staked-balance address)
;; ;; )

;; (define-read-only (get-vote (proposal-id uint) (address (buff 20)))
;;   (let ((proposal (map-get (var-get proposals) proposal-id (err "Proposal not found"))))
;;     (map-get (var-get votes) address 0)
;;   )
;; )

;; (define-read-only (get-proposal (proposal-id uint))
;;   (map-get (var-get proposals) proposal-id (err "Proposal not found"))
;; )

;; (define-read-only (get-proposal-count)
;;   (map-count (var-get proposals))
;; )

;; (define-read-only (get-proposal-status (proposal-id uint))
;;   (let ((proposal (map-get (var-get proposals) proposal-id (err "Proposal not found"))))
;;     (tuple-get proposal 4)
;;   )
;; )

;; (define-read-only (get-proposal-description (proposal-id uint))
;;   (let ((proposal (map-get (var-get proposals) proposal-id (err "Proposal not found"))))
;;     (tuple-get proposal 1)
;;   )
;; )

;; (define-transaction (create-proposal (description (buff 100)))
;;   (create-proposal description)
;; )

;; (define-transaction (vote-on-proposal (proposal-id uint) (vote bool))
;;   (vote-on-proposal proposal-id vote)
;; )

;; (define-transaction (execute-proposal (proposal-id uint))
;;   (ok
;;     (begin
;;       (let ((proposal (map-get (var-get proposals) proposal-id (err "Proposal not found"))))
;;         (assert
;;           (and
;;             (= (map-get (var-get votes) (var-get tx-sender) 0) 1)
;;             (>= (+ (tuple-get proposal 2) (tuple-get proposal 3)) 5)
;;             (tuple-get proposal 4)
;;           )
;;           "Insufficient votes or already executed or not enough support"
;;         )
;;         ; Execute the proposal
;;         (ok)
;;       )
;;     )
;;   )
;; )
