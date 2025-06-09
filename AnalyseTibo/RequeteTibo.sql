" Affichage des editeurs classer par leur total de vente avant 2016"
SELECT
    p.pub_name AS Editeur,
    SUM(s.sal_quantite) AS Total_Ventes
FROM
    MINI_SALES s
    JOIN MINI_GAME g ON s.gam_id = g.gam_id
    JOIN MINI_PUBLISHER p ON g.pub_id = p.pub_id
WHERE
    TO_NUMBER(g.gam_year) < 2016
GROUP BY
    p.pub_name
ORDER BY
    Total_Ventes DESC;

"Avoir toute les jeux de EA classé par nombre de vente"
SELECT
    g.gam_name AS Jeu,
    g.gam_year AS Annee,
    SUM(s.sal_quantite) AS Total_Ventes
FROM
    MINI_SALES s
    JOIN MINI_GAME g ON s.gam_id = g.gam_id
    JOIN MINI_PUBLISHER p ON g.pub_id = p.pub_id
WHERE
    p.pub_name = 'Electronic Arts'
GROUP BY
    g.gam_name,
    g.gam_year
ORDER BY
    Total_Ventes DESC;

"Total des ventes pour chaque genr ede jeux par region"
SELECT
    r.reg_name AS Region,
    g.gen_name AS Genre,
    SUM(s.sal_quantite) AS Total_Ventes
FROM
    MINI_SALES s
    JOIN MINI_GAME ga ON s.gam_id = ga.gam_id
    JOIN MINI_GENRE g ON ga.gen_id = g.gen_id
    JOIN MINI_REGION r ON s.reg_id = r.reg_id
GROUP BY
    r.reg_name,
    g.gen_name
ORDER BY
    r.reg_name,
    Total_Ventes DESC;