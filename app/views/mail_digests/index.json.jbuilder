# frozen_string_literal: true

json.array! @mail_digests, partial: 'mail_digests/mail_digest', as: :mail_digest
