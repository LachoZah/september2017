require 'csv'

path = ARGV[0]
users = CSV.read(path)

def GetMostWatchedVideo(users)
    mostWatchedVideoTime = 0
    mostWatchedVideo = 0

    users.each_with_index do |user, index|

        i = index + 1
        currentVideo = user[1]
        watchedTime = user[2].to_f
        while i < users.length
            if(currentVideo == users[i][1])
                watchedTime += users[i][2].to_f
            end

            i += 1
        end

        if(mostWatchedVideoTime < watchedTime)
            mostWatchedVideoTime = watchedTime
            mostWatchedVideo = currentVideo
        end
    end

    mostWatchedVideoTime = RoundNumber(mostWatchedVideoTime)
    puts mostWatchedVideo.to_s + ',' + mostWatchedVideoTime.to_s
end

GetMostWatchedVideo(users)
