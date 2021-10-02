class Utils::Rank
  def self.set_rank_score count, created_at
    start = Time.mktime(2021,10,1).to_i
    displacement = Math.log( [count, 1].max,  10 )
    (displacement + (created_at.to_i - start.to_i) / 45000.0).round(4)
  end
end