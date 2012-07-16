BSalt
=====

A theoretical student and curriculum management system for IF battle school.

Purposes:
Commandants:
-- Track potential recruits (all chilren on earth under age 8)
-- Track student progress
-- Read student messages
-- send messages as students
-- track social relationships between students
-- make notes on students
Teachers:
-- give assignments/marks
-- send/read messages
Students
-- View own progress, assignments, marks.
-- send/read messages


Model
Prospect: a potential recruit. That is, any child younger than... 8?
-- age
factors which determine suitability
-- competativeness
-- agression
-- creativity
-- et al.
-- nationality (country code)
-- alternate loyalty (nullable string)
-- notes
-- birthplace
-- name
-- parents/guardian names
Student: a current student of battle school. the above, plus
-- relationships with other students
-- platoon membership (or launchie)
---- through rank
-- progress in videogame
-- marks in classes
-- messages sent
-- inturrupt bit on a message sent to another student?
-- inturrupt bit always set on messages outside of school.
-- instructor notes
-- commandant notes (visibility variable)
-- bunk number
Instructor
-- classes taught
-- messages sent
Class
-- quadrester given (apogee, perogee, post-perogee, post-apogee)
-- students through marks
-- subject
-- instructor
-- assignments
-- readings
-- prereqs
-- times (Assume that the station is in Geosynchromous orbit.)
-- forum
Platoon
-- students (through rank)
-- games
-- dorm number
Games
-- contesting teams (assume mono vs. mono)
-- time
-- shots
    Shot
    -- game
    -- player from
    -- player to (nil if miss)
    -- player to_part (nil if miss)
-- Winning team (nil if draw)
-- arena number

Command School Members
(same as cadets. move over and don't do anything with)
