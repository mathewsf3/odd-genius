// Generic API response
export interface ApiResponse<T> {
  success: number;
  result: T;
}

// Country
export interface Country {
  country_key: string;
  country_name: string;
  country_logo: string;
}

export type CountryListResponse = ApiResponse<Country[]>;

// League
export interface League {
  league_key: string;
  league_name: string;
  country_key: string;
  country_name?: string;
  league_logo: string;
}

export type LeagueListResponse = ApiResponse<League[]>;

// Fixture/Match
export interface Fixture {
  event_key: string;
  event_date: string;
  event_time: string;
  event_home_team: string;
  event_away_team: string;
  event_home_team_id: string;
  event_away_team_id: string;
  event_status: string;
  event_final_result?: string;
  event_home_team_logo: string;
  event_away_team_logo: string;
  league_name: string;
  league_key: string;
  event_stadium?: string;
  home_team_logo?: string;  // Some API responses use this format
  away_team_logo?: string;
  country_name?: string;
  league_logo?: string;
}

export type FixtureListResponse = ApiResponse<Fixture[]>;
export type FixtureResponse = ApiResponse<Fixture>;