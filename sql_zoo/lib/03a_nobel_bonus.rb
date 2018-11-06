# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

# BONUS PROBLEM: requires sub-queries or joins. Attempt this after completing
# sections 04 and 07.

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
    SELECT
      yr
    FROM
      (SELECT
        DISTINCT yr
      FROM
        nobels
      WHERE
        subject = 'Physics') AS years_with_physics_prize
    WHERE
      yr NOT IN
      (SELECT
        DISTINCT yr
      FROM
        nobels
      WHERE
        subject = 'Chemistry') AS years_with_chemistry_prize;
  SQL
end
