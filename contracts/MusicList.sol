pragma solidity >=0.8.0;

contract MusicList {
  uint public musicCount = 0;

  struct Music {
    uint id;
    string content;
    bool completed;
  }

  mapping(uint => Music) public musics;

  event musicCreated(
    uint id,
    string content,
    bool completed
  );

  event musicCompleted(
    uint id,
    bool completed
  );

  constructor() public {
    createMusic("Eminem Not Afraid");
  }

  function createMusic(string memory _content) public {
    musicCount ++;
    musics[musicCount] = Music(musicCount, _content, false);
    emit musicCreated(musicCount, _content, false);
  }

  function toggleCompleted(uint _id) public {
    Music memory _music = musics[_id];
    _music.completed = !_music.completed;
    musics[_id] = _music;
    emit musicCompleted(_id, _music.completed);
  }

}