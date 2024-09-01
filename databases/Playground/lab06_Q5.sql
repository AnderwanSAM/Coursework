/*. Lister les name et le country de naissance de tous les artists dont le
style de peinture est Modern, Baroque or Renaissance. (ASTUCE:
utilisez le mot-clé IN).*/


SELECT name, birthplace
FROM artists
WHERE style IN ('Modern','Baroque','Renaissance');