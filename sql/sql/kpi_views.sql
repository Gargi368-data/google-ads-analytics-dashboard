CREATE OR REPLACE VIEW ads_kpis AS
SELECT
  week_start,
  campaign,
  channel,
  SUM(impressions) AS impressions,
  SUM(clicks) AS clicks,
  SUM(cost) AS cost,
  SUM(conversions) AS conversions,
  (SUM(clicks)::numeric / NULLIF(SUM(impressions),0)) AS ctr,
  (SUM(cost)::numeric / NULLIF(SUM(clicks),0)) AS cpc,
  (SUM(conversions)::numeric / NULLIF(SUM(clicks),0)) AS conversion_rate
FROM google_ads_weekly
GROUP BY week_start, campaign, channel;

