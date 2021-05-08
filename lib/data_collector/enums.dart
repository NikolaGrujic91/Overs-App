enum League {
  None,
  England1,
  England2,
  Scotland1,
  Germany1,
  Germany2,
  Italy1,
  Italy2,
  Spain1,
  France1,
  France2,
  Netherlands1,
  Belgium1,
  Portugal1,
  Turkey1,
  Greece1
}

League stringToLeagueEnum(String value) {
  if (value == 'E0') {
    return League.England1;
  }

  if (value == 'E1') {
    return League.England2;
  }

  if (value == 'SC0') {
    return League.Scotland1;
  }

  if (value == 'D1') {
    return League.Germany1;
  }

  if (value == 'D2') {
    return League.Germany2;
  }

  if (value == 'I1') {
    return League.Italy1;
  }

  if (value == 'I2') {
    return League.Italy2;
  }

  if (value == 'SP1') {
    return League.Spain1;
  }

  if (value == 'F1') {
    return League.France1;
  }

  if (value == 'F2') {
    return League.France2;
  }

  if (value == 'N1') {
    return League.Netherlands1;
  }

  if (value == 'B1') {
    return League.Belgium1;
  }

  if (value == 'P1') {
    return League.Portugal1;
  }

  if (value == 'T1') {
    return League.Turkey1;
  }

  if (value == 'G1') {
    return League.Greece1;
  }

  return League.None;
}