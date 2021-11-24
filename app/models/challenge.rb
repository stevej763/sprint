class Challenge < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    has_one_attached :badge
    has_one_attached :icon

    def checkpoint_complete?(current_distance, index)
        if current_distance >= self.calcualte_target_distance(index)
            "complete"
        end
    end

    private

    def calcualte_target_distance(index)
        (index+1) * self.checkpoint_split
    end

    def checkpoint_split
        self.distance / self.checkpoints.count.to_f
    end


end
