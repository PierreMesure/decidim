# frozen_string_literal: true

module Decidim
  module Elections
    # The data store for an Election in the Decidim::Elections component. It stores a
    # title, description and any other useful information to perform an election.
    class Election < ApplicationRecord
      include Decidim::Resourceable
      include Decidim::HasComponent
      include Traceable
      include Loggable

      component_manifest_name "elections"

      has_many :questions, foreign_key: "decidim_elections_election_id", class_name: "Decidim::Elections::Question", inverse_of: :election, dependent: :destroy

      def started?
        start_time <= Time.current
      end
    end
  end
end
